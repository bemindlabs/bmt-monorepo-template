# Zero-QA Test Management

Manage and execute tests following Zero-QA testing practices.

## Usage

```
/zero-qa-test <action> [options]
```

**Actions:**

- `run` - Execute test suites
- `coverage` - Generate coverage report
- `gaps` - Identify untested code
- `generate` - Generate test stubs for new code
- `validate` - Validate test quality

## Test Categories

1. **Unit Tests**
   - Test individual functions/methods
   - Mock external dependencies
   - Fast execution (<100ms per test)

2. **Integration Tests**
   - Test component interactions
   - Use test databases/services
   - Verify API contracts

3. **E2E Tests**
   - Test complete user flows
   - Run in production-like environment
   - Cover critical paths

## Commands

```bash
# Run all tests
pnpm test

# Run with coverage
pnpm test --coverage

# Run specific test file
pnpm test path/to/file.test.ts

# Run in watch mode
pnpm test --watch

# Run E2E tests
pnpm test:e2e
```

## Test Generation

When generating tests, include:

- Happy path scenarios
- Edge cases (empty, null, boundary values)
- Error conditions
- Async behavior validation

## Coverage Thresholds

Default Zero-QA thresholds:

```json
{
  "statements": 80,
  "branches": 75,
  "functions": 80,
  "lines": 80
}
```

## Output Format

```markdown
# Zero-QA Test Report

## Summary

- **Total Tests**: X
- **Passed**: Y
- **Failed**: Z
- **Skipped**: W

## Coverage

| Metric     | Current | Threshold | Status    |
| ---------- | ------- | --------- | --------- |
| Statements | X%      | 80%       | PASS/FAIL |
| Branches   | X%      | 75%       | PASS/FAIL |
| Functions  | X%      | 80%       | PASS/FAIL |
| Lines      | X%      | 80%       | PASS/FAIL |

## Untested Areas

Files with coverage below threshold:

- `path/to/file.ts` - 45% (needs +35%)

## Test Quality Issues

- Tests without assertions: X
- Tests with weak assertions: Y
- Flaky tests identified: Z

## Recommendations

1. Add tests for [uncovered area]
2. ...
```
