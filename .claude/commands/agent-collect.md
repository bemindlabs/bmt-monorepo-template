# Collect Agent Work

Collect and merge completed agent work.

## Instructions

### Collection Process

Based on `$ARGUMENTS`, collect completed work from agents:

#### `collect` (no args) - Collect all completed

1. Scan `.agents/completed/` for completion markers
2. For each completed item:
   - Validate the feature branch exists
   - Run quality checks on the branch
   - Generate PR if checks pass
3. Update backlog item status
4. Archive completion marker

#### `collect {item-id}` - Collect specific item

1. Find the agent that worked on the item
2. Checkout the feature branch
3. Run validation:
   - `pnpm lint`
   - `pnpm type-check`
   - `pnpm test`
4. If passing, prepare for merge
5. Generate summary report

#### `collect --merge` - Collect and auto-merge

1. Collect all completed work
2. Create PRs for each
3. Auto-merge if CI passes
4. Update backlog status to "Done"

### Completion Marker Format

`.agents/completed/{item-id}.json`:

```json
{
  "itemId": "ITEM-001",
  "branch": "feature/auth-login",
  "completedAt": "2024-12-25T14:30:00Z",
  "agent": "agent-1",
  "session": "agents-20241225-1200",
  "commits": ["abc123: feat(auth): implement login flow", "def456: test(auth): add login tests"],
  "checksRun": {
    "lint": "pass",
    "typeCheck": "pass",
    "tests": "pass",
    "coverage": "85%"
  }
}
```

### Collection Report

Generate `.agents/reports/{date}-collection.md`:

```markdown
# Agent Work Collection Report

Date: {YYYY-MM-DD HH:mm}
Session: {session-id}

## Collected Items

| Item | Branch | Commits | Checks | Status |
| ---- | ------ | ------- | ------ | ------ |

## Quality Summary

- Total items collected: X
- Passed all checks: Y
- Failed checks: Z

## Actions Taken

- PRs created: [list]
- Merged to main: [list]
- Requires attention: [list]
```

### Post-Collection Cleanup

1. Archive session data to `.agents/archive/`
2. Close completed tmux windows
3. Update `.scrum/backlog/` item statuses
4. Notify via terminal output

## Arguments

- `$ARGUMENTS` - Optional: `{item-id}` or `--merge`

## Output

Display collection results with quality check summaries and next steps.
