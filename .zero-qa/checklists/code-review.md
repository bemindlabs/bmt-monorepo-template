# Code Review Checklist

Automated code review checklist for Zero-QA quality assurance.

## Code Quality

- [ ] Code follows project style guidelines
- [ ] No linting errors or warnings
- [ ] No TypeScript/type errors
- [ ] Functions are under 50 lines
- [ ] Files are under 300 lines
- [ ] Cyclomatic complexity is under 10

## Testing

- [ ] Unit tests written for new code
- [ ] All tests pass
- [ ] Test coverage meets threshold (80%)
- [ ] Edge cases are covered
- [ ] Error scenarios are tested

## Security

- [ ] No hardcoded secrets or credentials
- [ ] Input validation is implemented
- [ ] No SQL injection vulnerabilities
- [ ] No XSS vulnerabilities
- [ ] Dependencies are up to date

## Documentation

- [ ] Public APIs are documented
- [ ] Complex logic has comments
- [ ] README updated if needed
- [ ] Breaking changes documented

## Performance

- [ ] No obvious performance issues
- [ ] No unnecessary re-renders (React)
- [ ] Database queries are optimized
- [ ] No memory leaks

## Architecture

- [ ] Follows existing patterns
- [ ] Proper separation of concerns
- [ ] No circular dependencies
- [ ] Appropriate error handling

---

Use `/zero-qa-review` to run an automated code review.
