Create or update design system documentation and tokens.

## Usage

```
/design-system [action]
```

Actions: `init`, `audit`, `tokens`, `components`, `docs`

## Design System Structure

```
design-system/
├── tokens/
│   ├── colors.json
│   ├── typography.json
│   ├── spacing.json
│   ├── shadows.json
│   └── breakpoints.json
├── components/
│   ├── primitives/
│   ├── patterns/
│   └── templates/
└── docs/
    ├── principles.md
    ├── guidelines.md
    └── changelog.md
```

## Token Categories

### Colors

```json
{
  "primary": { "50": "#f0f9ff", "500": "#0ea5e9", "900": "#0c4a6e" },
  "semantic": { "success": "#22c55e", "error": "#ef4444", "warning": "#f59e0b" }
}
```

### Typography

```json
{
  "fontFamily": { "sans": "Inter", "mono": "JetBrains Mono" },
  "fontSize": { "xs": "12px", "sm": "14px", "base": "16px", "lg": "18px" },
  "fontWeight": { "normal": 400, "medium": 500, "bold": 700 }
}
```

### Spacing

```json
{
  "0": "0",
  "1": "4px",
  "2": "8px",
  "3": "12px",
  "4": "16px",
  "6": "24px",
  "8": "32px",
  "12": "48px",
  "16": "64px"
}
```

## Component Documentation Template

```markdown
# Component: [Name]

## Overview

Brief description of the component.

## Props

| Prop | Type | Default | Description |
| ---- | ---- | ------- | ----------- |

## Variants

- Primary
- Secondary
- Outline

## States

- Default
- Hover
- Active
- Disabled
- Loading

## Usage

\`\`\`tsx
<Button variant="primary" size="md">Click me</Button>
\`\`\`

## Accessibility

- Role: button
- Keyboard: Enter/Space
- ARIA: aria-disabled, aria-busy
```
