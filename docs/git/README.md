# Git Workflow

Automated git operations and branch management commands.

## Commands Overview

| Command                 | Description                           |
| ----------------------- | ------------------------------------- |
| `/git-status`           | Show monorepo status                  |
| `/git-commit`           | Auto-commit with conventional message |
| `/git-changelog`        | Create changelog entry                |
| `/git-repo-init`        | Initialize submodules after clone     |
| `/git-submodule-add`    | Add new submodule                     |
| `/git-submodule-update` | Update all submodules                 |
| `/branch-create`        | Create feature branch                 |
| `/branch-status`        | Show branch status across submodules  |
| `/branch-pr`            | Create pull request                   |

## Git Commands

### /git-status

Show current status of the monorepo.

```bash
/git-status
```

Displays:

- Current branch
- Uncommitted changes
- Submodule status
- Remote sync status

### /git-commit

Auto-commit changes with conventional commit message.

```bash
/git-commit [--force]
```

#### Commit Type Detection

| Files Changed | Type     |
| ------------- | -------- |
| `docs/**`     | `docs:`  |
| `**/test*`    | `test:`  |
| bugfix        | `fix:`   |
| new feature   | `feat:`  |
| config        | `chore:` |

#### Scope Detection

| Path                        | Scope        |
| --------------------------- | ------------ |
| `apps/core-services/**`     | `(core)`     |
| `apps/domain-services/**`   | `(domain)`   |
| `apps/platform-services/**` | `(platform)` |
| `apps/web-apps/**`          | `(web)`      |
| `packages/**`               | `(packages)` |

#### Examples

```
feat(core): add multi-tenant authentication
fix(web): resolve dashboard routing issue
docs: update README
chore: update dependencies
test(packages): add unit tests for utils
```

### /git-changelog

Create a new changelog entry.

```bash
/git-changelog
```

Generates changelog from recent commits following Keep a Changelog format.

### /git-repo-init

Initialize all git submodules after cloning.

```bash
/git-repo-init
```

Equivalent to:

```bash
git submodule update --init --recursive
```

### /git-submodule-add

Add a new git submodule.

```bash
/git-submodule-add <repo-url> <path>
```

### /git-submodule-update

Update all submodules to latest commits.

```bash
/git-submodule-update
```

## Branch Commands

### /branch-create

Create feature branch from backlog item.

```bash
/branch-create <backlog-id>
```

Creates branch: `feature/<ID>-<slug>`

Example:

```bash
/branch-create US-001
# Creates: feature/US-001-user-authentication
```

### /branch-status

Show status of all feature branches across submodules.

```bash
/branch-status
```

Output:

```markdown
## Branch Status

| Branch                   | Submodule | Status | Commits Behind |
| ------------------------ | --------- | ------ | -------------- |
| feature/US-001-auth      | apps/core | Active | 0              |
| feature/US-002-dashboard | apps/web  | Active | 2              |
```

### /branch-pr

Create pull request for feature branch.

```bash
/branch-pr [branch-name]
```

Creates PR with:

- Auto-generated title from branch name
- Description from commits
- Linked issues

## Conventional Commits

This project follows [Conventional Commits](https://www.conventionalcommits.org/).

### Format

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Types

| Type       | Description                |
| ---------- | -------------------------- |
| `feat`     | New feature                |
| `fix`      | Bug fix                    |
| `docs`     | Documentation              |
| `style`    | Formatting, no code change |
| `refactor` | Code restructuring         |
| `perf`     | Performance improvement    |
| `test`     | Adding tests               |
| `chore`    | Maintenance                |
| `ci`       | CI/CD changes              |

### Examples

```bash
feat(auth): add OAuth2 login support
fix(api): handle null response from external service
docs(readme): update installation instructions
refactor(core): extract validation logic to utils
test(web): add unit tests for dashboard component
chore(deps): update typescript to 5.7
```

## Workflow Example

```bash
# 1. Create feature branch
/branch-create US-001

# 2. Make changes...

# 3. Auto-commit
/git-commit

# 4. Check status
/branch-status

# 5. Create PR
/branch-pr
```

## Best Practices

1. **Atomic commits** - One logical change per commit
2. **Clear messages** - Describe what and why
3. **Branch per feature** - Keep work isolated
4. **Regular syncs** - Pull main frequently
5. **Clean history** - Squash before merge if needed
