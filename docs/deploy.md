# Production Deployment Guide

## Deployment Strategies

This project supports two deployment strategies. Choose the one that matches your infrastructure.

| Strategy | Runner | Network | Use When |
|----------|--------|---------|----------|
| **Cloud VPS** | GitHub-hosted (ubuntu-latest) | SSH over internet | DigitalOcean, AWS EC2, Linode, Hetzner, Azure VM |
| **Self-Hosted** | Private GitHub runner | SSH over LAN | On-prem servers, lab environments, internal infra |

---

## 1. GitHub Secrets Configuration

Before the first deployment, configure these **Secrets** in GitHub (`Settings > Secrets and variables > Actions`):

### Cloud VPS Secrets

| Secret Name | Description | Example |
|-------------|-------------|---------|
| `DEPLOY_HOST` | Server IP or hostname | `203.0.113.50` |
| `DEPLOY_USER` | SSH username | `ubuntu` |
| `DEPLOY_SSH_KEY` | SSH private key | `-----BEGIN OPENSSH PRIVATE KEY...` |
| `PROD_ENV_FILE` | Full production `.env` contents | *(see below)* |

### Self-Hosted Secrets

| Secret Name | Description | Example |
|-------------|-------------|---------|
| `PROD_ENV_FILE` | Full production `.env` contents | *(see below)* |

> **Note:** Self-hosted runners use a local SSH key (`~/.ssh/deploy_key`) and hardcoded internal IPs. Set `HOST` and `USER` in the workflow env section.

### Production `.env` Template
```ini
# Database
POSTGRES_USER=app
POSTGRES_PASSWORD=strong_random_password_here
POSTGRES_DB=app

# Security
SECRET_KEY=very_long_random_string_at_least_32_chars
ACCESS_TOKEN_EXPIRE_MINUTES=60

# Application
ENVIRONMENT=production

# Email (if applicable)
# SMTP_HOST=smtp.gmail.com
# SMTP_PORT=587
# SMTP_USER=your_email@gmail.com
# SMTP_PASSWORD=your_app_password
```

---

## 2. Initial Server Setup (One-Time)

### A. Install Dependencies
From your **local machine**, run:
```bash
make deploy-init
```
This installs Docker, Docker Compose, adds the user to the docker group, and creates the deployment directory.

> **Restart your SSH session** after this for Docker group membership to apply.

### B. Configure SSL (if using a domain)
```bash
make deploy-ssl
```
Prerequisites: Domain DNS must point to the server IP.

### C. Systemd Service (Auto-Start on Reboot)
SSH into the server and create a systemd service:

```bash
sudo nano /etc/systemd/system/<project-name>.service
```

Paste:
```ini
[Unit]
Description=<Project Name> Docker Compose
Requires=docker.service
After=docker.service network.target

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=/opt/<project-name>
ExecStart=/usr/bin/docker compose up -d --remove-orphans
ExecStop=/usr/bin/docker compose down

[Install]
WantedBy=multi-user.target
```

Enable:
```bash
sudo systemctl daemon-reload
sudo systemctl enable <project-name>
sudo systemctl start <project-name>
```

---

## 3. CI/CD Pipeline

Deployment is automated via GitHub Actions on every push to `main`.

### What the pipeline does:
1. **Build** — Builds Docker images for all services
2. **Push** — Pushes images to GitHub Container Registry (GHCR)
3. **Deploy** — SSHs into server, pulls images, restarts containers
4. **Migrate** — Runs database migrations if applicable
5. **Cleanup** — Prunes unused Docker images

### Workflow files:
- `infrastructure/.github/workflows/ci.yml` — Lint + test on PR
- `infrastructure/.github/workflows/deploy.yml` — Build + deploy on merge to `main`

---

## 4. Manual Verification

### Check application status
```bash
ssh <user>@<host>
cd /opt/<project-name>
docker compose ps
```
All containers should show `Up`.

### View logs
```bash
docker compose logs -f           # All services
docker compose logs -f api       # Backend only
docker compose logs -f web       # Frontend only
docker compose logs -f db        # Database only
```

---

## 5. Troubleshooting

### `unauthorized` when pulling images
GHCR login expired:
```bash
echo "YOUR_GITHUB_PAT" | docker login ghcr.io -u YOUR_GITHUB_USERNAME --password-stdin
```

### Container keeps restarting
Check logs:
```bash
docker compose logs <service-name> --tail=50
```

### Manual deployment (if CI/CD fails)
```bash
cd /opt/<project-name>
docker compose pull
docker compose up -d --force-recreate
# Run migrations:
# docker compose exec api alembic upgrade head
# docker compose exec api npx prisma migrate deploy
```

### SSL certificate issues
Re-run SSL setup:
```bash
make deploy-ssl
```
