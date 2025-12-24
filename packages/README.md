# Packages Directory

This directory contains shared packages used across the monorepo.

## Available Packages

| Package                   | Description               | Documentation                |
| ------------------------- | ------------------------- | ---------------------------- |
| `@monorepo-agents/core`   | Base agent framework      | [README](./core/README.md)   |
| `@monorepo-agents/shared` | Shared types and errors   | [README](./shared/README.md) |
| `@monorepo-agents/config` | Environment configuration | [README](./config/README.md) |

## Package Structure

```
packages/
├── core/           # Core agent framework
│   ├── src/
│   │   ├── index.ts
│   │   ├── agent.ts
│   │   ├── types.ts
│   │   └── utils.ts
│   ├── package.json
│   └── tsconfig.json
├── shared/         # Shared utilities
│   ├── src/
│   │   ├── index.ts
│   │   ├── constants.ts
│   │   └── errors.ts
│   ├── package.json
│   └── tsconfig.json
└── config/         # Configuration
    ├── src/
    │   ├── index.ts
    │   └── env.ts
    ├── package.json
    └── tsconfig.json
```

## Creating a New Package

1. Create the package directory:

```bash
mkdir -p packages/my-package/src
```

2. Add `package.json`:

```json
{
  "name": "@monorepo-agents/my-package",
  "version": "0.1.0",
  "type": "module",
  "exports": {
    ".": {
      "types": "./dist/index.d.ts",
      "import": "./dist/index.js",
      "require": "./dist/index.cjs"
    }
  },
  "scripts": {
    "build": "tsup",
    "dev": "tsup --watch"
  }
}
```

3. Add `tsconfig.json`:

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

4. Add `tsup.config.ts`:

```typescript
import { defineConfig } from 'tsup';

export default defineConfig({
  entry: ['src/index.ts'],
  format: ['cjs', 'esm'],
  dts: true,
  clean: true,
  sourcemap: true,
});
```

## Building Packages

```bash
# Build all packages
pnpm build:packages

# Build specific package
pnpm --filter @monorepo-agents/core build

# Watch mode
pnpm --filter @monorepo-agents/core dev
```

## Using Packages

Reference workspace packages in other packages:

```json
{
  "dependencies": {
    "@monorepo-agents/core": "workspace:*"
  }
}
```

Then import:

```typescript
import { Agent, AgentConfig } from '@monorepo-agents/core';
import { AgentError } from '@monorepo-agents/shared';
import { loadEnv, isDev } from '@monorepo-agents/config';
```
