# Codex Integration

This folder contains Codex CLI configuration and playbooks tailored for the dev-agents-workflow monorepo.

- `settings/config.json` — high-level project metadata, recommended commands, and quality gates.
- `settings/mcp.json` — MCP server definitions (filesystem + git) to power Codex tooling.
- `rules.md` — guardrails Codex should follow when modifying this repository.
- `workflows/` — repeatable procedures for common tasks (bootstrap, quality gate, release).

Update these references whenever the repository structure, commands, or tooling changes.
