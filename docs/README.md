# Documentation

Welcome to the Monorepo Template documentation.

## Documentation Index

| Section                                | Description                   |
| -------------------------------------- | ----------------------------- |
| [Architecture](architecture/README.md) | System design and diagrams    |
| [Git](git/README.md)                   | Git and branch management     |
| [Design](design/README.md)             | UI/UX and design system       |
| [QA](qa/README.md)                     | Testing and quality assurance |
| [Deploy](deploy/README.md)             | Docker deployment             |
| [Guides](guides/README.md)             | General guides and workflows  |

## Quick Reference

### Daily Commands

```bash
# Development
pnpm dev                    # Start development mode
pnpm build                  # Build all packages
pnpm test                   # Run tests

# Git workflow
/git-commit                 # Auto-commit with message
/branch-create <name>       # Create feature branch
/branch-pr                  # Create pull request
```

### Design Commands

```bash
/design-ui-review           # Review UI components
/design-a11y-check          # Accessibility check
/design-responsive-check    # Responsive design check
/design-color-palette       # Color palette tools
```

### Deployment Commands

```bash
/deploy-docker up           # Deploy to Docker
/deploy-docker status       # Check status
/deploy-docker logs         # View logs
```

## Command Categories

### Git (9 commands)

- `/git-status` - Monorepo status
- `/git-commit` - Auto-commit
- `/git-changelog` - Create changelog
- `/git-repo-init` - Initialize submodules
- `/git-submodule-add` - Add submodule
- `/git-submodule-update` - Update submodules
- `/branch-create` - Create feature branch
- `/branch-status` - Branch status
- `/branch-pr` - Create pull request

### Design (7 commands)

- `/design-search` - Search design database
- `/design-color-palette` - Color palettes
- `/design-system-tokens` - Design tokens
- `/design-a11y-check` - Accessibility
- `/design-responsive-check` - Responsive design
- `/design-ui-review` - UI review
- `/design-ux-audit` - UX audit

### Documentation (5 commands)

- `/doc-create` - Create documentation
- `/doc-generate` - Auto-generate docs
- `/doc-index` - Update doc index
- `/doc-clean` - Clean documentation
- `/doc-wiki` - Update wiki

### Deploy (1 command)

- `/deploy-docker` - Docker deployment

## Directory Structure

```
docs/
├── README.md               # This file
├── architecture/           # Architecture documentation
│   ├── README.md           # Overview and diagrams
│   ├── monorepo-structure.md
│   ├── package-dependencies.md
│   ├── ci-cd-pipeline.md
│   └── tech-stack.md
├── git/                    # Git workflow
│   └── README.md
├── design/                 # Design system
│   └── README.md
├── qa/                     # Testing
│   └── README.md
├── deploy/                 # Deployment
│   └── README.md
└── guides/                 # General guides
    └── README.md
```

## Getting Help

- [GitHub Issues](https://github.com/your-org/monorepo-template/issues)
- [Contributing Guide](../CONTRIBUTING.md)

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)** | [info@bemind.tech](mailto:info@bemind.tech)
