Check responsive design across breakpoints.

## Usage

```
/responsive-check [component-or-page]
```

## Standard Breakpoints

| Name | Width  | Devices       |
| ---- | ------ | ------------- |
| xs   | 320px  | Small phones  |
| sm   | 640px  | Large phones  |
| md   | 768px  | Tablets       |
| lg   | 1024px | Laptops       |
| xl   | 1280px | Desktops      |
| 2xl  | 1536px | Large screens |

## Checklist

### Layout

- [ ] Content reflows without horizontal scroll
- [ ] No content overlap or clipping
- [ ] Proper stacking on mobile
- [ ] Grid/flex adjustments work

### Typography

- [ ] Font sizes scale appropriately
- [ ] Line lengths readable (45-75 chars)
- [ ] Headings don't overflow
- [ ] Text remains legible

### Navigation

- [ ] Mobile menu functional
- [ ] Touch targets min 44x44px
- [ ] Navigation accessible on all sizes
- [ ] Breadcrumbs adapt or hide

### Images & Media

- [ ] Images scale properly
- [ ] No image overflow
- [ ] Aspect ratios maintained
- [ ] Videos responsive

### Forms

- [ ] Input fields full width on mobile
- [ ] Labels positioned correctly
- [ ] Buttons large enough to tap
- [ ] Form layout adapts

### Spacing

- [ ] Margins/padding scale
- [ ] No excessive whitespace
- [ ] Elements don't crowd on small screens

## Testing Matrix

```markdown
| Feature | 320px | 640px | 768px | 1024px | 1280px |
| ------- | ----- | ----- | ----- | ------ | ------ |
| Header  | ✓     | ✓     | ✓     | ✓      | ✓      |
| Nav     | ✓     | ✓     | ✓     | ✓      | ✓      |
| Hero    | ⚠     | ✓     | ✓     | ✓      | ✓      |
| Cards   | ✓     | ✓     | ✓     | ✓      | ✓      |
| Footer  | ✓     | ✓     | ✓     | ✓      | ✓      |
```

## Common Issues

1. **Fixed widths** - Use max-width, %, or viewport units
2. **Overflow hidden** - Content gets cut off
3. **Tiny touch targets** - Buttons too small on mobile
4. **Missing viewport meta** - Page doesn't scale
5. **Horizontal scroll** - Elements too wide
