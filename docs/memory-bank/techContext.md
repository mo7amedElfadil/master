# Tech Context

> The stack. Languages, frameworks, tools, infrastructure.

## Backend
- **Language:**
- **Framework:**
- **ORM / Data Access:**
- **Database:**
- **Cache:**
- **Message Broker:**

## Frontend
- **Language:**
- **Framework:**
- **State Management:**
- **UI Library:**
- **Charting / Visualization:**

## Infrastructure
- **Containerization:** Docker / Docker Compose
- **CI/CD:** GitHub Actions
- **Registry:** GHCR / Docker Hub / ECR
- **Hosting:** <cloud/self-hosted/hybrid>

## Developer Tools
- **Linter:** <e.g., ruff, eslint>
- **Formatter:** <e.g., black, prettier>
- **Type Checker:** <e.g., mypy, tsc>
- **Pre-commit:** gitleaks + <stack-specific hooks>
- **Testing:** <e.g., pytest, vitest, jest>

## Key Configuration
- **Environment:** Managed via `.env` files with `<settings library>` validation at startup.
- **Feature Flags:** `<SERVICE>_ENABLED=true|false` pattern in `.env`.
- **Secrets:** Never hardcoded. Loaded from environment variables.

## Package Management
- **Backend:** <e.g., pip, poetry, uv, cargo>
- **Frontend:** <e.g., npm, pnpm, yarn>
