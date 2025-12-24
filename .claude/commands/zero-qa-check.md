# Run Zero-QA Quality Checks

Run comprehensive quality checks to validate code meets Zero-QA standards.

## Usage

```
/zero-qa-check [scope]
```

**Scopes:**

- `all` (default) - Run all checks
- `quick` - Lint and type-check only
- `tests` - Run test suites only
- `security` - Security-focused checks

## Process

1. **Static Analysis**
   - Run ESLint/Biome for code quality
   - Run TypeScript type checking
   - Check for unused imports/variables
   - Validate naming conventions

2. **Test Execution**
   - Run unit tests with coverage
   - Run integration tests
   - Validate test coverage thresholds

3. **Security Checks**
   - Scan for known vulnerabilities (npm audit / pnpm audit)
   - Check for hardcoded secrets
   - Validate dependency licenses

4. **Code Quality Metrics**
   - Cyclomatic complexity analysis
   - Function/file length checks
   - Duplication detection

## Commands to Execute

```bash
# Lint check
pnpm lint

# Type check
pnpm type-check

# Unit tests with coverage
pnpm test --coverage

# Security audit
pnpm audit
```

## Output Format

```markdown
# Zero-QA Check Report

## Summary

- **Status**: PASS/FAIL
- **Date**: [timestamp]
- **Scope**: [scope]

## Results

| Check    | Status    | Details                 |
| -------- | --------- | ----------------------- |
| Lint     | PASS/FAIL | X errors, Y warnings    |
| Types    | PASS/FAIL | X errors                |
| Tests    | PASS/FAIL | X/Y passed, Z% coverage |
| Security | PASS/FAIL | X vulnerabilities       |

## Issues Found

### Critical

- ...

### Warnings

- ...

## Recommendations

1. ...
```
