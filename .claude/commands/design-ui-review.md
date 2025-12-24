Review UI components for design consistency and best practices.

## Usage

```
/ui-review [component-path]
```

## Process

1. **Visual Consistency**
   - Check color usage against design system
   - Verify spacing and alignment
   - Review typography hierarchy
   - Validate icon usage

2. **Component Structure**
   - Props interface review
   - State management patterns
   - Event handling
   - Accessibility attributes

3. **Responsive Design**
   - Mobile breakpoints
   - Tablet breakpoints
   - Desktop layout
   - Touch targets (min 44px)

4. **Performance**
   - Bundle size impact
   - Render optimization
   - Image optimization
   - Lazy loading

## Output Format

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

## Responsive

- [ ] Mobile layout works
- [ ] No horizontal scroll
- [ ] Touch targets adequate

## Recommendations

1. ...
```
