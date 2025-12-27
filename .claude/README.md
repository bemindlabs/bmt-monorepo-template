# Claude Code Configuration

> Claude Code official configuration directory for this monorepo.

## Directory Structure

```
.claude/
├── settings.json              # Project settings (team-shared)
├── settings.local.json        # Personal overrides (gitignored)
├── settings.local.json.example # Template for local settings
├── .mcp.json                  # MCP server configurations
├── rules.md                   # Project-specific rules
├── README.md                  # This file
│
├── agents/                    # Custom subagents
│   ├── README.md
│   ├── code-reviewer/
│   │   └── AGENT.md
│   └── test-generator/
│       └── AGENT.md
│
├── commands/                  # Custom slash commands
│   ├── README.md
│   ├── git-*.md               # Git operations
│   ├── branch-*.md            # Branch workflow
│   ├── doc-*.md               # Documentation
│   ├── deploy-*.md            # DevOps
│   ├── github-*.md            # GitHub integration
│   ├── design-*.md            # Design system
│   ├── scrum-*.md             # Scrum/Agile
│   └── zero-qa-*.md           # Quality assurance
│
├── hooks/                     # Hook scripts
│   ├── README.md
│   ├── check-sensitive-files.sh
│   ├── post-tool-use.sh
│   └── setup-git-hooks.sh
│
└── skills/                    # Custom skills
    └── ui-ux-pro-max/
        ├── SKILL.md
        ├── data/
        └── scripts/
```

## Configuration Files

### settings.json

Project-level settings shared with the team:

```json
{
  "permissions": { "allow": [...], "deny": [...] },
  "hooks": { "PreToolUse": [...], "PostToolUse": [...] },
  "env": { "NODE_ENV": "development" },
  "attribution": { "commit": "...", "pr": "..." }
}
```

### settings.local.json

Personal overrides (gitignored). Copy from `settings.local.json.example`:

```bash
cp .claude/settings.local.json.example .claude/settings.local.json
```

### .mcp.json

MCP (Model Context Protocol) server configurations:

```json
{
  "mcpServers": {
    "memory": { "type": "stdio", "command": "npx", "args": [...] },
    "github": { "type": "stdio", "command": "npx", "args": [...] }
  }
}
```

## Features

### Permissions

Control tool access:

- `allow`: Auto-approve matching operations
- `ask`: Prompt for confirmation
- `deny`: Block matching operations

### Hooks

Automate tasks on tool events:

- `PreToolUse`: Before tool execution
- `PostToolUse`: After tool success
- `SessionStart`: When session starts

### Custom Commands

70+ slash commands organized by category:

- `/git-*` - Git operations
- `/scrum-*` - Scrum/Agile management
- `/zero-qa-*` - Quality assurance
- `/design-*` - UI/UX design

Run `/README` to see all available commands.

### Custom Agents

Specialized subagents for specific tasks:

- `code-reviewer` - Code review and feedback
- `test-generator` - Generate Vitest tests

### Skills

Auto-activated capabilities:

- `ui-ux-pro-max` - Design intelligence database

## Quick Start

```bash
# View all commands
/README

# Check git status
/git-status

# Initialize scrum project
/scrum-init

# Run quality checks
/zero-qa-check
```

## References

- [Claude Code Documentation](https://docs.anthropic.com/claude-code)
- [Settings Reference](https://docs.anthropic.com/claude-code/settings)
- [Hooks Guide](https://docs.anthropic.com/claude-code/hooks)
- [MCP Protocol](https://docs.anthropic.com/claude-code/mcp)
