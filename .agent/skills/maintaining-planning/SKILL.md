---
name: maintaining-planning
description: Orchestrates complex, multi-step tasks by breaking them into atomic, verifiable actions. Use when the user's request involves architectural changes, multiple files, or a sequence of dependent steps.
---

# Maintaining Planning

## When to use this skill
- Starting a task with more than 3 steps.
- Implementing features that touch multiple services or directories.
- Refactoring core logic or database schemas.

## Workflow

### Checklist
- [ ] Create plan file in `docs/plans/` using timestamped naming.
- [ ] Define the high-level goal and architecture summary.
- [ ] List atomic tasks (2-5 minutes each).
- [ ] Include verification steps (tests/commands) for each task.
- [ ] Get user confirmation before proceeding with implementation.

### Steps
1. **Initialize Plan**: Create a markdown document at `docs/plans/YYYY-MM-DD-task-name.md`.
2. **Architecture Review**: Summarize the current state and the target state.
3. **Atomic Breakdown**: Define sequential tasks that are small enough to be "atomic" (Red-Green-Refactor).
4. **Verification**: For every task, define a specific command or test that proves success.
5. **Session Choice**: Ask the user if they want to run the plan via a subagent or in the current session.

## Instructions

### Atomic Task Format
Tasks MUST be documented as follows:
```markdown
### [Task ID] - [Task Name]
- **Goal**: Specific outcome.
- **RED**: Command that fails before implementation.
- **GREEN**: Minimal code needed to pass.
- **REFACTOR**: Cleanup or optimization steps.
- **Verification**: Command to verify completion.
```

### Path Conventions
Always use absolute paths for files mentioned in the plan to avoid ambiguity.

## Resources
- [Plan Templates](resources/templates.md)
