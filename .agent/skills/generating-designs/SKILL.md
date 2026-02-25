---
name: generating-designs
description: Facilitates creative exploration and architectural decision-making. Use before any creative work—creating features, building components, or modifying behavior—to ensure alignment on design.
---

# Generating Designs

## When to use this skill
- Starting a new feature from scratch.
- Deciding between multiple implementation patterns.
- Defining UI/UX layouts and branding applications.

## Workflow

### Checklist
- [ ] Brainstorm 2-3 distinct approaches with trade-offs.
- [ ] Present one question at a time to avoid overwhelming the user.
- [ ] Provide incremental validation by chunking the design into small sections.
- [ ] Save the finalized design agreement to `docs/designs/`.

### Steps
1. **Initial Options**: Propose at least two different paths (e.g., Simple vs Premium).
2. **Trade-off Analysis**: Explain the pros and cons of each path logically.
3. **Incremental Approval**: Present specific design sections (Logic, UI, API) and wait for "Looks good" before proceeding.
4. **Finalization**: Document the final consensus in a design file.

## Instructions

### Proposing Options
Always offer choices using this hierarchy:
- **Option 1 (Reliable)**: The standard, low-risk approach.
- **Option 2 (Enhanced)**: More features or better aesthetics, higher complexity.

### Chunking Rule
Keep design explanations between 200-300 words. Stop immediately after a chunk to ask for feedback. Do not proceed until the user validates the current chunk.

## Resources
- [Design Template](resources/design-spec.md)
