# Working Agreements (Multi-Agent, Low-Conflict, Low-Token)

## 1) Golden Rules
- **No redesign.** Extend the current architecture unless an ADR proves necessity.
- **Write plans before code.** Planning phase must converge before implementation begins.
- **Small diffs, frequent check-ins.** Prefer small, mergeable changes over large refactors.
- **Config over code.** No hardcoded secrets, URLs, or environment-specific values in source.
- **Test with every slice.** No implementation ships without corresponding tests.

## 2) How Agents Avoid Conflicts
- **Claim ownership** on `coordination/status_board.md` before editing any file.
- **Interface Contracts**: if you change a schema/endpoint/event, update:
  1. Your plan
  2. `coordination/interface_contracts.md`
  3. Add an ADR if non-trivial
- **One writer per file.** If a file has an owner, only they edit it. Others propose via contracts.

## 3) Token Control Standards
- **Delta updates only.** Never paste entire files into chat; reference paths + headings.
- **Use "Context budget."** Only bring the minimal relevant sections from docs into agent prompts.
- **One task per run.** Each agent run should target 1-3 deliverables, not an entire phase.
- **Structured outputs.** Use the templates provided; avoid prose unless necessary.

## 4) Definition of Done (DoD)
A feature is not "done" until it has:
- Tests added/updated + how to run them
- Docs updated (if user-facing/admin-facing)
- ADR recorded (if design tradeoff exists)
- Status board updated with files changed and dependencies
- Infrastructure files updated (Makefile, Docker, CI) if the agent's domain requires it

## 5) WAIT Protocol
If blocked, write:
- **WAITING ON:** <agent>/<deliverable>
- **Why blocked:** <1-2 lines>
- **What you can do meanwhile:** <bullets>

## 6) Commit Protocol
- **Format:** `<type>(<scope>): <description>`
  - Types: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`, `ci`
  - Scope: module or feature name
- **Owned files:** Agent commits directly.
- **Shared files:** Agent provides user with commit message + `git add` commands.
- **Conflict detected:** Agent stops, reports to status board, waits for orchestrator.
