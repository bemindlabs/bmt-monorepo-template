# Fix GitHub Issues

List, analyze, and fix GitHub issues.

## Instructions

### Workflow

1. **List Open Issues**

   ```bash
   gh issue list --state open --limit 20
   ```

2. **Prioritize Issues**
   - Filter by labels: `bug`, `priority:high`, `good first issue`
   - Sort by: oldest, most commented, milestone

   ```bash
   gh issue list --label bug --state open
   gh issue list --assignee @me --state open
   ```

3. **Get Issue Details**

   ```bash
   gh issue view <issue-number>
   ```

4. **Analyze Issue**
   - Read description and comments
   - Identify:
     - Steps to reproduce (for bugs)
     - Acceptance criteria (for features)
     - Related files/code
     - Dependencies on other issues

5. **Create Feature Branch**

   ```bash
   git checkout -b fix/<issue-number>-<short-description>
   ```

6. **Implement Fix**
   - Make necessary code changes
   - Follow project coding standards
   - Add/update tests
   - Update documentation if needed

7. **Verify Fix**

   ```bash
   pnpm lint && pnpm type-check && pnpm test && pnpm build
   ```

8. **Commit with Issue Reference**

   ```
   fix(scope): description of fix

   Fixes #<issue-number>
   ```

9. **Create Pull Request**

   ```bash
   gh pr create --title "Fix #<issue-number>: description" \
     --body "Fixes #<issue-number>"
   ```

### Issue Types

| Label           | Type     | Branch Prefix |
| --------------- | -------- | ------------- |
| `bug`           | Bug fix  | `fix/`        |
| `enhancement`   | Feature  | `feature/`    |
| `documentation` | Docs     | `docs/`       |
| `refactor`      | Refactor | `refactor/`   |

### Useful Commands

```bash
# List issues by label
gh issue list --label "bug"
gh issue list --label "priority:high"

# List issues assigned to me
gh issue list --assignee @me

# List issues by milestone
gh issue list --milestone "v1.0"

# View issue with comments
gh issue view <number> --comments

# Add comment to issue
gh issue comment <number> --body "Working on this"

# Close issue
gh issue close <number> --reason completed

# Create new issue
gh issue create --title "Title" --body "Description"

# Link PR to issue
gh pr create --body "Fixes #<number>"
```

### Issue Workflow

```
Open → In Progress → Review → Closed
  │         │           │
  └─────────┴───────────┴── Update issue status via comments/labels
```

## Arguments

- `$ARGUMENTS` - Optional: issue number, label filter, or `--mine`

## Output

1. List relevant issues with priority
2. Select issue to work on
3. Analyze and understand requirements
4. Implement fix with tests
5. Create PR linked to issue
