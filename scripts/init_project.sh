#!/usr/bin/env bash
# ===========================================
# init_project.sh — Copy master template to a new project
# ===========================================
# Usage: ./scripts/init_project.sh <project-name>
#        ./scripts/init_project.sh my-new-app
#
# This copies the master template to ~/alx_se/<project-name>
# and initializes git.

set -euo pipefail

TEMPLATE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TARGET_BASE="${HOME}/alx_se"

if [ -z "${1:-}" ]; then
  echo "Usage: $0 <project-name>"
  echo "Example: $0 my-new-app"
  exit 1
fi

PROJECT_NAME="$1"
TARGET_DIR="${TARGET_BASE}/${PROJECT_NAME}"

if [ -d "$TARGET_DIR" ]; then
  echo "Error: Directory $TARGET_DIR already exists."
  exit 1
fi

echo "📦 Creating project: $TARGET_DIR"
mkdir -p "$TARGET_DIR"

# Copy template contents (excluding .git and scripts/init_project.sh itself)
rsync -av --exclude='.git' --exclude='scripts/init_project.sh' "$TEMPLATE_DIR/" "$TARGET_DIR/"

# Move infrastructure files to project root
echo "📁 Setting up infrastructure files..."
cp "$TARGET_DIR/infrastructure/Makefile" "$TARGET_DIR/Makefile"
cp "$TARGET_DIR/infrastructure/docker-compose.yml" "$TARGET_DIR/docker-compose.yml"
cp "$TARGET_DIR/infrastructure/docker-compose.prod.yml" "$TARGET_DIR/docker-compose.prod.yml"
cp "$TARGET_DIR/infrastructure/docker-bake.hcl" "$TARGET_DIR/docker-bake.hcl"
cp "$TARGET_DIR/infrastructure/.env.example" "$TARGET_DIR/.env.example"
cp "$TARGET_DIR/infrastructure/.gitignore" "$TARGET_DIR/.gitignore"
cp "$TARGET_DIR/infrastructure/.pre-commit-config.yaml" "$TARGET_DIR/.pre-commit-config.yaml"
cp -r "$TARGET_DIR/infrastructure/.github" "$TARGET_DIR/.github"

# Initialize git
echo "🔧 Initializing git..."
cd "$TARGET_DIR"
git init
git add -A
git commit -m "chore: scaffold from master template"

echo ""
echo "✅ Project created at: $TARGET_DIR"
echo ""
echo "Next steps:"
echo "  1. cd $TARGET_DIR"
echo "  2. Edit docs/memory-bank/projectbrief.md with your project goals"
echo "  3. Edit docs/memory-bank/techContext.md with your chosen stack"
echo "  4. Open project_system/agents/master_orchestrator.md for the initial brainstorming session"
echo ""
