# Project Rules & Guidelines

**Role:** Operational rules, architectural constraints, and task management for AI agents.
**Trigger:** Read `docs/memory-bank/*` and project system docs before starting any new task series.

## Mission
<!-- Fill in for your specific project -->
Build **<PROJECT NAME>** — <one-line description>.

**Priority #1:** <the most important quality attribute: reliability, performance, UX, etc.>

## Implementation Rules (Mandatory)

1. **Strict Typing & Safety:**
   - Use the language's type system to its fullest. No untyped dictionaries as data containers.
   - Validate configuration at startup (e.g., Pydantic Settings, Zod, etc.).
   - No hardcoded secrets. Use environment variables with validation.

2. **Theming & Branding:**
   - Never hardcode colors, fonts, or brand elements.
   - Use CSS variables or a theme system (see `.agent/skills/brand-identity/SKILL.md`).
   - Support dark and light modes from the start.

3. **Data Integrity:**
   - Define and document business rules for edge cases (nulls, zeros, empty states).
   - Use database constraints and application-level validation together.
   - Soft-delete where appropriate; hard-delete only with explicit confirmation.

4. **Infrastructure Ownership:**
   - Each agent updates Makefile targets, Docker services, and CI steps for their domain.
   - Feature flags (`<FEATURE>_ENABLED=true|false`) for incomplete or gated functionality.
   - All configuration via `.env` — never hardcode URLs, ports, or connection strings.

## Task Queue

<!-- The Master Orchestrator populates this after the initial brainstorming session -->
<!-- Format: Numbered phases with checkboxes -->

1. **Phase 0 — Scaffold & Infrastructure:**
   - [ ] Project scaffold (backend/frontend/docker)
   - [ ] Database setup and initial migrations
   - [ ] CI/CD pipeline

2. **Phase 1 — Core Domain:**
   - [ ] <core feature 1>
   - [ ] <core feature 2>

3. **Phase 2 — Integrations:**
   - [ ] <integration 1>
   - [ ] <integration 2>

4. **Phase 3 — Polish:**
   - [ ] Testing & QA
   - [ ] Documentation
   - [ ] Performance optimization

## Documentation Updates
- Update `activeContext.md` after every major component is built.
- Update `systemPatterns.md` if the architecture changes.
- Update `progress.md` as tasks are completed.
- Create ADRs in `project_system/decisions/` for significant design decisions.
