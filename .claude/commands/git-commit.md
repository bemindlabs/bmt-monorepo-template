Auto-commit changes with conventional commit message.

## Usage

```
/auto-commit [--force]
```

## Process

1. Analyze changes: `git status && git diff --stat`
2. Determine type from files:
   - `docs/**` → `docs:`
   - `**/test*` → `test:`
   - bugfix → `fix:`
   - new feature → `feat:`
   - config → `chore:`
3. Determine scope from path:
   - `apps/core-services/**` → `(core)`
   - `apps/domain-services/**` → `(domain)`
   - `apps/platform-services/**` → `(platform)`
   - `apps/web-apps/**` → `(web)`
   - `packages/**` → `(packages)`
4. Generate message: `type(scope): description`
5. Execute: `git add . && git commit -m "..."`

## Examples

```
feat(core): add multi-tenant authentication
fix(web): resolve dashboard routing issue
docs: update README
chore: update dependencies
test(packages): add unit tests for utils
```
