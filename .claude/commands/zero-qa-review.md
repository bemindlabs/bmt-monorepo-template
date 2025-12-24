# Zero-QA Automated Code Review

Perform automated code review following Zero-QA principles.

## Usage

```
/zero-qa-review [path]
```

**Arguments:**

- `path` - File or directory to review (default: staged changes)

## Review Criteria

1. **Code Quality**
   - Clear naming conventions
   - Single responsibility principle
   - DRY (Don't Repeat Yourself)
   - KISS (Keep It Simple)
   - Proper error handling

2. **Security**
   - Input validation
   - Output encoding
   - Authentication/authorization checks
   - No hardcoded secrets
   - SQL injection prevention
   - XSS prevention

3. **Performance**
   - Efficient algorithms
   - Proper async/await usage
   - No memory leaks
   - Optimized database queries
   - Lazy loading where appropriate

4. **Maintainability**
   - Consistent formatting
   - Appropriate comments (why, not what)
   - Modular structure
   - Clear interfaces/contracts
   - Testability

5. **Testing**
   - Unit tests for new logic
   - Edge cases covered
   - Mocks used appropriately
   - Test descriptions are clear

## Process

1. Identify changed files or specified path
2. Analyze each file against review criteria
3. Check for common anti-patterns
4. Validate against project conventions
5. Generate actionable feedback

## Output Format

```markdown
# Zero-QA Code Review

## Files Reviewed

- `path/to/file1.ts`
- `path/to/file2.ts`

## Summary

- **Files**: X
- **Issues**: Y (X critical, Y warnings, Z suggestions)
- **Score**: X/100

## Findings

### Critical Issues

Must be fixed before merge.

1. **[FILE:LINE]** Issue description
   - Problem: ...
   - Suggestion: ...
   - Code example: ...

### Warnings

Should be addressed.

1. **[FILE:LINE]** Issue description
   - ...

### Suggestions

Nice to have improvements.

1. **[FILE:LINE]** Issue description
   - ...

## Checklist

- [ ] No critical issues remain
- [ ] Tests added for new functionality
- [ ] Documentation updated if needed
- [ ] No security vulnerabilities introduced
```
