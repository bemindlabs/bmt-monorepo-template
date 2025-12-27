# Custom Subagents

Custom subagents for specialized tasks in the monorepo.

## Available Agents

| Agent            | Description                                            |
| ---------------- | ------------------------------------------------------ |
| `code-reviewer`  | Reviews code for quality, security, and best practices |
| `test-generator` | Generates Vitest test cases for TypeScript code        |

## Creating New Agents

1. Create a directory: `.claude/agents/<agent-name>/`
2. Add `AGENT.md` with frontmatter:

```yaml
---
name: agent-name
description: What this agent does
model: claude-sonnet-4-5-20250929 # Optional
skills: skill1, skill2 # Optional
---
# Agent Name

Instructions for the agent...
```

## Agent Frontmatter Options

| Field         | Required | Description                           |
| ------------- | -------- | ------------------------------------- |
| `name`        | Yes      | Agent identifier (lowercase, hyphens) |
| `description` | Yes      | Brief description of capabilities     |
| `model`       | No       | Specific Claude model to use          |
| `skills`      | No       | Comma-separated skills to include     |

## Usage

Agents are invoked via the Task tool:

```
Use the code-reviewer agent to review the changes in src/
```
