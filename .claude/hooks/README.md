# Claude Code Hooks

> **Last Updated**: 2025-12-23

Automated code quality, security, and AI-powered hooks for Monorepo Agents Workflow.

## Directory Structure

```
.claude/hooks/
├── README.md                        # This file
│
├── # Core Hooks (Configured in settings.json)
├── check-sensitive-files.sh         # PreToolUse: Block sensitive files
├── pre-tool-use.sh                  # PreToolUse: Pre-validation
├── post-tool-use.sh                 # PostToolUse: Route to validators
├── pre-commit-checkpoint.sh         # UserPromptSubmit: Commit validation
├── pre-commit.sh                    # Git pre-commit hook
├── zero-qa-hook.sh                  # PostToolUse: Suggest test generation
│
├── # Code Quality Validators
├── check-doc-naming.sh              # Documentation naming convention
├── lockfile-sync-validator.sh       # pnpm lockfile sync validation
├── test-coverage-monitor.sh         # Test coverage threshold check
├── documentation-link-validator.sh  # Validate doc links
│
├── # Security Validators
├── multi-tenant-security-guard.sh   # Multi-tenancy isolation check
├── rbac-permission-validator.sh     # RBAC permission validation
│
├── # API & i18n Validators
├── openapi-sync-checker.sh          # OpenAPI spec sync check
├── i18n-completeness-checker.sh     # Translation completeness
│
├── # Utilities
├── setup-git-hooks.sh               # Git hooks setup
└── update-wiki-docs.sh              # GitHub Wiki sync
```

---

## Hook Configuration

Defined in `.claude/settings.json`:

| Event            | Hook                     | Purpose              |
| ---------------- | ------------------------ | -------------------- |
| PreToolUse       | check-sensitive-files.sh | Block secrets/env    |
| PreToolUse       | pre-tool-use.sh          | Pre-validation       |
| PostToolUse      | post-tool-use.sh         | Code quality routing |
| PostToolUse      | zero-qa-hook.sh          | AI test suggestions  |
| UserPromptSubmit | pre-commit-checkpoint.sh | Commit validation    |

---

## Hook Events

### PreToolUse

Runs **before** a tool is executed. Can block operations.

```bash
# Example: Block access to .env files
./.claude/hooks/check-sensitive-files.sh /path/to/.env
# Exit 2 = blocked, Exit 0 = allowed
```

### PostToolUse

Runs **after** a tool completes. For validation and suggestions.

```bash
# Example: Suggest tests after code changes
./.claude/hooks/zero-qa-hook.sh /path/to/file.ts
# Exit 1 = show warning, Exit 0 = success
```

### UserPromptSubmit

Runs when user submits a prompt. For context injection.

```bash
# Example: Check for uncommitted changes before commit
./.claude/hooks/pre-commit-checkpoint.sh
```

---

## Exit Codes

| Code | Meaning | Behavior               |
| ---- | ------- | ---------------------- |
| 0    | Success | Continue operation     |
| 1    | Warning | Show message, continue |
| 2    | Block   | Prevent operation      |

---

## Validators

### Security

| Validator                        | Purpose                          |
| -------------------------------- | -------------------------------- |
| `check-sensitive-files.sh`       | Block .env, credentials, secrets |
| `multi-tenant-security-guard.sh` | Ensure tenant isolation          |
| `rbac-permission-validator.sh`   | Validate RBAC decorators         |

### Code Quality

| Validator                    | Purpose                          |
| ---------------------------- | -------------------------------- |
| `check-doc-naming.sh`        | UPPERCASE_UNDERSCORE for docs    |
| `lockfile-sync-validator.sh` | pnpm-lock.yaml sync              |
| `test-coverage-monitor.sh`   | Coverage ≥ 50% (Q1) / ≥ 70% (Q2) |

### API & i18n

| Validator                         | Purpose                   |
| --------------------------------- | ------------------------- |
| `openapi-sync-checker.sh`         | OpenAPI spec matches code |
| `i18n-completeness-checker.sh`    | Translation completeness  |
| `documentation-link-validator.sh` | Valid doc links           |

---

## AI-Powered Hooks

### Zero-QA Hook

Suggests test generation after code changes.

```bash
# Triggered after file edits
./.claude/hooks/zero-qa-hook.sh /path/to/new-feature.ts

# Output: Suggests running /zero-qa-generate
```

Supports multiple AI providers:

- **Gemini** (FREE) - Fast suggestions
- **Claude** - Complex test design
- **OpenAI** - Balanced approach
- **Ollama** - Offline/private

---

## Quick Test

```bash
# Test sensitive file blocking
./.claude/hooks/check-sensitive-files.sh .env
echo $?  # Should be 2 (blocked)

# Test safe file
./.claude/hooks/check-sensitive-files.sh src/app.ts
echo $?  # Should be 0 (allowed)

# Test doc naming
./.claude/hooks/check-doc-naming.sh docs/
echo $?  # 0=valid, 1=warnings
```

---

## Setup

### Git Hooks

```bash
# Install git hooks (pre-commit, etc.)
./.claude/hooks/setup-git-hooks.sh

# Or manually
ln -sf ../../.claude/hooks/pre-commit.sh .git/hooks/pre-commit
```

### Claude Code Integration

Hooks are auto-loaded from `.claude/settings.json`.

---

## Bypass (if needed)

```bash
# Skip validation for single commit
SKIP_VALIDATION=1 git commit -m "message"

# Skip hooks temporarily
git commit --no-verify -m "message"
```

---

## Q2 2026 Updates

| Hook                           | Q2 Target        |
| ------------------------------ | ---------------- |
| `test-coverage-monitor.sh`     | Coverage ≥ 70%   |
| `zero-qa-hook.sh`              | Mobile app tests |
| `i18n-completeness-checker.sh` | 95% coverage     |

---

## Related

- [Commands README](../commands/README.md) - Slash commands
- [SCRUM AI Agent](../agents/scrum-agent.md) - Sprint automation
- [Zero-QA Orchestrator](../agents/zero-qa-orchestrator.md) - Test generation
- [Claude Settings](../settings.json) - Hook configuration
- [GitHub Workflow](../../.github/workflows/scrum-agent.yml) - Automated SCRUM via GitHub Actions

---

**AI-Powered Development Hooks**
