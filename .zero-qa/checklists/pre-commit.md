# Pre-Commit Checklist

Verification steps to complete before committing code.

## Automated Checks

Run these commands before committing:

```bash
# Run all Zero-QA checks
pnpm zero-qa

# Or run individually:
pnpm lint          # Check for linting errors
pnpm type-check    # Check for type errors
pnpm test          # Run unit tests
```

## Manual Verification

- [ ] Changes are scoped to the task at hand
- [ ] No unrelated changes included
- [ ] No debug code or console.logs
- [ ] No commented-out code
- [ ] Commit message follows conventions

## Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Formatting, no code change
- `refactor`: Code change, no feature/fix
- `test`: Adding tests
- `chore`: Maintenance tasks

### Example

```
feat(auth): add password reset functionality

Implement forgot password flow with email verification.
Includes rate limiting to prevent abuse.

Closes #123
```

---

Use `/zero-qa-check` to run pre-commit verification.
