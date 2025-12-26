# Verify Project

Run comprehensive project verification to ensure code quality and build integrity.

## Usage

```
/verify [scope]
```

**Scopes:**

- `all` (default) - Run full verification suite
- `quick` - Lint + type-check only (fastest)
- `build` - Verify build succeeds
- `test` - Run tests with coverage

## Process

1. **Run Lint Check**

   ```bash
   pnpm lint
   ```

2. **Run Type Check**

   ```bash
   pnpm type-check
   ```

3. **Run Tests** (if scope includes tests)

   ```bash
   pnpm test
   ```

4. **Run Build** (if scope includes build)

   ```bash
   pnpm build
   ```

5. **Report Results**
   - Summarize pass/fail status for each step
   - List any errors or warnings found
   - Provide actionable fix suggestions

## Output Format

```markdown
# Verification Report

## Summary

| Check      | Status | Details            |
| ---------- | ------ | ------------------ |
| Lint       | PASS   | 0 errors           |
| Type-Check | PASS   | 0 errors           |
| Tests      | PASS   | X/Y passed, Z% cov |
| Build      | PASS   | Completed in Xs    |

## Overall: PASS / FAIL

## Issues (if any)

### Errors

- [file:line] Error description

### Warnings

- [file:line] Warning description

## Next Steps

1. ...
```

## Behavior

- Stop on first critical failure and report
- Continue through warnings to collect all issues
- For `quick` scope, skip tests and build
- For `build` scope, run lint + types + build
- For `test` scope, run lint + types + tests
- For `all` scope, run everything
