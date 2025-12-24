# Zero-QA Quality Gate Validation

Validate code against quality gates before merge/deploy.

## Usage

```
/zero-qa-gate [stage]
```

**Stages:**

- `commit` - Pre-commit checks (fastest)
- `pr` - Pull request checks (default)
- `merge` - Pre-merge validation (comprehensive)
- `deploy` - Pre-deployment validation (full)

## Quality Gates by Stage

### Commit Stage

Fast checks for immediate feedback:

- [ ] Lint passes (0 errors)
- [ ] TypeScript compiles
- [ ] Affected unit tests pass
- [ ] No secrets in code

### PR Stage

Standard checks for code review:

- [ ] All commit stage checks
- [ ] Full test suite passes
- [ ] Coverage threshold met (80%)
- [ ] No new security vulnerabilities
- [ ] Code review checklist complete

### Merge Stage

Comprehensive validation:

- [ ] All PR stage checks
- [ ] Integration tests pass
- [ ] No merge conflicts
- [ ] Documentation updated
- [ ] Breaking changes documented

### Deploy Stage

Production readiness:

- [ ] All merge stage checks
- [ ] E2E tests pass
- [ ] Performance benchmarks pass
- [ ] Security scan clean
- [ ] Rollback plan documented

## Gate Configuration

Quality thresholds from `.zero-qa/config.json`:

```json
{
  "qualityGates": {
    "testCoverage": 80,
    "lintErrors": 0,
    "typeErrors": 0,
    "securityVulnerabilities": 0
  }
}
```

## Process

1. Determine current stage
2. Load stage-specific gate criteria
3. Execute required checks
4. Aggregate results
5. Pass/Fail determination
6. Generate report with actionable items

## Output Format

```markdown
# Zero-QA Gate Report

## Gate: [STAGE]

## Status: PASS / FAIL

## Date: [timestamp]

## Checks

| Check      | Required | Result | Details           |
| ---------- | -------- | ------ | ----------------- |
| Lint       | Yes      | PASS   | 0 errors          |
| Types      | Yes      | PASS   | 0 errors          |
| Unit Tests | Yes      | PASS   | 150/150           |
| Coverage   | Yes      | PASS   | 85% (>80%)        |
| Security   | Yes      | PASS   | 0 vulnerabilities |

## Blocking Issues

Issues that must be resolved:

1. ...

## Warnings

Non-blocking but should address:

1. ...

## Gate Decision

**[APPROVED / BLOCKED]**

Reason: [explanation if blocked]
```
