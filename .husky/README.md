# Husky Git Hooks

> Git hooks for code quality and commit standards in Monorepo Agents Workflow

**Status**: ✅ Active  
**Last Updated**: 2025-11-22

This directory contains Git hooks managed by Husky for the Monorepo Agents Workflow monorepo.

## Available Hooks

### commit-msg

Validates commit messages using Conventional Commits format.

**Format:** `type(scope): subject`

**Common Types:**

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks
- `perf`: Performance improvements
- `ci`: CI/CD changes
- `build`: Build system changes

**Common Scopes:**

- Apps: `web-saas-dashboard`, `web-tenant-dashboard`, `web-tools`, `app-pos`, `app-main`
- Services: `service-core`, `service-accounting`, `service-hr`, `service-inventory`, etc.
- Packages: `shared-components`, `i18n`, `database`, `ai-sdk`, `utils`
- Infrastructure: `docker`, `ci`, `scripts`

**Examples:**

```bash
feat(service-core): add multi-tenant user management
fix(web-saas-dashboard): resolve OAuth redirect issue
docs(readme): update installation instructions
chore(deps): update dependencies
test(service-hr): add payroll calculation tests
```

### pre-commit

Runs before each commit to ensure code quality.

**Checks:**

1. ✅ Sensitive files detection (`.env`, `.pem`, `.key`, etc.)
2. ✅ Large files detection (>5MB)
3. ✅ Prettier formatting
4. ✅ ESLint linting
5. ⚠️ Console statements (warning only)
6. ⚠️ TODO/FIXME comments (warning only)
7. ❌ Debugger statements (blocks commit)

**Bypass (not recommended):**

```bash
git commit --no-verify -m "message"
```

### pre-push

Runs before pushing to remote repository.

**Checks:**

1. ✅ TypeScript type checking (all packages)
2. ✅ ESLint on changed files
3. ✅ Unit tests (with 2-minute timeout)
4. ⚠️ Package.json/lockfile sync check
5. ⚠️ Database migration detection
6. ⚠️ Protected branch warnings (main, production, staging)

**Special Handling:**

- `app-main` type errors are treated as warnings (known React Native issues)
- Tests timeout after 2 minutes to prevent hanging
- Protected branches show warnings with delays

**Bypass (not recommended):**

```bash
git push --no-verify
```

## Configuration

### Disable Hooks Temporarily

```bash
# Disable all hooks
export HUSKY=0

# Run your git commands
git commit -m "message"
git push

# Re-enable hooks
unset HUSKY
```

### Skip Specific Checks

For pre-commit:

```bash
# Skip linting (not recommended)
SKIP_LINT=1 git commit -m "message"
```

For pre-push:

```bash
# Skip tests (not recommended)
SKIP_TESTS=1 git push
```

## Troubleshooting

### Hook Not Running

1. Ensure Husky is installed:

   ```bash
   pnpm install
   ```

2. Check hook permissions:

   ```bash
   chmod +x .husky/*
   ```

3. Verify Git hooks path:
   ```bash
   git config core.hooksPath
   # Should output: .husky
   ```

### Type Check Failures

If type checking fails:

1. Run type check locally:

   ```bash
   pnpm type-check
   ```

2. Fix errors in specific package:

   ```bash
   pnpm --filter @monorepo-agents/service-core type-check
   ```

3. Known issue with `app-main` (React Native):
   - Type errors in `app-main` are treated as warnings
   - Will not block push unless other packages also fail

### Linting Failures

If linting fails:

1. Auto-fix issues:

   ```bash
   pnpm lint:fix
   ```

2. Check specific files:
   ```bash
   pnpm exec eslint path/to/file.ts
   ```

### Test Failures

If tests fail:

1. Run tests locally:

   ```bash
   pnpm test
   ```

2. Run tests for specific package:

   ```bash
   pnpm --filter @monorepo-agents/service-core test
   ```

3. Run tests in watch mode:
   ```bash
   pnpm test:watch
   ```

## Best Practices

1. **Commit Often**: Make small, focused commits
2. **Write Good Messages**: Follow Conventional Commits format
3. **Fix Issues Early**: Don't bypass hooks unless absolutely necessary
4. **Test Locally**: Run `pnpm test` before pushing
5. **Keep Lockfile Updated**: Run `pnpm install` after changing dependencies
6. **Review Changes**: Use `git diff --staged` before committing

## Maintenance

### Update Hooks

Edit the hook files in `.husky/` directory and commit changes.

### Add New Hooks

1. Create new hook file:

   ```bash
   touch .husky/post-merge
   chmod +x .husky/post-merge
   ```

2. Add hook logic
3. Test the hook
4. Commit and push

### Remove Hooks

To completely disable Husky:

1. Remove from package.json:

   ```json
   {
     "scripts": {
       "prepare": "husky install" // Remove this
     }
   }
   ```

2. Delete `.husky` directory

## Internal Husky Files

The `.husky/_/` directory contains Husky's internal hook management files. These should not be modified directly:

- `husky.sh` - Core Husky script
- Hook templates - Internal Husky infrastructure

## Related Documentation

**Project Documentation:**

- [Project Guidelines](../AGENTS.md)
- [Development Workflow](../docs/development/DEVELOPER_GUIDE.md)
- [Git Workflow](../docs/development/GIT_WORKFLOW.md)
- [Testing Guide](../docs/development/TESTING_GUIDE.md)

**External Resources:**

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Husky Documentation](https://typicode.github.io/husky/)
- [Commitlint](https://commitlint.js.org/)
- [lint-staged](https://github.com/okonet/lint-staged)

---

**Last Updated**: 2025-11-22  
**Maintained By**: Monorepo Agents Workflow Team
