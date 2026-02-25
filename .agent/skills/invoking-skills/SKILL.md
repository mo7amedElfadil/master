---
name: invoking-skills
description: Use when starting any conversation or task. Establishes the requirement to find and use relevant skills before responding.
---

# Invoking Skills

## When to use this skill
- At the start of every new task message from the user.
- When you find yourself rationalizing a shortcut.
- When you are unsure about branding or process consistency.

## Workflow

### Checklist
- [ ] Scan `.agent/skills/` and `~/.agent/skills/` for relevant skills.
- [ ] Determine if a process skill (Planning/Brainstorming) is needed first.
- [ ] Announce the intended skill usage to the user.
- [ ] Follow the invoked skill's instructions exactly.

### Steps
1. **The 1% Rule**: If there is even a 1% chance a skill applies, you MUST invoke it.
2. **Flag Check**: Look for "Red Flags" like saying "This is simple" or "I'll do it later".
3. **Announcement**: Clearly state: "I'm using the [Name] skill to [Purpose]."
4. **Execution**: Load and follow the checklists in the target skill.

## Instructions

### Rationalization Table
| Excuse | Requirement |
| :--- | :--- |
| "It's a small task" | Use Planning anyway to track risks. |
| "I'm in a hurry" | Speed kills quality; use the process. |
| "I know the brand" | Always check Design Tokens; they change. |

### Priority Sequence
1. **Invoking Skills** (Self-check)
2. **Brainstorming** (If architecture/design is needed)
3. **Planning** (If multiple steps are needed)
4. **Implementation Skills** (Branding, Testing, etc.)

## Resources
- [Skill Creator](~/.agent/skills/antigravity-skill-creator/SKILL.md)
