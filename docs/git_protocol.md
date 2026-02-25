# Git Protocol for Parallel Agents

How agents manage git operations when working in parallel.

---

## Light Mode (Single-Branch + Ownership)

All agents work on the same branch. Conflicts are prevented by file ownership, not branches.

### Rules
1. **Check ownership** before editing. Verify `status_board.md` "Files/Modules Claimed" column.
2. **Own it → commit it.** If you exclusively own all files you changed, commit directly:
   ```bash
   git add <your-files>
   git commit -m "<type>(<scope>): <description>"
   ```
3. **Shared file → defer.** If the file has another owner or is unclaimed, provide the user with:
   ```
   ## GIT: Manual Commit Required
   I modified a shared file. Please run:
   git add <file-paths>
   git commit -m "<type>(<scope>): <description>"
   ```
4. **Conflict detected → stop.** If `git status` shows conflicts, report on status board and wait.

### Commit Message Format
```
<type>(<scope>): <description>

Types: feat | fix | refactor | test | docs | chore | ci
Scope: module or feature name (e.g., auth, api, dashboard)
```

### Examples
```bash
# Agent owns backend/app/auth/
git add backend/app/auth/
git commit -m "feat(auth): add JWT refresh token endpoint"

# Agent modified shared config — defers to user
## GIT: Manual Commit Required
## I updated the database settings. Please run:
## git add backend/app/core/settings.py
## git commit -m "chore(config): add Redis connection pool settings"
```

---

## Full Mode (Worktree Isolation)

Each parallel agent gets its own git worktree on a dedicated branch.

### Setup (orchestrator generates these)
```bash
# Create worktree for each agent
git worktree add ../agent-backend feature/backend-module
git worktree add ../agent-frontend feature/frontend-module
git worktree add ../agent-infra feature/infra-setup
```

### Agent workflow
1. Agent works in its worktree directory (e.g., `../agent-backend/`)
2. Commits freely on its feature branch
3. When done, notifies orchestrator via status board

### Merge-back (orchestrator provides these)
```bash
# Return to main worktree
cd <main-worktree>

# Merge each completed agent branch
git merge feature/backend-module
git merge feature/frontend-module
git merge feature/infra-setup

# Remove worktrees
git worktree remove ../agent-backend
git worktree remove ../agent-frontend
git worktree remove ../agent-infra

# Clean up branches
git branch -d feature/backend-module feature/frontend-module feature/infra-setup
```

### Conflict Resolution
If merge conflicts occur:
1. **Orchestrator identifies** which agent's changes take priority (based on ownership map).
2. **User resolves** the conflict using the orchestrator's guidance.
3. **Status board updated** with resolution notes.

---

## Dependency Handling

When Agent B depends on Agent A's output:

### Light Mode
1. Agent A commits first (owns the file).
2. Agent B pulls/sees the changes immediately (same branch).
3. Orchestrator enforces ordering via `WAITING ON` protocol.

### Full Mode
1. Agent A completes and merges to the base branch.
2. Agent B rebases its worktree: `git rebase main` (in its worktree).
3. Or: Orchestrator serializes these agents (no parallel execution).
