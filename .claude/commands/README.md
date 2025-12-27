# Slash Commands

> **Last Updated**: 2025-12-24

Custom slash commands for the monorepo template.

## Naming Convention

Commands use consistent prefixes for easy discovery:

| Prefix     | Category      | Description                 |
| ---------- | ------------- | --------------------------- |
| `branch-`  | Workflow      | Git branch operations       |
| `deploy-`  | DevOps        | Deployment operations       |
| `design-`  | UI/UX         | Design system and reviews   |
| `doc-`     | Documentation | Documentation management    |
| `env-`     | Environment   | Environment file management |
| `git-`     | Git           | Git operations              |
| `github-`  | GitHub        | GitHub issues & actions     |
| `scrum-`   | Agile         | Scrum/agile management      |
| `zero-qa-` | Quality       | Zero-QA quality practices   |

---

## Quick Reference

| Command           | Description                  |
| ----------------- | ---------------------------- |
| `/git-status`     | Show repository status       |
| `/git-commit`     | Generate conventional commit |
| `/branch-create`  | Create feature branch        |
| `/branch-pr`      | Create pull request          |
| `/scrum-init`     | Initialize scrum structure   |
| `/scrum-sprint`   | Manage sprint planning       |
| `/scrum-backlog`  | Manage product backlog       |
| `/scrum-standup`  | Record daily standup         |
| `/scrum-velocity` | Track team velocity          |
| `/scrum-metrics`  | View metrics dashboard       |

---

## Commands by Category

### Git Operations (`git-`)

| Command                 | Usage                      | Description                          |
| ----------------------- | -------------------------- | ------------------------------------ |
| `/git-status`           | `/git-status`              | Show repository status               |
| `/git-commit`           | `/git-commit`              | Generate conventional commit message |
| `/git-changelog`        | `/git-changelog [version]` | Create changelog entry               |
| `/git-repo-init`        | `/git-repo-init`           | Initialize after clone               |
| `/git-submodule-add`    | `/git-submodule-add <url>` | Add git submodule                    |
| `/git-submodule-update` | `/git-submodule-update`    | Update all submodules                |
| `/git-push`             | `/git-push [action]`       | Push/fetch all branches              |

### Branch Workflow (`branch-`)

| Command          | Usage                   | Description                  |
| ---------------- | ----------------------- | ---------------------------- |
| `/branch-create` | `/branch-create <name>` | Create new feature branch    |
| `/branch-pr`     | `/branch-pr`            | Create PR for current branch |
| `/branch-status` | `/branch-status`        | Show all feature branches    |

**Branch Naming Convention:**

```
feature/<description>
fix/<description>
docs/<description>
refactor/<description>
```

### Documentation (`doc-`)

| Command          | Usage                     | Description             |
| ---------------- | ------------------------- | ----------------------- |
| `/doc-create`    | `/doc-create <path>`      | Create new doc file     |
| `/doc-index`     | `/doc-index`              | Generate docs index     |
| `/doc-clean`     | `/doc-clean`              | Clean up/merge docs     |
| `/doc-generate`  | `/doc-generate [project]` | Auto-generate from code |
| `/doc-wiki`      | `/doc-wiki`               | Update GitHub wiki      |
| `/doc-wiki-sync` | `/doc-wiki-sync`          | Update and sync wiki    |

### DevOps (`deploy-`)

| Command                    | Usage                 | Description             |
| -------------------------- | --------------------- | ----------------------- |
| `/deploy-docker`           | `/deploy-docker`      | Deploy all services     |
| `/deploy-docker <project>` | `/deploy-docker api`  | Deploy specific project |
| `/deploy-docker logs`      | `/deploy-docker logs` | View container logs     |
| `/deploy-docker stop`      | `/deploy-docker stop` | Stop all containers     |

### Environment (`env-`)

| Command         | Usage                         | Description                         |
| --------------- | ----------------------------- | ----------------------------------- |
| `/env-generate` | `/env-generate [environment]` | Generate env file from template     |
| `/env-check`    | `/env-check [file]`           | Validate env against template       |
| `/env-fix`      | `/env-fix [file]`             | Fix env file issues automatically   |
| `/env-clean`    | `/env-clean [action]`         | Clean sensitive data or unused vars |
| `/env-sync`     | `/env-sync [source] [target]` | Sync variables across env files     |
| `/env-diff`     | `/env-diff <file1> <file2>`   | Compare two environment files       |

**Environment Actions:** `generate`, `check`, `fix`, `clean`, `sync`, `diff`

**Clean Actions:** `secrets`, `unused`, `duplicates`, `all`

### GitHub (`github-`)

| Command               | Usage                          | Description                  |
| --------------------- | ------------------------------ | ---------------------------- |
| `/github-fix-actions` | `/github-fix-actions [run-id]` | Diagnose and fix CI failures |
| `/github-fix-issues`  | `/github-fix-issues [number]`  | List and fix GitHub issues   |

### Design System (`design-`)

| Command                    | Usage                           | Description                    |
| -------------------------- | ------------------------------- | ------------------------------ |
| `/design-search`           | `/design-search`                | Search UI/UX design database   |
| `/design-ui-review`        | `/design-ui-review <component>` | Review UI components           |
| `/design-ux-audit`         | `/design-ux-audit <flow>`       | Conduct UX audit               |
| `/design-a11y-check`       | `/design-a11y-check <page>`     | Check accessibility (WCAG 2.1) |
| `/design-responsive-check` | `/design-responsive-check`      | Check responsive design        |
| `/design-color-palette`    | `/design-color-palette`         | Generate color palettes        |
| `/design-system-tokens`    | `/design-system-tokens`         | Manage design system tokens    |

### Scrum/Agile (`scrum-`)

#### Core Ceremonies

| Command             | Usage                        | Description                        |
| ------------------- | ---------------------------- | ---------------------------------- |
| `/scrum-init`       | `/scrum-init`                | Initialize scrum project structure |
| `/scrum-sprint`     | `/scrum-sprint <action>`     | Manage sprint planning/tracking    |
| `/scrum-standup`    | `/scrum-standup [notes]`     | Record daily standup notes         |
| `/scrum-review`     | `/scrum-review`              | Conduct sprint review              |
| `/scrum-retro`      | `/scrum-retro`               | Conduct sprint retrospective       |
| `/scrum-refinement` | `/scrum-refinement <action>` | Conduct backlog refinement         |

#### Artifacts & Tracking

| Command             | Usage                        | Description                     |
| ------------------- | ---------------------------- | ------------------------------- |
| `/scrum-backlog`    | `/scrum-backlog <action>`    | Manage product backlog          |
| `/scrum-goal`       | `/scrum-goal <action>`       | Manage sprint goals             |
| `/scrum-burndown`   | `/scrum-burndown <action>`   | Generate burndown/burnup charts |
| `/scrum-dod`        | `/scrum-dod <action>`        | Definition of Done management   |
| `/scrum-impediment` | `/scrum-impediment <action>` | Track blockers/impediments      |

#### Metrics & Team

| Command           | Usage                      | Description               |
| ----------------- | -------------------------- | ------------------------- |
| `/scrum-velocity` | `/scrum-velocity <action>` | Track team velocity       |
| `/scrum-capacity` | `/scrum-capacity <action>` | Plan team capacity        |
| `/scrum-team`     | `/scrum-team <action>`     | Manage team roles/members |
| `/scrum-metrics`  | `/scrum-metrics <action>`  | Scrum metrics dashboard   |

**Backlog Actions:** `list`, `add <title>`, `prioritize`, `groom <id>`, `remove <id>`

**Sprint Actions:** `start`, `status`, `end`, `add <item-id>`

**Refinement Actions:** `start`, `estimate`, `split <id>`, `criteria <id>`

**Velocity Actions:** `show`, `history`, `forecast`

**Capacity Actions:** `plan`, `show`, `update`

**Goal Actions:** `show`, `set <goal>`, `evaluate`

**DoD Actions:** `show`, `check <id>`, `update`

**Impediment Actions:** `list`, `add <title>`, `resolve <id>`, `escalate <id>`

**Team Actions:** `show`, `add <name>`, `remove <name>`, `roles`

**Metrics Actions:** `show`, `velocity`, `quality`, `health`

### Zero-QA Quality (`zero-qa-`)

| Command           | Usage                    | Description                      |
| ----------------- | ------------------------ | -------------------------------- |
| `/zero-qa-init`   | `/zero-qa-init`          | Initialize Zero-QA configuration |
| `/zero-qa-check`  | `/zero-qa-check [scope]` | Run comprehensive quality checks |
| `/zero-qa-review` | `/zero-qa-review [path]` | Automated code review            |
| `/zero-qa-test`   | `/zero-qa-test <action>` | Manage and execute tests         |
| `/zero-qa-gate`   | `/zero-qa-gate [stage]`  | Quality gate validation          |
| `/zero-qa-dod`    | `/zero-qa-dod [item-id]` | Definition of Done validation    |

**Check Scopes:** `all`, `quick`, `tests`, `security`

**Test Actions:** `run`, `coverage`, `gaps`, `generate`, `validate`

**Gate Stages:** `commit`, `pr`, `merge`, `deploy`

---

## Common Workflows

### New Feature Implementation

```bash
# 1. Create feature branch
/branch-create my-feature

# 2. Implement the feature
# ... write code ...

# 3. Run checks
pnpm lint && pnpm test

# 4. Create PR
/branch-pr
```

### Sprint Workflow

```bash
# 1. Initialize scrum (first time only)
/scrum-init

# 2. Set up team
/scrum-team add "Developer Name"

# 3. Add items to backlog
/scrum-backlog add "User authentication feature"

# 4. Refine backlog (mid-sprint before)
/scrum-refinement start
/scrum-refinement estimate

# 5. Plan capacity for sprint
/scrum-capacity plan

# 6. Start a new sprint with goal
/scrum-sprint start
/scrum-goal set "Complete user authentication"

# 7. Daily standups
/scrum-standup

# 8. Track progress
/scrum-burndown show
/scrum-impediment list

# 9. Mid-sprint check
/scrum-velocity show
/scrum-metrics show

# 10. End of sprint
/scrum-goal evaluate
/scrum-review
/scrum-retro
/scrum-sprint end
```

### Zero-QA Workflow

```bash
# 1. Initialize Zero-QA (first time only)
/zero-qa-init

# 2. Before starting work
/zero-qa-check quick

# 3. During development - run tests
/zero-qa-test run

# 4. Before committing - code review
/zero-qa-review
/zero-qa-gate commit

# 5. Before creating PR
/zero-qa-gate pr
/zero-qa-dod

# 6. Before merge
/zero-qa-gate merge
```

---

## Command Files

```
.claude/commands/
├── README.md
│
├── # Git Operations
├── git-status.md
├── git-commit.md
├── git-changelog.md
├── git-repo-init.md
├── git-submodule-add.md
├── git-submodule-update.md
├── git-push.md
│
├── # Branch Workflow
├── branch-create.md
├── branch-pr.md
├── branch-status.md
│
├── # Documentation
├── doc-create.md
├── doc-index.md
├── doc-clean.md
├── doc-generate.md
├── doc-wiki.md
├── doc-wiki-sync.md
│
├── # DevOps
├── deploy-docker.md
│
├── # Environment
├── env-generate.md
├── env-check.md
├── env-fix.md
├── env-clean.md
├── env-sync.md
├── env-diff.md
│
├── # GitHub
├── github-fix-actions.md
├── github-fix-issues.md
│
├── # Design System
├── design-search.md
├── design-ui-review.md
├── design-ux-audit.md
├── design-a11y-check.md
├── design-responsive-check.md
├── design-color-palette.md
├── design-system-tokens.md
│
├── # Scrum/Agile - Ceremonies
├── scrum-init.md
├── scrum-sprint.md
├── scrum-standup.md
├── scrum-review.md
├── scrum-retro.md
├── scrum-refinement.md
│
├── # Scrum/Agile - Artifacts
├── scrum-backlog.md
├── scrum-goal.md
├── scrum-burndown.md
├── scrum-dod.md
├── scrum-impediment.md
│
├── # Scrum/Agile - Metrics & Team
├── scrum-velocity.md
├── scrum-capacity.md
├── scrum-team.md
├── scrum-metrics.md
│
└── # Zero-QA
    ├── zero-qa-init.md
    ├── zero-qa-check.md
    ├── zero-qa-review.md
    ├── zero-qa-test.md
    ├── zero-qa-gate.md
    └── zero-qa-dod.md
```

---

## Adding New Commands

1. Create `<prefix>-<name>.md` in `.claude/commands/`
2. Follow the prefix naming convention
3. Update this README with usage documentation

**Prefix Guidelines:**

- Use existing prefix if command fits a category
- Prefix should be 3-7 characters
- Use kebab-case for multi-word names

---

## Official Command Format (Claude Code)

Commands support optional YAML frontmatter for configuration:

```markdown
---
allowed-tools: Bash(git:*), Read, Edit
description: Brief description of the command
argument-hint: [arg1] [arg2]
model: claude-sonnet-4-5-20250929
---

# Command Title

Command instructions here...

Use $1, $2 for positional args or $ARGUMENTS for all args.
```

### Frontmatter Options

| Field                      | Description               | Default               |
| -------------------------- | ------------------------- | --------------------- |
| `allowed-tools`            | Tools the command can use | Inherits from session |
| `description`              | Brief description         | First line of content |
| `argument-hint`            | Expected arguments        | None                  |
| `model`                    | Specific Claude model     | Inherits from session |
| `disable-model-invocation` | Prevent SlashCommand tool | `false`               |

### Example with Frontmatter

```markdown
---
allowed-tools: Bash(git:*), Read
description: Show repository status with branch info
argument-hint: [--verbose]
---

# Git Status

Show the current status of the repository.

## Process

1. Run `git status`
2. Show current branch
3. List modified files
```

---

## Command Namespacing

Commands can be organized in subdirectories:

```
.claude/commands/
├── git-status.md          # /git-status (project level)
├── scrum/
│   ├── sprint.md          # /sprint (project:scrum)
│   └── backlog.md         # /backlog (project:scrum)
```
