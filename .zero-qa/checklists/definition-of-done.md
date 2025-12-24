# Definition of Done (DoD)

A feature or task is considered "Done" when ALL of the following criteria are met.

## Code Complete

- [ ] All acceptance criteria are implemented
- [ ] Code has been self-reviewed
- [ ] No TODO comments left in code
- [ ] Feature flags configured (if applicable)

## Quality Gates Passed

- [ ] Lint check passes (0 errors)
- [ ] Type check passes (0 errors)
- [ ] Unit tests pass
- [ ] Integration tests pass (if applicable)
- [ ] Test coverage >= 80%

## Security

- [ ] Security scan passes (0 vulnerabilities)
- [ ] No secrets in codebase
- [ ] OWASP Top 10 considered

## Review

- [ ] Code review completed
- [ ] Review comments addressed
- [ ] Approved by at least one reviewer

## Documentation

- [ ] User-facing changes documented
- [ ] API changes documented
- [ ] Changelog updated

## Deployment Ready

- [ ] Works in staging environment
- [ ] No console errors
- [ ] Performance is acceptable
- [ ] Rollback plan exists

---

Use `/zero-qa-dod` to verify Definition of Done for a feature.
