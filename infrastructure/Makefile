.PHONY: up down dev build test lint migrate shell logs clean

# ============================================================
# Universal Targets (stack-agnostic)
# ============================================================

# Start all services in detached mode
up:
	docker compose up -d

# Stop all services
down:
	docker compose down

# Start with build (development mode with live reload)
dev:
	docker compose up --build

# Build images only
build:
	docker compose build

# View logs (all services)
logs:
	docker compose logs -f

# Clean up (remove containers, volumes, orphans)
clean:
	docker compose down -v --remove-orphans
	docker system prune -f

# Health check (customize the URL/endpoint for your project)
health:
	@echo "TODO: Add health check command"
	# Example: curl -s http://localhost:8000/health | python -m json.tool
	# Example: curl -s http://localhost:3000/api/health | jq .

# ============================================================
# Backend Targets
# ============================================================
# Uncomment and customize for your backend stack.

## --- Python / FastAPI ---
# test:
# 	docker compose exec api pytest -v
#
# lint:
# 	docker compose exec api ruff check .
# 	docker compose exec api mypy app/ --ignore-missing-imports
#
# migrate:
# 	docker compose exec api alembic upgrade head
#
# migrate-create:
# 	docker compose exec api alembic revision --autogenerate -m "$(msg)"
#
# seed:
# 	docker compose exec api python scripts/seed_demo_data.py
#
# shell-api:
# 	docker compose exec api bash

## --- Node.js / Express ---
# test:
# 	docker compose exec api npm test
#
# lint:
# 	docker compose exec api npm run lint
#
# migrate:
# 	docker compose exec api npx prisma migrate deploy
#
# migrate-create:
# 	docker compose exec api npx prisma migrate dev --name $(msg)
#
# seed:
# 	docker compose exec api npx prisma db seed
#
# shell-api:
# 	docker compose exec api sh

## --- Go ---
# test:
# 	docker compose exec api go test ./...
#
# lint:
# 	docker compose exec api golangci-lint run
#
# migrate:
# 	docker compose exec api migrate -path migrations -database "$$DATABASE_URL" up
#
# shell-api:
# 	docker compose exec api sh

# ============================================================
# Frontend Targets
# ============================================================

## --- React / Vite ---
# test-web:
# 	docker compose exec web npm test
#
# lint-web:
# 	docker compose exec web npm run lint
#
# shell-web:
# 	docker compose exec web sh

# ============================================================
# Database Targets
# ============================================================

## --- PostgreSQL ---
# shell-db:
# 	docker compose exec db psql -U <user> -d <database>
#
# reset-db:
# 	docker compose exec db psql -U <user> -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"
# 	make migrate
# 	make seed

# logs for specific services
# logs-api:
# 	docker compose logs -f api
#
# logs-db:
# 	docker compose logs -f db

# ============================================================
# Deployment Targets
# ============================================================
# Configure these variables for your server
# SSH_HOST ?= 203.0.113.50
# SSH_USER ?= ubuntu
# SSH_KEY ?= ~/.ssh/deploy_key

# Show running containers
# ps:
# 	docker compose ps

# Build and push images to GHCR
# release:
# 	docker buildx bake --push

# Initialize remote server (one-time setup: Docker, Docker Compose, directory structure)
# deploy-init:
# 	@echo "Initializing server at $(SSH_HOST)..."
# 	scp -i $(SSH_KEY) -r scripts $(SSH_USER)@$(SSH_HOST):~/
# 	ssh -i $(SSH_KEY) $(SSH_USER)@$(SSH_HOST) "chmod +x ~/scripts/*.sh && ~/scripts/server_setup.sh"

# Setup SSL certificates on remote server
# deploy-ssl:
# 	@echo "Setting up SSL on $(SSH_HOST)..."
# 	ssh -i $(SSH_KEY) $(SSH_USER)@$(SSH_HOST) "sudo mkdir -p /opt/$(notdir $(CURDIR))/nginx/certs && sudo chown -R $(SSH_USER):$(SSH_USER) /opt/$(notdir $(CURDIR))"
# 	scp -i $(SSH_KEY) docker-compose.prod.yml $(SSH_USER)@$(SSH_HOST):/opt/$(notdir $(CURDIR))/
# 	scp -i $(SSH_KEY) -r nginx $(SSH_USER)@$(SSH_HOST):/opt/$(notdir $(CURDIR))/
# 	ssh -i $(SSH_KEY) $(SSH_USER)@$(SSH_HOST) "chmod +x ~/scripts/*.sh && ~/scripts/setup_ssl.sh"
