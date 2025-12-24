# Monorepo Template Wiki

Welcome to the **Monorepo Template** wiki! This documentation provides comprehensive guides for setting up, developing, and deploying applications using this template.

## Quick Navigation

| Section                            | Description                             |
| ---------------------------------- | --------------------------------------- |
| [Getting Started](Getting-Started) | Quick start guide for new users         |
| [Installation](Installation)       | Detailed installation instructions      |
| [Configuration](Configuration)     | Environment and settings configuration  |
| [Architecture](Architecture)       | System architecture overview            |
| [Development](Development)         | Development workflow and practices      |
| [Packages](Packages)               | Package documentation                   |
| [Deployment](Deployment)           | Deployment guides for various platforms |
| [Troubleshooting](Troubleshooting) | Common issues and solutions             |
| [FAQ](FAQ)                         | Frequently asked questions              |

## Overview

This monorepo template provides a production-ready foundation for building TypeScript applications with:

- **Turborepo** - High-performance build system
- **pnpm** - Fast, disk-efficient package manager
- **TypeScript 5.9+** - Strict type safety
- **React 19** - Latest React with Vite 6
- **Multi-provider AI support** - Claude, OpenAI, Gemini, Ollama

## Tech Stack

```
Core:        Node.js 22+ | TypeScript 5.9+ | pnpm 9+
Build:       Turborepo | Vite 6 | tsup
Frontend:    React 19 | Vite
Testing:     Vitest | React Testing Library
Infra:       Docker | Kubernetes | Firebase
CI/CD:       GitHub Actions | Changesets
```

## Project Structure

```
monorepo/
├── apps/           # Applications
│   └── web/        # Vite + React 19 app
├── packages/       # Shared packages
│   ├── shared/     # Types & utilities
│   ├── config/     # Configuration
│   └── core/       # Core framework
├── agents/         # AI agents
├── tools/          # CLI utilities
├── infra/          # Infrastructure
│   ├── docker/     # Docker configs
│   ├── k8s/        # Kubernetes manifests
│   └── firebase/   # Firebase configs
└── docs/           # Documentation
```

## Getting Help

- **Issues**: [GitHub Issues](https://github.com/anthropics/claude-code/issues)
- **Discussions**: [GitHub Discussions](https://github.com/anthropics/claude-code/discussions)
- **Email**: [info@bemind.tech](mailto:info@bemind.tech)

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)**
