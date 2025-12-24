Generate or review color palettes for UI design.

## Usage

```
/color-palette [action] [base-color]
```

Actions: `generate`, `review`, `contrast`, `semantic`

## Color Scale Generation

From a base color, generate a full scale:

```
50   - Lightest (backgrounds)
100  - Very light
200  - Light
300  - Light medium
400  - Medium
500  - Base color (primary actions)
600  - Medium dark
700  - Dark
800  - Very dark
900  - Darkest (text)
950  - Near black
```

## Semantic Colors

| Purpose | Light Mode | Dark Mode |
| ------- | ---------- | --------- |
| Primary | blue-600   | blue-400  |
| Success | green-600  | green-400 |
| Warning | amber-500  | amber-400 |
| Error   | red-600    | red-400   |
| Info    | sky-600    | sky-400   |

## Background & Surface

| Layer      | Light Mode | Dark Mode |
| ---------- | ---------- | --------- |
| Background | white      | gray-900  |
| Surface    | gray-50    | gray-800  |
| Elevated   | white      | gray-700  |
| Overlay    | black/50   | black/70  |

## Text Colors

| Purpose   | Light Mode | Dark Mode |
| --------- | ---------- | --------- |
| Primary   | gray-900   | gray-50   |
| Secondary | gray-600   | gray-400  |
| Tertiary  | gray-500   | gray-500  |
| Disabled  | gray-400   | gray-600  |
| Inverse   | white      | gray-900  |

## Contrast Requirements (WCAG AA)

| Text Size                      | Minimum Ratio |
| ------------------------------ | ------------- |
| Normal text (<18px)            | 4.5:1         |
| Large text (≥18px bold, ≥24px) | 3:1           |
| UI components                  | 3:1           |

## Color Tools

```javascript
// Check contrast ratio
function contrastRatio(fg, bg) {
  const L1 = relativeLuminance(fg);
  const L2 = relativeLuminance(bg);
  return (Math.max(L1, L2) + 0.05) / (Math.min(L1, L2) + 0.05);
}

// Generate shade
function generateShade(hex, percent) {
  // Lighten (positive) or darken (negative)
}
```

## Output Format

```markdown
# Color Palette: [Name]

## Primary

| Scale | Hex     | RGB         | Usage       |
| ----- | ------- | ----------- | ----------- |
| 50    | #eff6ff | 239,246,255 | Backgrounds |
| 500   | #3b82f6 | 59,130,246  | Buttons     |
| 900   | #1e3a8a | 30,58,138   | Text        |

## Contrast Matrix

| Foreground | Background | Ratio | Pass  |
| ---------- | ---------- | ----- | ----- |
| gray-900   | white      | 21:1  | ✓ AAA |
| blue-600   | white      | 4.7:1 | ✓ AA  |
```
