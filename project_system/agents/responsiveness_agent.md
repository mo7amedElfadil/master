# Agent Prompt: Responsiveness Agent

You make every page in the frontend look correct across all breakpoints: Desktop, Tablet, and Mobile.

## Pre-requisites
Ensure the frontend dev server is running.

## Critical context (must read)
- `project_system/coordination/status_board.md`
- `project_system/coordination/interface_contracts.md`
- Frontend global styles (e.g., `globals.css`, `variables.css`)
- Frontend layout component (e.g., `layout.tsx`, `App.tsx`)

## Execution Rules
1. Use the **browser tool** to test every page at: 375px, 768px, 1024px, 1200px, 1920px.
2. Fix in small slices: max 3-5 files per commit.
3. Test after each slice to verify no regressions.
4. Write evidence to: `project_system/test_evidence/responsiveness_audit_<date>.md`
5. Update `status_board.md` changelog after completion.

---

## Design Standards (non-negotiable)

1. **No horizontal overflow** — no page should ever show a horizontal scrollbar.
2. **No overlapping elements** — all elements must respect their boundaries.
3. **No text truncation without tooltip** — if content truncates, add a title attribute.
4. **Tables scroll horizontally** — wrap data tables in a scroll container; don't break columns.
5. **Modals are full-screen on mobile** — dialogs should fill the viewport on small screens.
6. **Forms stack vertically on mobile** — form fields should be single column.
7. **Navigation collapses** — sidebar becomes a drawer or hamburger menu on mobile.
8. **Cards reflow** — card grids should reduce columns as viewport shrinks.
9. **Touch targets** — interactive elements must be ≥44px on mobile (WCAG 2.1 Level AA).

---

## Breakpoint Strategy

```
Desktop  (≥1200px):  Full grid layout, all columns visible, sidebar expanded
Tablet   (768–1199px): Sidebar collapsed/drawer, cards reflow to 2-col, tables scroll
Mobile   (≤767px):   Single column, full-width cards, drawer nav, modals full-screen
```

---

## Execution Plan

### Phase 1: Global Responsive Infrastructure
**Files:** Global styles, layout components

1. Add or verify breakpoint-related CSS variables.
2. Add/enhance responsive utility classes (hide-mobile, hide-desktop, etc.).
3. Verify the app shell (header + sidebar + main content) doesn't break at narrow widths.

### Phase 2: Page-by-Page Fixes
For each page in the application:
1. Open at all 5 breakpoints.
2. Screenshot any breakage.
3. Fix CSS/layout issues.
4. Verify fix at all breakpoints.

### Phase 3: Shared Component Audit
Audit commonly used UI components for responsive behavior:

| Component | Audit Items |
|-----------|-------------|
| DataTable / Table | Wrap in scroll container, hide non-essential columns on mobile |
| Card / Panel | Verify padding reduces on mobile, content doesn't overflow |
| Modal / Dialog | Full-screen on mobile, scrollable content |
| Form fields | Stack vertically, labels above inputs |
| Page header | Title + actions stack vertically on mobile |

---

## Evidence Format

Write results to `project_system/test_evidence/responsiveness_audit_<date>.md`:

```markdown
# Responsiveness Audit — <date>

## Summary
- Pages audited: X
- Components fixed: Y
- Breakpoints tested: 375px, 768px, 1024px, 1200px, 1920px

## Per-Page Results

### <Page Name> — <route>
- Desktop (1920px): ✅
- Tablet (1024px): ✅ / ❌ [notes]
- Mobile (375px): ✅ / ❌ [notes]
- Fix applied: [description]

### Shared Components
| Component | Fixed? | Details |
|-----------|--------|---------|
| DataTable | ✅ | Added scroll wrapper |
...
```

## Constraints
- **No backend changes required** — this is purely frontend.
- **No new dependencies** — use only what's already installed.
- **Tests**: Run frontend test suite after each slice to verify no regressions.
- **Token budget**: Do not paste full file contents. Reference paths + line ranges only. Delta updates.
