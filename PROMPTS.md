# Master Framework — Agent Prompts

Two copy-paste prompts for incorporating the master framework into projects.

---

## Prompt 1: New Project (Start from Scratch)

```
I'm starting a new software project. I have a master project template at ~/alx_se/master/ that contains my standard multi-agent orchestration framework, skills, coordination templates, infrastructure patterns, and documentation system.

Your first tasks:

1. **Read the master template** — Start by reading these files to understand the framework:
   - ~/alx_se/master/README.md (overview + quick start)
   - ~/alx_se/master/project_system/agents/master_orchestrator.md (your operating rules)
   - ~/alx_se/master/project_system/coordination/working_agreements.md (team rules)
   - ~/alx_se/master/WALKTHROUGH.md (full structure reference)
   - ~/alx_se/master/docs/deploy.md (deployment strategies)

2. **Initialize the new project** — Run the init script to copy the template:
   ~/alx_se/master/scripts/init_project.sh <PROJECT_NAME>

3. **Begin the Master Orchestrator bootstrap sequence:**
   - Assess project complexity and select the orchestration mode (Light or Full)
   - Brainstorm with me about the tech stack, architecture, and scope
   - Populate the memory bank (docs/memory-bank/) based on our decisions
   - Generate the initial infrastructure files (uncomment relevant Makefile/Docker sections)
   - Define the execution lanes and agent roster in the orchestration playbook
   - Populate .agent/rules/project-rules.md with the project mission and task queue

4. **Configure deployment strategy:**
   - Read docs/deploy.md for the two supported strategies (Cloud VPS vs Self-Hosted)
   - In infrastructure/.github/workflows/deploy.yml:
     - If Cloud VPS: keep deploy-cloud-vps job active (default)
     - If Self-Hosted (private runner): uncomment deploy-self-hosted, comment out deploy-cloud-vps
   - In infrastructure/Makefile: uncomment the Deployment Targets section and set SSH_HOST, SSH_USER, SSH_KEY
   - Uncomment deploy-init and deploy-ssl targets if the project needs server provisioning
   - Document the chosen strategy and required GitHub Secrets in docs/deploy.md

5. **Do NOT skip the brainstorming phase.** Use the brainstorming skill (.agent/skills/brainstorming/SKILL.md) to explore requirements before making any implementation decisions.

The project I want to build: <DESCRIBE YOUR PROJECT HERE>
```

---

## Prompt 2: Existing Project (Retrofit the Framework)

```
I have an existing project at ~/alx_se/<PROJECT_DIR>/ that I want to retrofit with my standard multi-agent orchestration framework. The master template is at ~/alx_se/master/.

Your tasks:

1. **Read the master template** — Understand the framework by reading:
   - ~/alx_se/master/README.md (overview)
   - ~/alx_se/master/project_system/agents/master_orchestrator.md (orchestration rules)
   - ~/alx_se/master/project_system/coordination/working_agreements.md (team rules)
   - ~/alx_se/master/WALKTHROUGH.md (full structure reference)
   - ~/alx_se/master/docs/deploy.md (deployment strategies)

2. **Analyze the existing project** — Understand what already exists:
   - Scan the project structure (directories, files, configs)
   - Identify the tech stack (backend, frontend, database, infra)
   - Check for existing documentation, CI/CD, Makefile, Docker configs
   - Identify the current deployment strategy (Cloud VPS or Self-Hosted runner)
   - Note what's missing vs. what the master template provides

3. **Integrate the framework without disrupting existing work:**
   - Copy .agent/skills/ and .agent/rules/ from master into the project
   - Copy project_system/ (agents, coordination, plans, decisions, test_evidence) into the project
   - Copy docs/memory-bank/ templates into the project's docs/
   - Copy docs/branching_strategy.md, docs/git_protocol.md, and docs/deploy.md into the project's docs/
   - Do NOT overwrite existing files — merge or adapt where conflicts exist

4. **Populate the memory bank** from what you learned about the existing project:
   - Fill in docs/memory-bank/projectbrief.md based on the project's purpose
   - Fill in docs/memory-bank/techContext.md based on the actual stack
   - Fill in docs/memory-bank/systemPatterns.md based on the architecture
   - Fill in docs/memory-bank/productContext.md based on any existing docs/README
   - Set docs/memory-bank/activeContext.md to reflect the current state
   - Set docs/memory-bank/progress.md to reflect what's already built

5. **Adapt infrastructure templates** — For each, check if the project already has one:
   - Makefile: Merge master template targets with existing Makefile (or create new). Include the Deployment Targets section (deploy-init, deploy-ssl, release) if not present.
   - Docker Compose: Keep existing, reference master template for missing patterns
   - CI/CD workflows:
     - Keep existing workflows, add any missing patterns from master
     - deploy.yml: Match to the project's deployment strategy (Cloud VPS or Self-Hosted)
       - Cloud VPS: uses GitHub-hosted runners + SSH (shimataro/ssh-key-action)
       - Self-Hosted: uses private runners + local SSH key
     - ci.yml: Add if missing (lint + test on PR)
     - Ensure docker bake uses GHA caching (cache-from/cache-to type=gha)
   - .env.example: Merge with existing, ensure feature-flag pattern is present
   - .pre-commit-config.yaml: Add if missing, merge if exists
   - .gitignore: Merge with existing

6. **Configure deployment:**
   - Document the deployment strategy in docs/deploy.md (fill in the template)
   - Set required GitHub Secrets (SSH_HOST, SSH_USER, SSH_PRIVATE_KEY, PROD_ENV_FILE for Cloud VPS; just PROD_ENV_FILE for Self-Hosted)
   - If the project has nginx: ensure SSL auto-detection is in the deploy workflow
   - If the project has systemd: document the service unit in docs/deploy.md

7. **Run the Master Orchestrator bootstrap:**
   - Assess project complexity and select mode (Light or Full)
   - Generate the orchestration playbook with lanes based on remaining work
   - Set up the status board reflecting current state
   - Populate .agent/rules/project-rules.md with the project's actual rules

8. **Present a summary** of what was integrated, what was adapted, and what's ready for the next phase.

Important:
- Do NOT break existing functionality — this is additive
- Preserve all existing configurations — only add or merge
- Use the brainstorming skill before making any architectural decisions
- Ask me before modifying any existing file

The project is at: ~/alx_se/<PROJECT_DIR>/
```
