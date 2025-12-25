# Spawn Multi-Agent Workflow

Spawn multi-agent workflow in tmux sessions for parallel backlog implementation.

## Instructions

### Spawning Agents

Based on `$ARGUMENTS`, spawn Claude Code agents in tmux sessions:

#### `spawn {count}` - Spawn multiple agents

1. Check if tmux is available
2. Create a new tmux session named `agents-{timestamp}` if not exists
3. For each agent (1 to count):
   - Create a new tmux window named `agent-{n}`
   - Start Claude Code in that window
   - Assign a backlog item from `.scrum/backlog/` (prioritized)
4. Save session info to `.agents/sessions/{session-id}.json`

#### `spawn {item-ids}` - Spawn agents for specific items

1. Parse comma-separated item IDs
2. Create tmux windows for each item
3. Assign specific backlog items to agents
4. Track assignments in `.agents/assignments.json`

### Session Configuration

Store in `.agents/config.json`:

```json
{
  "maxConcurrentAgents": 5,
  "defaultModel": "sonnet",
  "autoCollect": true,
  "sessionPrefix": "agents",
  "workingBranch": "feature/{item-id}"
}
```

### Agent Assignment Template

Each agent receives instructions:

```markdown
You are working on backlog item: {ITEM-ID}
Branch: feature/{item-slug}

## Task

{item description}

## Acceptance Criteria

{acceptance criteria}

## Instructions

1. Create feature branch from main
2. Implement the feature
3. Write tests
4. Run quality checks (pnpm lint && pnpm type-check && pnpm test)
5. Commit with conventional commit message
6. Signal completion by creating .agents/completed/{item-id}.json
```

### Tracking File Structure

```
.agents/
  config.json           # Agent configuration
  sessions/             # Active session records
    {session-id}.json
  assignments.json      # Current item-to-agent mapping
  completed/            # Completed work markers
    {item-id}.json
  logs/                 # Agent output logs
    {session-id}/
      agent-{n}.log
```

## Arguments

- `$ARGUMENTS` - `{count}` (number of agents) or `{item-ids}` (comma-separated backlog item IDs)

## Output

Display spawned agent sessions with their assigned backlog items and tmux commands to attach.
