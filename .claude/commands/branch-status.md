Show status of all feature branches across submodules.

## Usage

```
/branch-status
```

## Output Format

```markdown
## Branch Status

### apps/api

| Branch             | Backlog | Status     | Last Commit | PR  |
| :----------------- | :------ | :--------- | :---------- | :-- |
| feature/US-001-... | US-001  | ahead 3    | 2h ago      | #12 |
| feature/US-003-... | US-003  | up-to-date | 1d ago      | -   |

### apps/web

| Branch             | Backlog | Status  | Last Commit | PR  |
| :----------------- | :------ | :------ | :---------- | :-- |
| feature/US-002-... | US-002  | ahead 1 | 30m ago     | #5  |

### packages/core

| Branch             | Backlog | Status  | Last Commit | PR  |
| :----------------- | :------ | :------ | :---------- | :-- |
| feature/US-004-... | US-004  | ahead 2 | 1h ago      | -   |
```

## Commands Used

```sh
# For each submodule/project
cd apps/<project>

# List feature branches
git branch -a | grep feature/

# Get branch status vs main
git log main..<branch> --oneline

# Check for open PRs
gh pr list --head <branch>

cd ../..
```

## Cross-Reference

- Match branches to backlog items
- Show backlog item status alongside branch status
- Highlight stale branches (no commits > 7 days)
