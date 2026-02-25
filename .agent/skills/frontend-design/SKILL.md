---
name: frontend-design
description: Create distinctive, production-grade frontend interfaces with high design quality. Use this skill when the user asks to build web components, pages, artifacts, posters, or applications (examples include websites, landing pages, dashboards, React components, HTML/CSS layouts, or when styling/beautifying any web UI). Generates creative, polished code and UI design that avoids generic AI aesthetics.
---

# Frontend Design

## Before Writing Any Code, Understand

1. **Purpose**: What is this component/page trying to achieve? What is the user's goal?
2. **Tone**: Choose a bold aesthetic direction—not "clean and modern," but something with real personality.
   - Consider: dramatic typography, atmospheric color palettes, cinematic layout, purposeful depth
3. **Constraints**: Screen sizes, accessibility, performance budgets, brand guidelines
4. **Differentiation**: What makes this feel *crafted* rather than *generated*?

## Design Thinking — Not Just Code

Before implementation, define:
- **Visual hierarchy**: What should the eye land on first, second, third?
- **Spatial composition**: Intentional use of whitespace, alignment grids, optical balance
- **Color strategy**: Harmonious palette with purpose (not random accent colors)
- **Typography system**: Scale, weights, spacing that create rhythm
- **Motion language**: Purposeful animations that guide attention and create continuity
- **Background & texture**: Depth through layering, gradients, patterns, or environmental lighting

## Anti-AI-Slop Checklist

Before finalizing any design, verify it does NOT have:
- [ ] Generic blue/purple gradient headers
- [ ] Card grids with uniform padding and no visual variation
- [ ] Default border-radius everywhere
- [ ] Stock photo placeholder blocks
- [ ] "Lorem ipsum" or obvious placeholder text
- [ ] Centered-everything layout with no asymmetry
- [ ] Hover effects that just dim opacity

## Production Quality Standards

- **Responsive**: Works across all breakpoints (mobile-first or established breakpoints)
- **Accessible**: WCAG AA color contrast, keyboard navigable, screen reader friendly
- **Performant**: Lazy-loaded images, minimal layout shifts, efficient re-renders
- **Consistent**: Uses the project's design tokens and theming system
- **Edge states**: Loading, empty, error, and overflow states all designed

## Design Token Discovery

Before designing, check these project files for existing design tokens:
- Theme/branding configuration files
- CSS variable definitions
- Design system documentation in `docs/memory-bank/systemPatterns.md`
- `docs/memory-bank/productContext.md` for design philosophy

If no design system exists yet, propose one before building components.

## Output

Your output should be:
1. **Production-grade code** — not a mockup. Real, shippable component code.
2. **Visually striking** — the user should be impressed at first glance.
3. **Meticulously refined** — pixel-level attention to typography, color, motion, and spatial composition.
