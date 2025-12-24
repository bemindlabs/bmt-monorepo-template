# Configuration

Guide to configuring the monorepo template.

## Environment Variables

### Core Variables

| Variable    | Description      | Default       |
| ----------- | ---------------- | ------------- |
| `NODE_ENV`  | Environment mode | `development` |
| `PORT`      | Application port | `3000`        |
| `LOG_LEVEL` | Logging level    | `info`        |

### AI Provider Keys

| Variable            | Provider   | Required          |
| ------------------- | ---------- | ----------------- |
| `ANTHROPIC_API_KEY` | Claude API | For Claude agents |
| `OPENAI_API_KEY`    | OpenAI API | For OpenAI agents |
| `GOOGLE_AI_API_KEY` | Gemini API | For Gemini agents |
| `OLLAMA_BASE_URL`   | Ollama     | For local models  |

### Firebase Configuration

| Variable                  | Description         |
| ------------------------- | ------------------- |
| `FIREBASE_PROJECT_ID`     | Firebase project ID |
| `FIREBASE_API_KEY`        | Firebase API key    |
| `FIREBASE_AUTH_DOMAIN`    | Auth domain         |
| `FIREBASE_STORAGE_BUCKET` | Storage bucket      |

## Configuration Files

### TypeScript Configuration

**Root `tsconfig.json`:**

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "strict": true,
    "noEmit": true
  }
}
```

**Package-specific configs** extend base configurations:

- `tsconfig.base.json` - Shared settings
- `tsconfig.node.json` - Node.js settings
- `tsconfig.react.json` - React settings

### Turborepo Configuration

**`turbo.json`:**

```json
{
  "$schema": "https://turbo.build/schema.json",
  "tasks": {
    "build": {
      "dependsOn": ["^build"],
      "outputs": ["dist/**"]
    },
    "dev": {
      "cache": false,
      "persistent": true
    },
    "test": {
      "dependsOn": ["build"]
    }
  }
}
```

### ESLint Configuration

**`eslint.config.mjs`:**

```javascript
import js from '@eslint/js';
import typescript from '@typescript-eslint/eslint-plugin';

export default [
  js.configs.recommended,
  {
    rules: {
      // Custom rules
    },
  },
];
```

### Prettier Configuration

**`.prettierrc`:**

```json
{
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5",
  "printWidth": 100
}
```

## Port Assignments

Reserved port ranges for applications:

| Range     | Purpose          |
| --------- | ---------------- |
| 3000-3009 | Web applications |
| 3010-3019 | API services     |
| 3020-3029 | Agent services   |
| 3030-3039 | Tool services    |
| 3040-3049 | Documentation    |
| 3050-3099 | Reserved         |

### Current Assignments

| Port | Application   |
| ---- | ------------- |
| 3000 | @monorepo/web |
| 3001 | (Available)   |
| ...  | ...           |

## Package Configuration

### Workspace Configuration

**`pnpm-workspace.yaml`:**

```yaml
packages:
  - 'packages/*'
  - 'apps/*'
  - 'agents/*'
  - 'tools/*'
```

### Package Naming

All packages use the `@monorepo` scope:

| Package | Name               |
| ------- | ------------------ |
| Shared  | `@monorepo/shared` |
| Config  | `@monorepo/config` |
| Core    | `@monorepo/core`   |
| Web     | `@monorepo/web`    |

## Docker Configuration

### Development

```yaml
# docker-compose.yml
services:
  web:
    build:
      context: .
      dockerfile: infra/docker/Dockerfile.dev
    ports:
      - '3000:3000'
    volumes:
      - .:/app
```

### Production

```yaml
services:
  web:
    build:
      context: .
      dockerfile: infra/docker/Dockerfile
    ports:
      - '3000:3000'
```

## Kubernetes Configuration

### Kustomize Overlays

| Overlay                 | Purpose                |
| ----------------------- | ---------------------- |
| `base/`                 | Base configuration     |
| `overlays/development/` | Local development      |
| `overlays/staging/`     | Staging environment    |
| `overlays/production/`  | Production environment |

### Apply Configuration

```bash
# Development
kubectl apply -k infra/k8s/overlays/development

# Production
kubectl apply -k infra/k8s/overlays/production
```

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)**
