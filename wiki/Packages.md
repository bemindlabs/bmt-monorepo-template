# Packages

Documentation for shared packages in the monorepo.

## Package Overview

| Package            | Description               | Location          |
| ------------------ | ------------------------- | ----------------- |
| `@monorepo/shared` | Types, errors, constants  | `packages/shared` |
| `@monorepo/config` | Environment configuration | `packages/config` |
| `@monorepo/core`   | Core framework utilities  | `packages/core`   |

## @monorepo/shared

Foundation package providing shared types and utilities.

### Installation

```typescript
import { ApiResponse, AppError, HTTP_STATUS } from '@monorepo/shared';
```

### Types

```typescript
// API Response type
interface ApiResponse<T = unknown> {
  success: boolean;
  data?: T;
  error?: string;
  metadata?: {
    timestamp: string;
    requestId: string;
  };
}

// Agent types
interface AgentConfig {
  name: string;
  description: string;
  model: string;
  temperature?: number;
  maxTokens?: number;
}

interface AgentResponse<T = unknown> {
  success: boolean;
  data?: T;
  error?: string;
  usage?: {
    inputTokens: number;
    outputTokens: number;
  };
}
```

### Error Classes

```typescript
import { AppError, ValidationError, NotFoundError } from '@monorepo/shared';

// Base error
throw new AppError('Something went wrong', 500, 'INTERNAL_ERROR');

// Validation error
throw new ValidationError('Invalid email format');

// Not found error
throw new NotFoundError('User not found');
```

### Constants

```typescript
import { HTTP_STATUS, ERROR_CODES } from '@monorepo/shared';

HTTP_STATUS.OK; // 200
HTTP_STATUS.BAD_REQUEST; // 400
HTTP_STATUS.NOT_FOUND; // 404

ERROR_CODES.VALIDATION_ERROR; // 'VALIDATION_ERROR'
ERROR_CODES.NOT_FOUND; // 'NOT_FOUND'
```

## @monorepo/config

Environment configuration with Zod validation.

### Installation

```typescript
import { getConfig, validateEnv } from '@monorepo/config';
```

### Usage

```typescript
// Get validated configuration
const config = getConfig();

console.log(config.port); // 3000
console.log(config.nodeEnv); // 'development'
console.log(config.logLevel); // 'info'
```

### Environment Schema

```typescript
import { z } from 'zod';

const envSchema = z.object({
  NODE_ENV: z.enum(['development', 'production', 'test']),
  PORT: z.string().transform(Number).default('3000'),
  LOG_LEVEL: z.enum(['debug', 'info', 'warn', 'error']).default('info'),

  // AI Providers
  ANTHROPIC_API_KEY: z.string().optional(),
  OPENAI_API_KEY: z.string().optional(),

  // Database
  DATABASE_URL: z.string().optional(),
});
```

### Custom Configuration

```typescript
import { defineConfig } from '@monorepo/config';

const myConfig = defineConfig({
  port: 3001,
  customSetting: 'value',
});
```

## @monorepo/core

Core framework utilities and base classes.

### Installation

```typescript
import { logger, retry, formatDate } from '@monorepo/core';
```

### Logger

```typescript
import { logger } from '@monorepo/core';

logger.debug('Debug message');
logger.info('Info message', { userId: 123 });
logger.warn('Warning message');
logger.error('Error message', error);
```

### Retry Utility

```typescript
import { retry } from '@monorepo/core';

const result = await retry(
  async () => {
    return await fetchData();
  },
  {
    maxAttempts: 3,
    delay: 1000,
    backoff: 'exponential',
  }
);
```

### Date Utilities

```typescript
import { formatDate, parseDate, isValidDate } from '@monorepo/core';

formatDate(new Date(), 'YYYY-MM-DD'); // '2024-01-15'
parseDate('2024-01-15'); // Date object
isValidDate('2024-01-15'); // true
```

### String Utilities

```typescript
import { slugify, truncate, capitalize } from '@monorepo/core';

slugify('Hello World'); // 'hello-world'
truncate('Long text', 10); // 'Long te...'
capitalize('hello'); // 'Hello'
```

## Creating New Packages

### 1. Create Directory

```bash
mkdir -p packages/my-package/src
```

### 2. Create package.json

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
  }
}
```

### 3. Create tsconfig.json

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

### 4. Create Source Files

```typescript
// src/index.ts
export * from './my-module';
```

### 5. Build and Use

```bash
pnpm --filter @monorepo/my-package build
```

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)**
