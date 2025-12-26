# Fix GitHub PR Review Issues

Find and fix issues from pull request reviews.

## Instructions

### Workflow

1. **List PRs with Pending Reviews**

   ```bash
   gh pr list --state open --author @me
   gh pr list --state open --search "review:changes_requested"
   ```

2. **Get PR Review Details**

   ```bash
   gh pr view <pr-number>
   gh pr view <pr-number> --comments
   ```

3. **List Review Comments**

   ```bash
   gh api repos/{owner}/{repo}/pulls/<pr-number>/reviews
   gh api repos/{owner}/{repo}/pulls/<pr-number>/comments
   ```

4. **Analyze Review Feedback**
   - Identify requested changes
   - Categorize feedback:
     - Code style issues
     - Logic/bug fixes
     - Performance improvements
     - Test coverage gaps
     - Documentation needs
     - Security concerns

5. **Checkout PR Branch**

   ```bash
   gh pr checkout <pr-number>
   ```

6. **Address Each Review Comment**
   - Fix code issues mentioned
   - Add missing tests
   - Update documentation
   - Resolve conversations inline

7. **Verify All Fixes**

   ```bash
   pnpm lint && pnpm type-check && pnpm test && pnpm build
   ```

8. **Commit Fixes**

   ```
   fix(scope): address PR review feedback

   - Fix: description of fix 1
   - Fix: description of fix 2
   ```

9. **Push and Re-request Review**

   ```bash
   git push
   gh pr review <pr-number> --comment --body "Addressed all review comments. Ready for re-review."
   ```

### Review Status Types

| Status              | Action Required              |
| ------------------- | ---------------------------- |
| `changes_requested` | Fix issues, push, re-request |
| `commented`         | Review comments, respond/fix |
| `approved`          | Ready to merge               |
| `pending`           | Waiting for reviewer         |
| `dismissed`         | Re-request review if needed  |

### Common Review Issues

| Issue Type    | Fix Approach                          |
| ------------- | ------------------------------------- |
| Code style    | Run `pnpm lint:fix` and `pnpm format` |
| Type errors   | Fix TypeScript issues                 |
| Missing tests | Add unit/integration tests            |
| Logic bugs    | Fix implementation, add test case     |
| Performance   | Optimize code, add benchmarks         |
| Security      | Fix vulnerability, add validation     |
| Documentation | Update comments, README, or docs/     |

### Useful Commands

```bash
# List all open PRs
gh pr list --state open

# List PRs needing my review
gh pr list --search "review-requested:@me"

# List my PRs with changes requested
gh pr list --author @me --search "review:changes_requested"

# View PR diff
gh pr diff <pr-number>

# View specific review
gh api repos/{owner}/{repo}/pulls/<pr-number>/reviews/<review-id>

# Reply to review comment
gh api repos/{owner}/{repo}/pulls/<pr-number>/comments/<comment-id>/replies \
  -f body="Fixed in latest commit"

# Resolve review thread (mark as resolved)
gh api graphql -f query='
  mutation {
    resolveReviewThread(input: {threadId: "<thread-id>"}) {
      thread { isResolved }
    }
  }
'

# Request re-review
gh pr edit <pr-number> --add-reviewer <username>

# Merge PR after approval
gh pr merge <pr-number> --squash --delete-branch
```

### Review Resolution Workflow

```
Changes Requested → Checkout → Fix Issues → Verify → Push → Re-request Review
        │                          │
        └── Read comments ─────────┘
```

## Arguments

- `$ARGUMENTS` - Optional: PR number, or `--mine` for your PRs

## Output

1. List PRs with pending review feedback
2. Display review comments and requested changes
3. Analyze and categorize issues to fix
4. Implement fixes addressing each comment
5. Verify all checks pass locally
6. Push fixes and notify reviewers
