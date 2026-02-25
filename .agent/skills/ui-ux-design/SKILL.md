---
name: ui-ux-design
description: Use when designing user interfaces, planning user flows, structuring information architecture, choosing interaction patterns, or evaluating usability. Applies before and during frontend implementation to ensure interfaces are usable, accessible, and purpose-driven—not just visually attractive.
---

# UI/UX Design

This skill ensures interfaces are **usable, accessible, and purpose-driven**—not just visually attractive.

## Step 1: Identify the User and Their Task

Before designing anything, answer:

1. **Who is the user?** (Check `docs/memory-bank/productContext.md` for personas)
2. **What task are they performing?** (Not "viewing a dashboard" but "finding which item needs attention")
3. **What context are they in?** (Desktop at desk? Mobile in field? Time pressure?)
4. **What is their expertise level?** (Power user who wants density? Novice who needs guidance?)

## Step 2: Map the User Flow

### Design the journey, not just the screen

```
Entry Point → Key Decision → Action → Confirmation → Next Step
```

**Rules:**
- **3-click rule**: Core tasks reachable in ≤ 3 interactions
- **Escape hatches**: Every modal/flow has a clear way to go back or cancel
- **Progress indicators**: Multi-step flows show where the user is
- **Error recovery**: Wrong actions are reversible; destructive actions require confirmation

### Flow Documentation Template
```
Flow: <name>
Trigger: <how/where the user enters this flow>
Steps:
  1. <action> → <screen/component>
  2. <action> → <screen/component>
  3. <action> → <result>
Edge cases:
  - <what if X?>
  - <what if Y?>
```

## Step 3: Structure Information Architecture

Organize by **task frequency**, not data structure:

| Frequency | Placement | Example |
|-----------|-----------|---------|
| Every session | Primary nav, always visible | Main dashboard, status overview |
| Weekly | Secondary nav / quick access | Reports, configuration |
| Monthly | Settings / admin section | User management, integrations |
| Once | Onboarding / setup wizard | Initial configuration |

## Step 4: Choose Interaction Patterns

### DO use:
| Pattern | When |
|---------|------|
| Inline editing | Quick single-field changes |
| Expandable rows | Details without leaving the list |
| Command palette | Power users, many actions |
| Toast/snackbar | Non-blocking confirmations |
| Skeleton screens | Loading states (not spinners for content) |
| Optimistic updates | Fast-feeling interactions |

### DON'T use:
| Anti-Pattern | Why | Alternative |
|-------------|-----|-------------|
| Modal for displaying data | Blocks context | Slide-over panel or expandable section |
| Alert for non-critical info | Interrupts flow | Toast notification |
| Dropdown with 50+ items | Unusable | Searchable select or combobox |
| Toggle without confirmation | Accidental changes | Toggle + undo toast |
| Infinite scroll for important lists | Loses position | Pagination + "load more" |

## Step 5: Validate Accessibility

### Minimum standards (WCAG AA):
- [ ] Color contrast ≥ 4.5:1 for normal text, 3:1 for large text
- [ ] All interactive elements keyboard-navigable (Tab, Enter, Escape)
- [ ] Focus indicators visible on all interactive elements
- [ ] Touch targets ≥ 44x44px on mobile
- [ ] Screen reader labels for icons and interactive elements
- [ ] No information conveyed by color alone (use icons, patterns, or text)
- [ ] Form fields have visible labels (not just placeholders)
- [ ] Error messages are specific and actionable

## Step 6: Plan Responsive Behavior

### Breakpoint strategy:
| Breakpoint | Target | Layout Adaptation |
|-----------|--------|------------------|
| < 640px | Mobile | Single column, stacked cards, bottom nav |
| 640-1024px | Tablet | Two columns, collapsible sidebar |
| > 1024px | Desktop | Full layout, side-by-side panels |

### What changes across breakpoints:
- **Navigation**: Top bar → hamburger / bottom nav
- **Data tables**: Full → card list or horizontal scroll
- **Side panels**: Visible → slide-over overlay
- **Actions**: Icon + label → icon only (with tooltip)

## Step 7: Edge State Checklist

Every component must handle:
- [ ] **Empty state**: No data yet (with CTA to add data)
- [ ] **Loading state**: Skeleton or spinner
- [ ] **Error state**: Clear message + retry action
- [ ] **Overflow state**: Text truncation, scroll behavior, or pagination
- [ ] **Single item**: Layout works with just 1 item
- [ ] **Many items**: Layout works with 100+ items
- [ ] **Offline / degraded**: What shows when the backend is unavailable?

## Output

After applying this skill, you should have:
1. A documented user flow for the feature
2. An information architecture that matches task frequency
3. Interaction patterns chosen with rationale
4. Accessibility requirements identified
5. Responsive behavior planned
6. Edge states listed for each component
