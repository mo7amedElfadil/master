# Walkthrough: Master Project Template

## What Was Built

Created `~/alx_se/master/` — a **reusable, stack-agnostic project template** with 41 files for bootstrapping any software project with built-in multi-agent orchestration.

## Directory Structure (41 files)

```
master/
├── README.md                                          # Quick start guide
├── .agent/
│   ├── rules/
│   │   ├── memory-bank.md                             # Living docs structure
│   │   └── project-rules.md                           # Implementation rules
│   └── skills/ (8 skills)
│       ├── brainstorming/SKILL.md                     # ✅ Copied as-is
│       ├── invoking-skills/SKILL.md                   # ✅ Copied as-is
│       ├── generating-designs/SKILL.md                # ✅ Copied as-is
│       ├── maintaining-planning/SKILL.md              # ✅ Copied as-is
│       ├── writing-skills/SKILL.md                    # ✅ Copied as-is
│       ├── frontend-design/SKILL.md                   # ⚠️ Generalized
│       ├── ui-ux-design/SKILL.md                      # ⚠️ Generalized
│       └── brand-identity/SKILL.md                    # 🔄 Rewritten
├── project_system/
│   ├── README.md
│   ├── agents/master_orchestrator.md                  # Rules A-F + mode selection
│   ├── coordination/
│   │   ├── orchestration_playbook.md                  # Lane-based, Light/Full
│   │   ├── working_agreements.md                      # 6 sections + commit protocol
│   │   ├── status_board.md                            # Empty tracking template
│   │   ├── interface_contracts.md                     # Contract tables
│   │   └── dependency_graph.md                        # Sequencing template
│   ├── plans/_template.md
│   ├── decisions/ADR_TEMPLATE.md
│   └── test_evidence/.gitkeep
├── docs/
│   ├── README.md
│   ├── branching_strategy.md                          # Trunk-based + Git Flow
│   ├── git_protocol.md                                # Light + Full mode git
│   └── memory-bank/ (7 templates)
├── infrastructure/
│   ├── Makefile                                       # Multi-stack (Python/Node/Go)
│   ├── docker-compose.yml                             # Dev with optional services
│   ├── docker-compose.prod.yml                        # GHCR-based production
│   ├── docker-bake.hcl                                # Multi-target builds
│   ├── .env.example                                   # Feature-flag pattern
│   ├── .gitignore                                     # Multi-language
│   ├── .pre-commit-config.yaml                        # gitleaks + commented hooks
│   └── .github/workflows/
│       ├── ci.yml                                     # Lint+test on PR
│       └── deploy.yml                                 # Build+push+deploy on merge
└── scripts/init_project.sh                            # Template copier
```

## Key Design Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Orchestration | Tiered: Light + Full | Orchestrator auto-selects based on complexity |
| Git protocol | Hybrid ownership + worktree | Light mode = single-branch; Full = worktree isolation |
| Branching | Documented both strategies | Orchestrator recommends during bootstrap |
| Infrastructure | Reference patterns, commented | Agents uncomment and extend for their domain |
| Skills | 5 as-is + 3 generalized | No IIoT references in any skill |

## Verification Results

| Check | Result |
|-------|--------|
| File count | 41 files |
| IIoT reference scan | Clean (only intentional commented examples in docker-compose.yml service options) |
| Copied skills check | Clean — no domain-specific references |
| Init script | Executable, tested syntax |

## How to Use

```bash
# Create a new project from template
~/alx_se/master/scripts/init_project.sh my-new-app
cd ~/alx_se/my-new-app

# Fill in the memory bank
# Edit docs/memory-bank/projectbrief.md
# Edit docs/memory-bank/techContext.md

# Start the master orchestrator brainstorming session
# Provide project_system/agents/master_orchestrator.md as context to your AI agent
```
