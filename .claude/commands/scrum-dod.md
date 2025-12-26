# Definition of Done

Manage and validate the Definition of Done (DoD) for backlog items.

## Instructions

### DoD Actions

Based on `$ARGUMENTS`, perform one of these actions:

#### `show` (default) - Display Definition of Done

1. Read DoD from `.scrum/definition-of-done.md`
2. Display checklist
3. Show compliance status

#### `check` - Check item against DoD

1. Validate item meets all DoD criteria
2. Generate compliance report
3. Flag missing criteria

#### `update` - Update DoD

1. Review and update DoD criteria
2. Get team agreement
3. Document changes

### Definition of Done Template

Create/maintain `.scrum/definition-of-done.md`:

```markdown
# Definition of Done

> A shared understanding of what it means for work to be complete.

**Last Updated:** {YYYY-MM-DD}
**Approved By:** Team

## Code Quality

- [ ] Code compiles without errors
- [ ] Code passes all linting rules
- [ ] Code follows project coding standards
- [ ] No `any` types (TypeScript strict mode)
- [ ] Code is reviewed and approved

## Testing

- [ ] Unit tests written and passing
- [ ] Test coverage meets threshold (80%)
- [ ] Integration tests passing (if applicable)
- [ ] E2E tests passing (if applicable)
- [ ] No regression in existing tests

## Documentation

- [ ] Code is self-documenting or commented
- [ ] API documentation updated (if applicable)
- [ ] README updated (if applicable)
- [ ] Changelog entry added (if applicable)

## Security

- [ ] No security vulnerabilities introduced
- [ ] Sensitive data properly handled
- [ ] Dependencies audited

## Deployment

- [ ] Build passes in CI/CD
- [ ] Feature tested in staging (if applicable)
- [ ] No breaking changes (or documented)

## Acceptance

- [ ] Acceptance criteria met
- [ ] Product Owner reviewed (if applicable)
- [ ] Demo ready (if applicable)

---

## DoD Compliance Check

### Item: {PBI-XXX}

| Criterion      | Status | Notes               |
| -------------- | ------ | ------------------- |
| Code compiles  | ✅     |                     |
| Linting passes | ✅     |                     |
| Tests written  | ✅     |                     |
| Coverage met   | ⚠️     | 78% - needs 2% more |

**Result:** {Ready | Not Ready}
**Blockers:** {List any blockers}
```

### DoD vs Acceptance Criteria

- **DoD:** Applies to ALL items (quality standard)
- **Acceptance Criteria:** Specific to each item (functionality)

Both must be met for an item to be "Done."

## Arguments

- `$ARGUMENTS` - Action: `show`, `check {id}`, `update`

## Output

Display DoD or validate item compliance.
