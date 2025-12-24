---
inclusion: manual
contextKey: workflow
---

# Development Workflow Guide

## Getting Started

1. **Install Dependencies**: `pnpm install`
2. **Environment Setup**: Copy `.env.example` to `.env` and configure
3. **Development**: `pnpm dev` to start all development servers
4. **Testing**: `pnpm test` to run the test suite

## Monorepo Workflow

### Adding New Packages

```bash
# Create new package in packages/
mkdir packages/new-package
cd packages/new-package
pnpm init
```

### Adding New Apps

```bash
# Create new app in apps/
mkdir apps/new-app
cd apps/new-app
pnpm init
```

### Working with Dependencies

```bash
# Add dependency to specific workspace
pnpm add <package> --filter <workspace-name>

# Add dev dependency to root
pnpm add -D <package> -w

# Install dependencies for all workspaces
pnpm install
```

## Build and Test Workflow

### Local Development

- `pnpm dev` - Start all development servers with hot reload
- `pnpm build:packages` - Build only packages (faster for package development)
- `pnpm test:watch` - Run tests in watch mode

### Pre-commit Checks

The following run automatically via Husky hooks:

1. Lint staged files
2. Format code
3. Type check
4. Run affected tests

### Release Workflow

1. `pnpm changeset` - Create changeset for changes
2. `pnpm version-packages` - Update versions based on changesets
3. `pnpm release` - Build and publish packages

## Turborepo Commands

### Filtering

```bash
# Run command for specific package
turbo build --filter=package-name

# Run command for packages matching pattern
turbo build --filter='./packages/*'

# Run command for apps only
turbo build --filter='./apps/*'
```

### Caching

- Turbo automatically caches build outputs
- Use `turbo build --force` to bypass cache
- Clear cache with `turbo clean`

## Docker Development

```bash
# Start infrastructure services
pnpm docker:up

# Stop services
pnpm docker:down
```
