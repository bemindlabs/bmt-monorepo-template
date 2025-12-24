# Design System

UI/UX design tools, accessibility checks, and design system management.

## Commands Overview

| Command                    | Description                    |
| -------------------------- | ------------------------------ |
| `/design-search`           | Search design database         |
| `/design-color-palette`    | Generate/review color palettes |
| `/design-system-tokens`    | Create/update design tokens    |
| `/design-a11y-check`       | Accessibility compliance check |
| `/design-responsive-check` | Responsive design check        |
| `/design-ui-review`        | UI component review            |
| `/design-ux-audit`         | UX flow audit                  |

## Design Search

### /design-search

Search UI/UX design database for styles, colors, typography, and best practices.

```bash
/design-search <query>
```

Examples:

```bash
/design-search "glassmorphism button"
/design-search "dark mode color palette"
/design-search "accessible form design"
```

## Color & Tokens

### /design-color-palette

Generate or review color palettes for UI design.

```bash
/design-color-palette [action]
```

Actions:

- `generate` - Create new palette
- `review` - Review existing palette
- `a11y` - Check contrast ratios

### /design-system-tokens

Create or update design system documentation and tokens.

```bash
/design-system-tokens
```

Generates:

- Color tokens
- Typography scale
- Spacing scale
- Shadow definitions
- Border radius values

## Accessibility

### /design-a11y-check

Check accessibility compliance (WCAG 2.1 AA).

```bash
/design-a11y-check [component-path]
```

Checks:

- Color contrast (4.5:1 text, 3:1 large text)
- ARIA labels and roles
- Keyboard navigation
- Focus management
- Screen reader compatibility

#### Output

```markdown
# Accessibility Report

## Summary

- **Score**: 85/100
- **Level**: WCAG 2.1 AA

## Issues Found

### Critical (must fix)

- [ ] Missing alt text on images

### Major (should fix)

- [ ] Low contrast on secondary buttons

### Minor (nice to fix)

- [ ] Focus order could be improved
```

## Responsive Design

### /design-responsive-check

Check responsive design across breakpoints.

```bash
/design-responsive-check [component-path]
```

Breakpoints checked:

- Mobile: 320px, 375px, 414px
- Tablet: 768px, 1024px
- Desktop: 1280px, 1440px, 1920px

#### Checklist

- [ ] No horizontal scroll
- [ ] Touch targets >= 44px
- [ ] Text readable without zoom
- [ ] Images scale properly
- [ ] Navigation accessible

## UI Review

### /design-ui-review

Review UI components for design consistency and best practices.

```bash
/design-ui-review [component-path]
```

#### Review Areas

1. **Visual Consistency**
   - Color usage against design system
   - Spacing and alignment
   - Typography hierarchy
   - Icon usage

2. **Component Structure**
   - Props interface
   - State management
   - Event handling
   - Accessibility attributes

3. **Performance**
   - Bundle size impact
   - Render optimization
   - Image optimization
   - Lazy loading

#### Output

```markdown
# UI Review: [Component Name]

## Visual Consistency

- [ ] Colors match design system
- [ ] Spacing follows 8px grid
- [ ] Typography uses design tokens
- [ ] Icons are consistent

## Accessibility

- [ ] ARIA labels present
- [ ] Keyboard navigation works
- [ ] Color contrast passes WCAG AA
- [ ] Focus states visible

## Recommendations

1. ...
```

## UX Audit

### /design-ux-audit

Conduct UX audit on user flows and interactions.

```bash
/design-ux-audit [flow-name]
```

Audit areas:

- User journey mapping
- Friction points
- Cognitive load
- Error handling
- Feedback mechanisms

## Design Tokens Structure

```
design-system/
├── tokens/
│   ├── colors.json
│   ├── typography.json
│   ├── spacing.json
│   └── shadows.json
├── components/
│   ├── button.css
│   ├── input.css
│   └── card.css
└── docs/
    └── design-system.md
```

## Color Token Example

```json
{
  "color": {
    "primary": {
      "50": "#eff6ff",
      "100": "#dbeafe",
      "500": "#3b82f6",
      "600": "#2563eb",
      "900": "#1e3a8a"
    },
    "semantic": {
      "success": "#22c55e",
      "warning": "#f59e0b",
      "error": "#ef4444",
      "info": "#3b82f6"
    }
  }
}
```

## Best Practices

1. **Consistency** - Use design tokens everywhere
2. **Accessibility first** - Design for all users
3. **Mobile first** - Start with smallest screens
4. **Document changes** - Keep design system updated
5. **Test with users** - Validate assumptions
