# Setup New Package Workflow

This workflow guides you through creating a new package in the monorepo.

## Steps

### 1. Create Package Directory

Create a new directory under `packages/` with your package name:

```bash
mkdir packages/[package-name]
cd packages/[package-name]
```

### 2. Initialize Package

Create `package.json` with proper configuration:

```json
{
  "name": "@monorepo/[package-name]",
  "version": "0.1.0",
  "private": true,
  "main": "./dist/index.js",
  "types": "./dist/index.d.ts",
  "exports": {
    ".": {
      "types": "./dist/index.d.ts",
      "default": "./dist/index.js"
    }
  },
  "scripts": {
    "build": "tsc",
    "dev": "tsc --watch",
    "lint": "eslint src --ext .ts,.tsx",
    "lint:fix": "eslint src --ext .ts,.tsx --fix",
    "type-check": "tsc --noEmit",
    "clean": "rimraf dist"
  },
  "devDependencies": {
    "typescript": "workspace:*"
  }
}
```

### 3. Create TypeScript Configuration

Create `tsconfig.json`:

```json
{
  "extends": "../../tsconfig.base.json",
  "compilerOptions": {
    "outDir": "./dist",
    "rootDir": "./src"
  },
  "include": ["src/**/*"],
  "exclude": ["dist", "node_modules"]
}
```

### 4. Create Source Structure

```bash
mkdir src
touch src/index.ts
```

### 5. Add to Workspace

The package is automatically included due to `pnpm-workspace.yaml` configuration.

### 6. Install Dependencies

```bash
pnpm install
```

### 7. Verify Setup

```bash
# Build the package
pnpm build --filter [package-name]

# Run tests
pnpm test --filter [package-name]
```

## Template Files

### Basic index.ts

```typescript
export const packageName = '[package-name]';

export function hello(name: string): string {
  return `Hello, ${name} from ${packageName}!`;
}
```

### Basic test file (src/**tests**/index.test.ts)

```typescript
import { describe, it, expect } from 'vitest';
import { hello, packageName } from '../index';

describe('[package-name]', () => {
  it('should export package name', () => {
    expect(packageName).toBe('[package-name]');
  });

  it('should greet correctly', () => {
    expect(hello('World')).toBe('Hello, World from [package-name]!');
  });
});
```
