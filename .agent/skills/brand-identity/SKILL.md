---
name: brand-identity
description: Ensures all UI components and technical implementations adhere to the project's visual identity and theming standards. Use when creating frontend components, styling pages, or defining visualization logic. Enforces whitelabel-native patterns where no colors, fonts, or brand elements are hardcoded.
---

# Brand Identity — Whitelabel-Native Design

## Core Principle: Zero Hardcoding

> **Every color, font, spacing scale, and brand element must come from a configuration source, never from hardcoded values in component code.**

This applies to:
- Hex/RGB/HSL color values
- Font family names
- Logo paths
- Brand-specific text (product name, tagline)

## Theming Architecture

### CSS Custom Properties (Variables)

All visual properties are defined as CSS variables. Components consume these variables; they never define colors directly.

```css
/* ✅ CORRECT — consumes theme variable */
.status-card { background: var(--color-surface); }
.status-active { color: var(--status-success); }

/* ❌ WRONG — hardcoded color */
.status-card { background: #1a1a2e; }
.status-active { color: #00ff88; }
```

### Variable Naming Convention

Use a structured naming convention for CSS variables:

```css
:root {
  /* Brand */
  --brand-primary: <value>;
  --brand-secondary: <value>;
  --brand-accent: <value>;

  /* Surfaces */
  --color-surface: <value>;
  --color-surface-elevated: <value>;
  --color-surface-overlay: <value>;

  /* Text */
  --color-text-primary: <value>;
  --color-text-secondary: <value>;
  --color-text-muted: <value>;

  /* Status (semantic) */
  --status-success: <value>;
  --status-warning: <value>;
  --status-error: <value>;
  --status-info: <value>;
  --status-inactive: <value>;

  /* Borders & Dividers */
  --color-border: <value>;
  --color-divider: <value>;

  /* Typography */
  --font-family-base: <value>;
  --font-family-mono: <value>;
  --font-size-xs: <value>;
  --font-size-sm: <value>;
  --font-size-md: <value>;
  --font-size-lg: <value>;
  --font-size-xl: <value>;

  /* Spacing */
  --spacing-xs: <value>;
  --spacing-sm: <value>;
  --spacing-md: <value>;
  --spacing-lg: <value>;
  --spacing-xl: <value>;

  /* Borders */
  --radius-sm: <value>;
  --radius-md: <value>;
  --radius-lg: <value>;
}
```

### Dark Mode Support

```css
/* Light mode defaults in :root */
:root { ... }

/* Dark mode overrides */
[data-theme="dark"] {
  --color-surface: #0f0f1a;
  --color-text-primary: #e8e8f0;
  /* ... override all values ... */
}

/* Or via media query for system preference */
@media (prefers-color-scheme: dark) {
  :root { ... }
}
```

## Branding Configuration

Brand values should be loaded from a configuration source (JSON file, API, environment variables):

```json
// branding.json (example)
{
  "name": "<Product Name>",
  "logo": "/assets/logo.svg",
  "favicon": "/assets/favicon.ico",
  "colors": {
    "primary": "#<hex>",
    "secondary": "#<hex>",
    "accent": "#<hex>"
  },
  "fonts": {
    "base": "<font name>",
    "mono": "<font name>"
  }
}
```

Components should consume this configuration via a theme context/provider, never by importing values directly.

## Compliance Checklist

Before shipping any frontend component, verify:

- [ ] **No hardcoded colors**: Every color value uses `var(--<name>)`
- [ ] **No hardcoded fonts**: Font families come from CSS variables or theme config
- [ ] **No hardcoded brand text**: Product name, tagline loaded from config
- [ ] **Logo via config**: Logo path comes from branding config, not a static import
- [ ] **Dark mode support**: Component works in both light and dark themes
- [ ] **Status colors semantic**: Uses `--status-*` variables, not arbitrary colors
- [ ] **Contrast compliant**: All text meets WCAG AA contrast ratios in both themes
- [ ] **Font agnostic**: Layout doesn't break with different font families/sizes

## Discovery

When starting a new project or joining an existing one, find:
1. `docs/memory-bank/productContext.md` — Design philosophy and theme preferences
2. Theme/branding configuration files (search for `branding`, `theme`, `css variables`)
3. Existing design tokens or CSS variable definitions
4. Component library documentation

If none exist, create a `branding.json` and CSS variable root before building any components.
