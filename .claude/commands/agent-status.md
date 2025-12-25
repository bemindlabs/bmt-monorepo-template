# Check Agent Status

Check status of running agent sessions.

## Instructions

### Status Check

Based on `$ARGUMENTS`, check agent session status:

#### `status` (no args) - Show all sessions

1. List all active tmux sessions matching `agents-*`
2. For each session, show:
   - Session name and age
   - Number of windows/agents
   - Assigned backlog items
   - Completion status

#### `status {session-id}` - Show specific session

1. Get detailed info for the session
2. Show each agent's:
   - Assigned item
   - Current branch
   - Last activity
   - Git status
   - Completion marker existence

#### `status --watch` - Live monitoring

1. Refresh status every 10 seconds
2. Show progress indicators
3. Alert on completions

### Status Data Sources

Check these locations for status:

```
.agents/sessions/{session-id}.json  # Session metadata
.agents/assignments.json            # Item assignments
.agents/completed/{item-id}.json    # Completion markers
```

### Git Status per Agent

For each agent, check:

```bash
# Branch info
git -C {agent-worktree} branch --show-current

# Uncommitted changes
git -C {agent-worktree} status --porcelain

# Recent commits
git -C {agent-worktree} log --oneline -3
```

### Output Format

```
AGENT SESSIONS STATUS
=====================

Session: agents-20241225-1430
Created: 2 hours ago
Agents: 3/3 active

| Agent | Item      | Branch              | Status      | Progress |
|-------|-----------|---------------------|-------------|----------|
| 1     | ITEM-001  | feature/auth-login  | In Progress | 60%      |
| 2     | ITEM-002  | feature/user-profile| Completed   | 100%     |
| 3     | ITEM-003  | feature/dashboard   | In Progress | 30%      |

Commands:
  tmux attach -t agents-20241225-1430        # Attach to session
  tmux select-window -t agents-20241225-1430:1  # Switch to agent 1
```

## Arguments

- `$ARGUMENTS` - Optional: `{session-id}` or `--watch`

## Output

Display formatted status table of all running agent sessions.
