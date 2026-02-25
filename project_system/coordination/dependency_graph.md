# Dependency Graph (Human-Readable)

## How to Use
Populate this after the Master Orchestrator has defined the execution lanes in the playbook.
List the sequencing recommendations and hard-block dependencies between agents/modules.

## Sequencing Recommendations

1. <Foundation/setup work> (Lane 0)
2. <Core domain models> (Lane 1) — depends on foundation
3. <Business logic / services> (Lane 1-2) — depends on models
4. <API layer> (Lane 2) — depends on services
5. <Frontend pages> (Lane 2-3) — depends on API
6. <Testing & QA> — continuous, gates each lane
7. <Documentation> — continuous, final polish after interfaces stabilize

## "Hard Block" Dependencies

- <Module A> depends on: <Module B deliverable>
- <Module C> depends on: <Module A schema> + <Module B events>
