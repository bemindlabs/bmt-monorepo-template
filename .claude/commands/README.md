# Slash Commands

> **Last Updated**: 2025-12-24

Custom slash commands for the monorepo template.

## Naming Convention

Commands use consistent prefixes for easy discovery:

| Prefix    | Category      | Description               |
| --------- | ------------- | ------------------------- |
| `branch-` | Workflow      | Git branch operations     |
| `deploy-` | DevOps        | Deployment operations     |
| `design-` | UI/UX         | Design system and reviews |
| `doc-`    | Documentation | Documentation management  |
| `git-`    | Git           | Git operations            |

---

## Quick Reference

| Command          | Description                  |
| ---------------- | ---------------------------- |
| `/git-status`    | Show repository status       |
| `/git-commit`    | Generate conventional commit |
| `/branch-create` | Create feature branch        |
| `/branch-pr`     | Create pull request          |

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

| Command         | Usage                     | Description             |
| --------------- | ------------------------- | ----------------------- |
| `/doc-create`   | `/doc-create <path>`      | Create new doc file     |
| `/doc-index`    | `/doc-index`              | Generate docs index     |
| `/doc-clean`    | `/doc-clean`              | Clean up/merge docs     |
| `/doc-generate` | `/doc-generate [project]` | Auto-generate from code |
| `/doc-wiki`     | `/doc-wiki`               | Update GitHub wiki      |

### DevOps (`deploy-`)

| Command                    | Usage                 | Description             |
| -------------------------- | --------------------- | ----------------------- |
| `/deploy-docker`           | `/deploy-docker`      | Deploy all services     |
| `/deploy-docker <project>` | `/deploy-docker api`  | Deploy specific project |
| `/deploy-docker logs`      | `/deploy-docker logs` | View container logs     |
| `/deploy-docker stop`      | `/deploy-docker stop` | Stop all containers     |

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
│
├── # DevOps
├── deploy-docker.md
│
└── # Design System
    ├── design-search.md
    ├── design-ui-review.md
    ├── design-ux-audit.md
    ├── design-a11y-check.md
    ├── design-responsive-check.md
    ├── design-color-palette.md
    └── design-system-tokens.md
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
