# Manage Agent Configurations

Manage agent configurations for multi-agent workflows.

## Instructions

### Agent Management

Based on `$ARGUMENTS`, manage agent configurations:

#### `init` - Initialize agent system

1. Create `.agents/` directory structure:
   ```
   .agents/
     config.json
     sessions/
     assignments.json
     completed/
     logs/
     reports/
     archive/
   ```
2. Set default configuration
3. Add `.agents/logs/` and `.agents/archive/` to `.gitignore`

#### `config` - Show current configuration

1. Display `.agents/config.json` contents
2. Show effective settings with defaults

#### `config set {key} {value}` - Update configuration

1. Update the specified key in config
2. Validate the value
3. Save changes

#### `list` - List available agent profiles

1. Show predefined agent profiles
2. Display custom profiles from `.agents/profiles/`

#### `clean` - Clean up agent artifacts

1. Remove old session data (> 7 days)
2. Archive completed markers
3. Clean log files
4. Report freed space

#### `reset` - Reset agent system

1. Archive current state
2. Clear all sessions and assignments
3. Keep configuration

### Configuration Options

`.agents/config.json`:

```json
{
  "maxConcurrentAgents": 5,
  "defaultModel": "sonnet",
  "autoCollect": true,
  "sessionPrefix": "agents",
  "branchPattern": "feature/{item-slug}",
  "qualityGates": {
    "lint": true,
    "typeCheck": true,
    "tests": true,
    "minCoverage": 80
  },
  "tmux": {
    "sessionName": "agents-{timestamp}",
    "windowName": "agent-{n}"
  },
  "notifications": {
    "onComplete": true,
    "onError": true
  }
}
```

### Agent Profiles

Profiles define agent behavior in `.agents/profiles/`:

```json
{
  "name": "feature-developer",
  "description": "Implements new features from backlog",
  "model": "sonnet",
  "instructions": "Focus on clean implementation with tests",
  "qualityGates": ["lint", "typeCheck", "tests"]
}
```

### Available Profiles

| Profile             | Description                 | Use Case     |
| ------------------- | --------------------------- | ------------ |
| `feature-developer` | Full feature implementation | New features |
| `bug-fixer`         | Focused bug resolution      | Bug fixes    |
| `refactorer`        | Code improvement            | Tech debt    |
| `reviewer`          | Code review assistance      | PR reviews   |

## Arguments

- `$ARGUMENTS` - Action: `init`, `config`, `config set {key} {value}`, `list`, `clean`, `reset`

## Output

Execute the management action and display results.
