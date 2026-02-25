# Orchestration Playbook

> **Owner:** Master Orchestrator Agent
> **Created:** <YYYY-MM-DD> | **Updated:** <YYYY-MM-DD>
> **Governance rules:** See `project_system/agents/master_orchestrator.md` Rules A-F

---

## 0. Active Mode

> **Current Mode:** `<LIGHT | FULL>` — Selected by Master Orchestrator on first run.
> **Reasoning:** <why this mode was selected>

---

## 1. Sequencing — Execution Lanes

Work is organized into **execution lanes** that correspond to project phases.
Agents within the same lane may work in parallel; lanes are gated sequentially.

### Lane 0 — Foundation

| Order | Agent | Deliverables | Hard Blocks |
|-------|-------|-------------|-------------|
| 0.1 | **<Agent Name>** | <deliverables> | None — starts first |
| 0.2 | **<Agent Name>** | <deliverables> | None — parallel with 0.1 |

**Lane 0 exit criteria:** <define what "done" means for this lane>

---

### Lane 1 — <Phase Name>

| Order | Agent | Deliverables | Hard Blocks |
|-------|-------|-------------|-------------|
| 1.1 | **<Agent Name>** | <deliverables> | <blocks> |
| 1.2 | **<Agent Name>** | <deliverables> | <blocks> |

**Lane 1 exit criteria:** <define what "done" means>

---

<!-- Add more lanes as needed -->

### Cross-cutting (all lanes)

| Agent | Scope | When Active |
|-------|-------|-------------|
| **QA / Test** | Test strategy, integration tests, CI gates | Continuously — gates each lane exit |
| **Documentation** | User/admin docs, data dictionary | Continuously — final polish after main lanes |
| **Master Orchestrator** | Conflict resolution, status board, plan approval | Continuously |

---

## 2. Ownership Map — Module & File Boundaries

Each agent owns **exclusive write access** to the modules listed. Shared files require the **Interface Change Protocol** (§3).

| Agent | Backend Modules | Frontend Modules | Shared Files (read, propose changes only) |
|-------|-----------------|-------------------|-------------------------------------------|
| <Agent> | `<paths>` | `<paths>` | `<shared paths>` |

### Collision zones (require ADR if modified)

| Shared Resource | Primary Owner | Must-Notify Agents |
|-----------------|---------------|-------------------|
| `<shared file/schema>` | <owner agent> | <affected agents> |

---

## 3. Interface Change Protocol

Any change to a **schema, endpoint, event, or shared module** follows this process:

```
1. PROPOSE  →  Agent adds a "Proposed Change" section to their plan file
                in `project_system/plans/<scope>.md`.

2. NOTIFY   →  Agent updates `coordination/interface_contracts.md`
                with the proposed change marked as [PROPOSED].

3. REVIEW   →  Affected agents (per collision zone table) acknowledge or
                object within their next run.

4. APPROVE  →  Master Orchestrator resolves conflicts, marks change as
                [APPROVED] in interface_contracts.md.

5. ADR      →  If the change is non-trivial (new table, breaking endpoint,
                event schema change), create an ADR in `project_system/decisions/`
                using `ADR_TEMPLATE.md`.

6. IMPLEMENT → Change is implemented ONLY after [APPROVED] status.

7. VERIFY   →  QA agent confirms no regressions; update status_board.
```

---

## 4. Approval Gates

### What "plan approved" means

A plan in `project_system/plans/` is approved when **all** of the following are true:

| Gate | Verified By | How |
|------|-------------|-----|
| **Completeness** | Master Orchestrator | Plan follows `plans/_template.md`; all sections filled |
| **No conflicts** | Master Orchestrator | No overlap with other approved plans |
| **Dependency awareness** | Master Orchestrator | All WAIT conditions reference existing deliverables |
| **Testable** | QA Agent | Test plan section has concrete commands/assertions |
| **Human sign-off** | User | User reviews and approves the plan |

### Gate checkpoints per lane

| Checkpoint | When | Gate Condition |
|------------|------|----------------|
| **PLAN-GATE** | Before implementation begins | All plans in the lane are approved |
| **BUILD-GATE** | After implementation, before next lane | Code works, tests pass, status_board updated |
| **RELEASE-GATE** | After full lane is done | E2E test evidence, docs updated |

---

## 5. Merge Strategy

### Planning phase merge
1. Each agent writes their plan file in `project_system/plans/<scope>.md`.
2. Master Orchestrator reviews all plans for the current lane and produces a **Lane Checklist** (§7).
3. Conflicts resolved by single-owner assignment or ADR.
4. Approved plans marked `[APPROVED]` in their frontmatter.

### Implementation phase merge
1. Each agent implements against their approved plan.
2. Changes tracked on `status_board.md` (append-only change log).
3. At BUILD-GATE, Master Orchestrator verifies all deliverables complete.
4. Lane declared complete; next lane's PLAN-GATE opens.

---

## 6. Token Cost Controls

| Control | Rule |
|---------|------|
| **Delta updates only** | Never paste entire files into chat. Reference `project_system/<file>.md § <heading>`. |
| **Context budget** | `status_board.md` + `interface_contracts.md` + max **2** relevant docs. |
| **One task per run** | Target 1-3 deliverables per agent invocation. |
| **Structured outputs** | Use `_template.md` for plans. Use table format for status board entries. |
| **Path references > content** | When citing existing code, use `<module>/<file>.py § <function>`. |
| **Minimal diffs** | Implementation changes should be < 200 lines per commit. |

---

## 7. Lane Checklists (populated during plan approval)

### Lane 0 — Foundation

- [ ] `plans/<scope>.md` — <status>
- [ ] PLAN-GATE: all Lane 0 plans approved
- [ ] <exit criteria items>
- [ ] BUILD-GATE: Lane 0 complete

<!-- Add lane checklists as the project progresses -->

---

## 8. Conflict Resolution Protocol

When two agents disagree on an interface:

1. Both agents document their position in their plan file (1-3 bullets each).
2. Master Orchestrator evaluates based on:
   - **Project plan alignment** — which option better serves the phase goals?
   - **Blast radius** — which option touches fewer existing modules?
   - **Simplicity** — which option is easier to implement and maintain?
3. Decision recorded as an ADR in `project_system/decisions/`.
4. Losing agent updates their plan to conform.

### Escalation path

If the conflict cannot be resolved by the Master Orchestrator:
- Mark `ESCALATED` on `status_board.md`.
- Write a detailed ADR with both options.
- Block the affected lane until human decision.
