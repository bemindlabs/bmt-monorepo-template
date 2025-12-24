# Zero-QA Definition of Done

Validate that work items meet the Definition of Done criteria.

## Usage

```
/zero-qa-dod [item-id]
```

**Arguments:**

- `item-id` - Optional backlog item or issue ID to validate

## Definition of Done Checklist

### Code Quality

- [ ] Code follows project coding standards
- [ ] No lint errors or warnings
- [ ] TypeScript strict mode passes
- [ ] No commented-out code
- [ ] No TODO/FIXME without issue reference

### Testing

- [ ] Unit tests written and passing
- [ ] Integration tests updated if needed
- [ ] E2E tests updated for UI changes
- [ ] Test coverage meets threshold (80%)
- [ ] Edge cases and error conditions tested

### Security

- [ ] No hardcoded credentials or secrets
- [ ] Input validation implemented
- [ ] Authentication/authorization verified
- [ ] Security scan passes
- [ ] OWASP top 10 considered

### Documentation

- [ ] Code is self-documenting (clear naming)
- [ ] Complex logic has explanatory comments
- [ ] API documentation updated
- [ ] README updated if needed
- [ ] Breaking changes documented

### Review

- [ ] Code review completed
- [ ] Review comments addressed
- [ ] Approved by required reviewers

### Deployment

- [ ] Feature flag configured if needed
- [ ] Database migrations tested
- [ ] Environment variables documented
- [ ] Rollback plan identified
- [ ] Monitoring/alerts configured

## Process

1. Identify the work item (from current branch, issue, or argument)
2. Review changes associated with the item
3. Validate against DoD checklist
4. Identify missing criteria
5. Generate completion report

## Output Format

```markdown
# Definition of Done: [Item Title]

## Item Details

- **ID**: #123
- **Branch**: feature/item-123
- **Type**: Feature / Bug Fix / Enhancement

## DoD Status: COMPLETE / INCOMPLETE

## Checklist Results

### Code Quality (X/5)

- [x] Code follows project coding standards
- [x] No lint errors or warnings
- [ ] TypeScript strict mode passes
- [x] No commented-out code
- [x] No TODO/FIXME without issue reference

### Testing (X/5)

- [x] Unit tests written and passing
- [x] Integration tests updated if needed
- [ ] E2E tests updated for UI changes
- [x] Test coverage meets threshold
- [x] Edge cases tested

### Security (X/5)

...

### Documentation (X/5)

...

### Review (X/2)

...

### Deployment (X/5)

...

## Missing Items

Items that must be completed:

1. Fix TypeScript errors in `file.ts`
2. Add E2E test for new modal

## Overall Score: X/27 (Y%)

## Recommendation

**[READY TO MERGE / NEEDS WORK]**
```
