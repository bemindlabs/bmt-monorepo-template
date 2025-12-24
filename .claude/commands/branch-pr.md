Create pull request for feature branch.

## Usage

```
/branch-pr [backlog-id]
```

If no ID provided, infer from current branch name.

## Process

1. Determine current branch and extract backlog ID
2. Look up item details in `docs/sprints/backlog.md`
3. Generate PR title and description
4. Create PR using `gh pr create`

## PR Template

```markdown
## Summary

Implements [<ID>] <Story Title>

## Changes

-

## Testing

- [ ] Unit tests added/updated
- [ ] Manual testing completed
- [ ] Build passes
- [ ] Type-check passes

## Backlog Reference

- **ID:** <ID>
- **Points:** <Points>
- **Priority:** <Priority>

---

Related to sprint: [Sprint X](../docs/sprints/sprint-X.md)
```

## Commands Executed

```sh
# Push branch if not pushed
git push -u origin <branch>

# Create PR
gh pr create --title "<ID>: <title>" --body "..."
```

## Post-PR Actions

- Output PR URL
- Remind to update backlog status to "Review"
- Link PR in sprint document if active sprint
