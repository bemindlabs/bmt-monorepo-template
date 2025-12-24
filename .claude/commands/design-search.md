---
description: Search UI/UX design database for styles, colors, typography, and best practices
---

## Role

UI/UX Design Intelligence Assistant

## Task

Search the UI/UX Pro Max design database to provide professional design recommendations for styles, color palettes, typography, charts, UX guidelines, and stack-specific best practices.

## Prerequisites

Verify Python is installed:

```bash
python3 --version
```

## Process

### Step 1: Analyze Requirements

Extract from user request:

- **Product type**: SaaS, e-commerce, portfolio, dashboard, landing page
- **Style keywords**: minimal, playful, professional, elegant, dark mode
- **Industry**: healthcare, fintech, gaming, education, beauty
- **Stack**: React, Vue, Next.js, or default to `html-tailwind`

### Step 2: Search Design Database

Use the search script to gather comprehensive design information:

```bash
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "<keyword>" --domain <domain> [-n <max_results>]
```

### Available Domains

| Domain       | Use For                        | Example Keywords                        |
| ------------ | ------------------------------ | --------------------------------------- |
| `product`    | Product type recommendations   | SaaS, e-commerce, portfolio, healthcare |
| `style`      | UI styles, colors, effects     | glassmorphism, minimalism, dark mode    |
| `typography` | Font pairings, Google Fonts    | elegant, playful, professional          |
| `color`      | Color palettes by industry     | saas, ecommerce, healthcare, fintech    |
| `landing`    | Page structure, CTA strategies | hero, testimonial, pricing              |
| `chart`      | Chart types for dashboards     | trend, comparison, timeline, funnel     |
| `ux`         | Best practices, anti-patterns  | animation, accessibility, z-index       |
| `prompt`     | AI prompts, CSS keywords       | (style name)                            |

### Available Stacks

```bash
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "<keyword>" --stack <stack>
```

| Stack           | Focus                                          |
| --------------- | ---------------------------------------------- |
| `html-tailwind` | Tailwind utilities, responsive, a11y (DEFAULT) |
| `react`         | State, hooks, performance, patterns            |
| `nextjs`        | SSR, routing, images, API routes               |
| `vue`           | Composition API, Pinia, Vue Router             |
| `svelte`        | Runes, stores, SvelteKit                       |
| `swiftui`       | Views, State, Navigation, Animation            |
| `react-native`  | Components, Navigation, Lists                  |
| `flutter`       | Widgets, State, Layout, Theming                |

## Example Workflow

For a SaaS dashboard design:

```bash
# 1. Product recommendations
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "SaaS dashboard" --domain product

# 2. Style guide
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "glassmorphism modern" --domain style

# 3. Typography
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "professional tech" --domain typography

# 4. Color palette
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "saas tech" --domain color

# 5. UX guidelines
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "accessibility" --domain ux

# 6. Stack-specific (React)
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "hooks performance" --stack react
```

## Output

Synthesize search results into actionable design recommendations:

1. **Style**: Primary and secondary style recommendations
2. **Colors**: Complete palette (Primary, Secondary, CTA, Background, Text, Border)
3. **Typography**: Font pairing with Google Fonts import
4. **Layout**: Page structure and component organization
5. **UX**: Best practices and accessibility guidelines
6. **Code**: Stack-specific implementation guidance

## Pre-Delivery Checklist

Before delivering UI code:

- [ ] No emojis as icons (use SVG: Heroicons, Lucide)
- [ ] All clickable elements have `cursor-pointer`
- [ ] Hover states don't cause layout shift
- [ ] Light/dark mode contrast verified (4.5:1 minimum)
- [ ] Responsive at 320px, 768px, 1024px, 1440px
- [ ] Focus states visible for keyboard navigation
- [ ] Images have alt text
- [ ] `prefers-reduced-motion` respected

## Database Contents

- 57 UI design styles
- 95 industry-specific color palettes
- 56 typography pairings with Google Fonts
- 24 chart type recommendations
- 98 UX guidelines
- 8 tech stack best practices
