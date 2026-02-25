# Project System

The orchestration layer that governs multi-agent software development.

## Structure

```
project_system/
├── agents/
│   └── master_orchestrator.md     # The brain — governs all agents
├── coordination/
│   ├── orchestration_playbook.md  # Execution lanes, gates, ownership
│   ├── status_board.md            # Live tracking of agent work
│   ├── interface_contracts.md     # Schema/endpoint contracts
│   ├── working_agreements.md      # Team rules
│   └── dependency_graph.md        # Sequencing reference
├── plans/
│   └── _template.md              # Standard plan format
├── decisions/
│   └── ADR_TEMPLATE.md           # Architecture Decision Record format
└── test_evidence/
    └── .gitkeep                   # Evidence files go here
```

## How It Works

1. **Master Orchestrator** reads the project state and selects a mode (Light or Full).
2. **Planning Phase**: Each agent writes a plan in `plans/`. Orchestrator reviews for conflicts.
3. **PLAN-GATE**: User approves all plans. No code until approved.
4. **Build Phase**: Agents implement. Status board tracks progress.
5. **BUILD-GATE**: All tests pass, docs updated, status board complete.
6. **Release**: CI/CD deploys on merge.

## Adding New Agents

1. Create an agent prompt in `agents/<agent_name>.md`
2. Define their file ownership scope
3. Add them to the orchestration playbook
4. Claim files on the status board
