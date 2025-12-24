---
inclusion: always
---

# Project Standards and Guidelines

## Project Overview

This is a TypeScript monorepo template using Turborepo, pnpm workspaces, and modern development tools.

## Architecture

- **Monorepo Structure**: Uses Turborepo for build orchestration and pnpm workspaces
- **Package Manager**: pnpm (required, enforced by preinstall script)
- **Node Version**: >=22.0.0
- **TypeScript**: Strict configuration with multiple tsconfig files for different contexts

## Development Standards

### Code Quality

- **Linting**: ESLint with TypeScript support
- **Formatting**: Prettier with organize imports and Tailwind CSS plugins
- **Type Checking**: Strict TypeScript configuration
- **Testing**: Vitest for unit, integration, and e2e tests

### Git Workflow

- **Commit Messages**: Conventional commits enforced by commitlint
- **Pre-commit Hooks**: Husky with lint-staged for automated checks
- **Changesets**: Used for version management and releases

### Build Pipeline

- **Build Tool**: Turborepo with dependency-aware task execution
- **Caching**: Turbo cache enabled for build, lint, and test tasks
- **Outputs**: Configured for dist, .next, and coverage directories

## File Structure

```
├── apps/           # Applications
├── packages/       # Shared packages
├── tools/          # Development tools
├── tests/          # Test suites (unit, integration, e2e)
├── infra/          # Infrastructure and deployment configs
├── docs/           # Documentation
└── scripts/        # Build and deployment scripts
```

## Commands

- `pnpm dev` - Start development servers
- `pnpm build` - Build all packages and apps
- `pnpm test` - Run all tests
- `pnpm lint` - Lint all code
- `pnpm format` - Format all code
- `pnpm type-check` - Type check all TypeScript

## Best Practices

1. Always use pnpm for package management
2. Follow conventional commit format
3. Write tests for new features
4. Use TypeScript strict mode
5. Format code before committing
6. Update documentation when adding features
