# Development

Development workflow and best practices.

## Development Workflow

### Daily Development

```bash
# Start development servers
pnpm dev

# Run in specific package
pnpm --filter @monorepo/web dev
```

### Using Makefile

The project includes a comprehensive Makefile with 70+ commands:

```bash
# Show all available commands
make help

# Common development commands
make dev           # Start development servers
make build         # Build all packages
make test          # Run tests
make check         # Run all quality checks
make fix           # Auto-fix linting issues

# Docker commands
make docker-up     # Start Docker containers
make docker-down   # Stop containers
make docker-logs   # View logs

# Kubernetes commands
make k8s-deploy-dev   # Deploy to development
make k8s-status       # Show cluster status

# Cleanup
make clean         # Clean build artifacts
make reset         # Full reset (clean + install + build)
```

### Before Committing

```bash
# Run all checks
pnpm type-check
pnpm lint
pnpm test

# Or use Makefile
make check         # Runs lint + type-check + format-check
make test          # Run tests
```

## Git Workflow

### Branch Naming

| Type    | Pattern             | Example                 |
| ------- | ------------------- | ----------------------- |
| Feature | `feature/<name>`    | `feature/user-auth`     |
| Bug Fix | `fix/<name>`        | `fix/login-error`       |
| Hotfix  | `hotfix/<name>`     | `hotfix/security-patch` |
| Release | `release/<version>` | `release/1.0.0`         |

### Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Types:**

| Type       | Description      |
| ---------- | ---------------- |
| `feat`     | New feature      |
| `fix`      | Bug fix          |
| `docs`     | Documentation    |
| `style`    | Formatting       |
| `refactor` | Code refactoring |
| `test`     | Adding tests     |
| `chore`    | Maintenance      |

**Examples:**

```bash
feat(web): add user authentication
fix(core): resolve memory leak in agent pool
docs(readme): update installation steps
```

## Adding New Packages

### Create Package Structure

```bash
mkdir -p packages/my-package/src
cd packages/my-package
```

### Package Configuration

**`package.json`:**

```json
{
  "name": "@monorepo/my-package",
  "version": "0.0.0",
  "private": true,
  "type": "module",
  "main": "./dist/index.js",
  "types": "./dist/index.d.ts",
  "exports": {
    ".": {
      "types": "./dist/index.d.ts",
      "import": "./dist/index.js"
    }
  },
  "scripts": {
    "build": "tsup",
    "dev": "tsup --watch",
    "type-check": "tsc --noEmit"
  },
  "dependencies": {
    "@monorepo/shared": "workspace:*"
  }
}
```

**`tsconfig.json`:**

```json
{
  "extends": "../../tsconfig.base.json",
  "compilerOptions": {
    "outDir": "./dist",
    "rootDir": "./src"
  },
  "include": ["src/**/*"]
}
```

**`tsup.config.ts`:**

```typescript
import { defineConfig } from 'tsup';

export default defineConfig({
  entry: ['src/index.ts'],
  format: ['esm'],
  dts: true,
  clean: true,
});
```

## Adding New Apps

### Create App Structure

```bash
mkdir -p apps/my-app/src
cd apps/my-app
```

### For Vite Apps

```bash
pnpm create vite my-app --template react-ts
```

Update `package.json` name to `@monorepo/my-app`.

## Testing

### Running Tests

```bash
# All tests
pnpm test

# Specific package
pnpm --filter @monorepo/core test

# Watch mode
pnpm test -- --watch

# Coverage
pnpm test -- --coverage
```

### Writing Tests

```typescript
import { describe, it, expect } from 'vitest';
import { myFunction } from './my-function';

describe('myFunction', () => {
  it('should return expected value', () => {
    expect(myFunction('input')).toBe('expected');
  });
});
```

## Code Quality

### Linting

```bash
# Check all files
pnpm lint

# Fix auto-fixable issues
pnpm lint -- --fix
```

### Formatting

```bash
# Check formatting
pnpm format:check

# Fix formatting
pnpm format
```

### Type Checking

```bash
# Check all packages
pnpm type-check

# Specific package
pnpm --filter @monorepo/core type-check
```

## Debugging

### VS Code Launch Configurations

Add to `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "launch",
      "name": "Debug Current Test",
      "program": "${workspaceFolder}/node_modules/vitest/vitest.mjs",
      "args": ["run", "${relativeFile}"],
      "console": "integratedTerminal"
    }
  ]
}
```

### Debug Logging

```typescript
import { logger } from '@monorepo/core';

logger.debug('Debug message', { data: someData });
logger.info('Info message');
logger.error('Error message', error);
```

## Performance

### Build Caching

Turborepo caches builds automatically. To clear cache:

```bash
# Clear Turborepo cache
pnpm turbo clean

# Clear all caches
pnpm clean
```

### Dependency Analysis

```bash
# Check for duplicate dependencies
pnpm dedupe

# Analyze bundle size
pnpm --filter @monorepo/web build -- --analyze
```

## Common Tasks

### Update Dependencies

```bash
# Update all dependencies
pnpm update

# Update specific package
pnpm update typescript --recursive

# Interactive update
pnpm update --interactive
```

### Clean Build

```bash
# Clean all build artifacts
pnpm clean

# Reinstall everything
rm -rf node_modules pnpm-lock.yaml
pnpm install
```

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)**
