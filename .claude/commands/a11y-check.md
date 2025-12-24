Check accessibility compliance (WCAG 2.1 AA).

## Usage

```
/a11y-check [component-or-page]
```

## WCAG 2.1 Checklist

### Perceivable

- [ ] **1.1.1** Non-text content has text alternatives
- [ ] **1.3.1** Info and relationships programmatically determined
- [ ] **1.4.1** Color is not the only visual means of conveying info
- [ ] **1.4.3** Contrast ratio at least 4.5:1 (text), 3:1 (large text)
- [ ] **1.4.4** Text can be resized up to 200%
- [ ] **1.4.10** Content reflows without horizontal scrolling at 320px
- [ ] **1.4.11** Non-text contrast at least 3:1

### Operable

- [ ] **2.1.1** All functionality available from keyboard
- [ ] **2.1.2** No keyboard traps
- [ ] **2.4.1** Skip links or bypass blocks
- [ ] **2.4.3** Focus order logical and meaningful
- [ ] **2.4.4** Link purpose clear from context
- [ ] **2.4.6** Headings and labels describe purpose
- [ ] **2.4.7** Focus indicator visible
- [ ] **2.5.3** Accessible name matches visible label

### Understandable

- [ ] **3.1.1** Page language specified
- [ ] **3.2.1** No unexpected context changes on focus
- [ ] **3.2.2** No unexpected context changes on input
- [ ] **3.3.1** Error identification clear
- [ ] **3.3.2** Labels or instructions provided

### Robust

- [ ] **4.1.1** No major parsing errors
- [ ] **4.1.2** Name, role, value for UI components
- [ ] **4.1.3** Status messages programmatically determined

## Testing Tools

```bash
# axe-core
npm install axe-core

# pa11y
npx pa11y https://example.com

# lighthouse
npx lighthouse https://example.com --only-categories=accessibility
```

## Output Format

```markdown
# Accessibility Report: [Component/Page]

## Score: [X]/100

## Critical Issues

1. **Issue**: Missing alt text on images
   **WCAG**: 1.1.1
   **Fix**: Add descriptive alt attributes

## Warnings

1. **Issue**: Low contrast on secondary text
   **WCAG**: 1.4.3
   **Current**: 3.2:1
   **Required**: 4.5:1

## Passed

- Keyboard navigation ✓
- Focus indicators ✓
- Heading hierarchy ✓
```
