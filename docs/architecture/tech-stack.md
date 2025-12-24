# Tech Stack

Technologies and tools used in the monorepo.

## Stack Overview

```mermaid
graph TB
    subgraph "Languages"
        TS[TypeScript 5.9]
    end

    subgraph "Runtime"
        NODE[Node.js 22+]
    end

    subgraph "Package Management"
        PNPM[pnpm 9+]
        TURBO[Turborepo]
    end

    subgraph "Testing"
        VITEST[Vitest]
        V8[V8 Coverage]
    end

    subgraph "Quality"
        ESLINT[ESLint 9]
        PRETTIER[Prettier]
        HUSKY[Husky]
        COMMITLINT[Commitlint]
    end

    subgraph "AI Providers"
        CLAUDE[Claude API]
        OPENAI[OpenAI API]
        GEMINI[Gemini API]
        OLLAMA[Ollama]
    end

    subgraph "Build"
        TSUP[tsup]
        VITE[Vite]
    end

    subgraph "Infrastructure"
        DOCKER[Docker]
        GITHUB[GitHub Actions]
    end

    TS --> NODE
    NODE --> PNPM
    PNPM --> TURBO
    TURBO --> TSUP
    TURBO --> VITE
```

## Core Technologies

### Language & Runtime

| Technology | Version | Purpose              |
| ---------- | ------- | -------------------- |
| TypeScript | 5.9+    | Type-safe JavaScript |
| Node.js    | 22+     | JavaScript runtime   |
| ESM        | -       | Module system        |

### Build System

| Technology | Version | Purpose                      |
| ---------- | ------- | ---------------------------- |
| pnpm       | 9+      | Package manager              |
| Turborepo  | 2+      | Monorepo build orchestration |
| tsup       | 8+      | TypeScript bundler           |
| Vite       | 5+      | Frontend build tool          |

### Testing

| Technology          | Version | Purpose       |
| ------------------- | ------- | ------------- |
| Vitest              | 2+      | Test runner   |
| @vitest/coverage-v8 | 2+      | Code coverage |

### Code Quality

| Technology  | Version | Purpose                |
| ----------- | ------- | ---------------------- |
| ESLint      | 9+      | Linting                |
| Prettier    | 3+      | Code formatting        |
| Husky       | 9+      | Git hooks              |
| Commitlint  | 19+     | Commit message linting |
| lint-staged | 15+     | Pre-commit checks      |

## AI Provider SDKs

```mermaid
graph LR
    subgraph "Provider SDKs"
        A["@anthropic-ai/sdk<br/>Claude"]
        B["openai<br/>GPT"]
        C["@google/generative-ai<br/>Gemini"]
        D["ollama<br/>Local LLMs"]
    end

    subgraph "Features"
        E[Text Generation]
        F[Tool Use]
        G[Streaming]
        H[Vision]
    end

    A --> E & F & G & H
    B --> E & F & G & H
    C --> E & F & G & H
    D --> E & F & G
```

| Provider | SDK                     | Features                       |
| -------- | ----------------------- | ------------------------------ |
| Claude   | `@anthropic-ai/sdk`     | Text, Tools, Streaming, Vision |
| OpenAI   | `openai`                | Text, Tools, Streaming, Vision |
| Gemini   | `@google/generative-ai` | Text, Tools, Streaming, Vision |
| Ollama   | HTTP API                | Text, Tools, Streaming         |

## Configuration Libraries

| Library | Purpose                      |
| ------- | ---------------------------- |
| Zod     | Runtime type validation      |
| dotenv  | Environment variable loading |

## Infrastructure

### Containerization

```mermaid
graph TB
    subgraph "Container Stack"
        A[Dockerfile]
        B[docker-compose.yml]
        C[Multi-stage Builds]
    end

    subgraph "Registry"
        D[GitHub Container Registry]
        E[Docker Hub]
    end

    subgraph "Orchestration"
        F[Docker Compose]
        G[Kubernetes]
    end

    A --> C
    B --> F
    C --> D
    C --> E
    D --> G
    E --> G
```

### CI/CD

| Tool           | Purpose            |
| -------------- | ------------------ |
| GitHub Actions | CI/CD pipelines    |
| Changesets     | Version management |
| Renovate       | Dependency updates |

## Development Tools

### IDE Support

| Tool                 | Purpose           |
| -------------------- | ----------------- |
| VS Code              | Primary IDE       |
| ESLint extension     | Real-time linting |
| Prettier extension   | Format on save    |
| TypeScript extension | IntelliSense      |

### Claude Code Integration

| Feature        | Purpose               |
| -------------- | --------------------- |
| Slash Commands | Automated workflows   |
| Agent Specs    | AI agent definitions  |
| Skills         | Reusable capabilities |

## Dependency Graph

```mermaid
graph TB
    subgraph "Production Dependencies"
        ZOD[zod]
        DOTENV[dotenv]
        ANTHROPIC["@anthropic-ai/sdk"]
        OPENAI[openai]
        GOOGLE["@google/generative-ai"]
    end

    subgraph "Development Dependencies"
        TS[typescript]
        ESLINT[eslint]
        PRETTIER[prettier]
        VITEST[vitest]
        TSUP[tsup]
        TURBO[turbo]
        HUSKY[husky]
    end

    subgraph "Packages"
        SHARED[shared]
        CONFIG[config]
        CORE[core]
    end

    ZOD --> CONFIG
    DOTENV --> CONFIG
    ANTHROPIC --> CORE
    OPENAI --> CORE
    GOOGLE --> CORE

    TS --> SHARED & CONFIG & CORE
    ESLINT --> SHARED & CONFIG & CORE
    VITEST --> SHARED & CONFIG & CORE
    TSUP --> SHARED & CONFIG & CORE
```

## Version Compatibility Matrix

| Node.js | pnpm | TypeScript | Turborepo |
| ------- | ---- | ---------- | --------- |
| 22.x    | 9.x  | 5.9.x      | 2.x       |
| 23.x    | 9.x  | 5.9.x      | 2.x       |

## Performance Optimizations

### Build Performance

- **Turborepo Caching** - Skip unchanged packages
- **Parallel Execution** - Build independent packages concurrently
- **Incremental TypeScript** - Only recompile changed files

### Runtime Performance

- **ESM Modules** - Native module support
- **Tree Shaking** - Remove unused code
- **Lazy Loading** - Load modules on demand

## Security

| Tool              | Purpose                |
| ----------------- | ---------------------- |
| npm audit         | Vulnerability scanning |
| Dependabot        | Automated updates      |
| CODEOWNERS        | Access control         |
| Branch Protection | Merge requirements     |
