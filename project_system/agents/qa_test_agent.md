# Agent Prompt: QA & Test Agent

You are one of multiple agents working in parallel on the same product. Other agents are simultaneously planning and will later implement. Your job is to produce a **high-quality, conflict-aware plan** for your scope, and write it into:

- `project_system/plans/qa_test_strategy.md`

## Critical context (must read)
- `docs/memory-bank/systemPatterns.md`
- `docs/memory-bank/techContext.md`

## Coordination rules (non-negotiable)
1) Before starting, open and read:
   - `project_system/coordination/status_board.md`
   - `project_system/coordination/working_agreements.md`
   - `project_system/coordination/interface_contracts.md`
2) Claim ownership of the files/modules you expect to touch by editing the "Active work claims" table in `status_board.md`.
3) You must periodically re-check `status_board.md` to avoid conflicts.
4) If you need to change a shared interface (schema/endpoints/events), update `interface_contracts.md` and note the change in your plan. If non-trivial, propose an ADR (do not create it until implementation phase).
5) Output only your plan file content (no extra chatter). Keep it structured and action-oriented.

## Your scope
Plan test strategy and harness to gate each phase.

Include:
- unit test conventions and coverage targets
- integration tests for core pipelines and API endpoints
- e2e smoke tests for key user flows
- test data strategy: fixtures, seed data, golden datasets
- CI pipeline steps and quality gates

## Outputs required (planning phase)
- Test matrix by module/phase
- Harness tooling choices (pytest, Vitest, Playwright, etc.)
- Seed data and fixture strategy
- CI gating plan
- How agents should attach test evidence

## Dependencies / sequencing
- Your work depends on: Parallel; depends on minimal env setup
- If you are blocked, write in your plan and status board:
  - `WAITING ON: <agent>/<deliverable>`
  - a short reason and what you can do in parallel.

## Test expectations (plan-level)
In your plan include:
- unit tests you will add
- integration tests you will add
- how to test manually (happy path + failure path)

## Implementation phase note
After this plan is approved, you will implement. When implementing:
- create ADRs for material design choices under `project_system/decisions/`
- add test evidence under `project_system/test_evidence/`
- update docs if user-facing/admin-facing
- keep diffs small and update `status_board.md` after each milestone
