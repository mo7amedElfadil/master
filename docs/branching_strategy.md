# Branching Strategy

This document covers two common branching strategies. The Master Orchestrator selects the appropriate one during project bootstrap based on team size, release cadence, and risk tolerance.

---

## Strategy 1: Trunk-Based Development

**Best for:** Solo developer, small teams, continuous deployment, rapid iteration.

```
main ────●────●────●────●────●────●──── (auto-deploys to production)
          \       /  \       /
           feature-a   feature-b
```

### How it works
- `main` is the single source of truth.
- Feature branches are **short-lived** (hours to 2 days max).
- Every merge to `main` triggers CI/CD → auto-deploy.
- Incomplete features are behind **feature flags**, not long-lived branches.

### Rules
1. Branch from `main`, merge back to `main`.
2. PRs must pass CI (lint + test) before merge.
3. No branch lives longer than 48 hours.
4. Feature flags for incomplete work: `<FEATURE>_ENABLED=false` in `.env`.

### CI/CD triggers
- **Push to `main`** → Build → Test → Deploy to production.
- **PR to `main`** → Lint → Test → Block merge if failing.

---

## Strategy 2: Git Flow (with Auto-Deploy)

**Best for:** Teams, projects with staging environments, release cycles.

```
main ────●─────────────────●──── (auto-deploys to production)
          \               /
develop ───●────●────●────●──── (auto-deploys to staging)
            \       / \   /
             feat-a  feat-b
```

### How it works
- `main` = production. Only receives merges from `develop` (releases).
- `develop` = staging/integration. Receives feature branch merges.
- Feature branches branch from `develop` and merge back to `develop`.
- Release: merge `develop` → `main` (via PR with approval).

### Rules
1. Feature branches: `feature/<name>` from `develop`.
2. Hotfix branches: `hotfix/<name>` from `main`, merge to both `main` and `develop`.
3. PRs must pass CI before merge.
4. Release PRs (`develop` → `main`) require human approval.

### CI/CD triggers
- **Merge to `develop`** → Build → Test → Deploy to staging.
- **Merge to `main`** → Build → Test → Deploy to production.
- **PR to either** → Lint → Test → Block merge if failing.

---

## Decision Matrix

| Factor | Trunk-Based | Git Flow |
|--------|-------------|----------|
| Team size | 1-3 developers | 3+ developers |
| Release cadence | Continuous | Scheduled / gated |
| Staging environment | Not required | Required |
| Risk tolerance | High (feature flags) | Lower (branch isolation) |
| Complexity | Low | Medium |
| Rollback strategy | Revert commit | Revert merge |

## Orchestrator Selection

The Master Orchestrator should recommend:
- **Trunk-based** if using Light mode and ≤ 3 agents
- **Git Flow** if using Full mode and > 3 agents or if staging is required
- Always ask the user to confirm before proceeding
