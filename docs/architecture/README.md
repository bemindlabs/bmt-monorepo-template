# Architecture Overview

This document describes the architecture of the Monorepo Template.

## Documentation Index

| Document                                        | Description                       |
| ----------------------------------------------- | --------------------------------- |
| [Monorepo Structure](monorepo-structure.md)     | Directory layout and organization |
| [Package Dependencies](package-dependencies.md) | Package relationship diagram      |
| [Agent Architecture](agent-architecture.md)     | AI agent design patterns          |
| [CI/CD Pipeline](ci-cd-pipeline.md)             | Automation workflows              |
| [Tech Stack](tech-stack.md)                     | Technologies and tools            |

## High-Level Architecture

```mermaid
graph TB
    subgraph "Monorepo"
        subgraph "Packages Layer"
            SHARED["@monorepo/shared<br/>Types & Utilities"]
            CONFIG["@monorepo/config<br/>Environment & Settings"]
            CORE["@monorepo/core<br/>Core Framework"]
        end

        subgraph "Agents Layer"
            AGENT1["Agent 1"]
            AGENT2["Agent 2"]
            AGENT3["Agent N..."]
        end

        subgraph "Apps Layer"
            API["API Services"]
            WEB["Web Apps"]
            CLI["CLI Tools"]
        end
    end

    subgraph "AI Providers"
        CLAUDE["Claude API"]
        OPENAI["OpenAI API"]
        GEMINI["Gemini API"]
        OLLAMA["Ollama (Local)"]
    end

    subgraph "Infrastructure"
        DOCKER["Docker"]
        GITHUB["GitHub Actions"]
        K8S["Kubernetes"]
    end

    SHARED --> CONFIG
    SHARED --> CORE
    CONFIG --> CORE
    CORE --> AGENT1
    CORE --> AGENT2
    CORE --> AGENT3
    AGENT1 --> API
    AGENT2 --> WEB
    AGENT3 --> CLI

    CORE --> CLAUDE
    CORE --> OPENAI
    CORE --> GEMINI
    CORE --> OLLAMA

    API --> DOCKER
    WEB --> DOCKER
    DOCKER --> K8S
    GITHUB --> DOCKER
```

## Core Concepts

### 1. Layered Architecture

The monorepo follows a layered architecture:

| Layer        | Purpose                   | Location    |
| ------------ | ------------------------- | ----------- |
| **Packages** | Shared libraries          | `packages/` |
| **Agents**   | AI agent implementations  | `agents/`   |
| **Apps**     | Applications and services | `apps/`     |
| **Tools**    | CLI utilities             | `tools/`    |

### 2. Package Hierarchy

```
@monorepo/shared    ← Foundation (types, errors, constants)
         ↓
@monorepo/config    ← Configuration (env, validation)
         ↓
@monorepo/core      ← Framework (base classes, utilities)
         ↓
    Your Apps       ← Implementation (applications)
```

### 3. Multi-Provider AI Support

The framework supports multiple AI providers:

```mermaid
graph LR
    subgraph "Agent"
        A[Your Agent]
    end

    subgraph "Provider Abstraction"
        P[Provider Interface]
    end

    subgraph "Providers"
        C[Claude]
        O[OpenAI]
        G[Gemini]
        L[Ollama]
    end

    A --> P
    P --> C
    P --> O
    P --> G
    P --> L
```

### 4. Build System

Turborepo orchestrates builds with:

- **Dependency-aware builds** - Packages build in correct order
- **Caching** - Skip unchanged packages
- **Parallelization** - Build independent packages concurrently

```mermaid
graph LR
    A[pnpm build] --> B[Turborepo]
    B --> C[packages/shared]
    B --> D[packages/config]
    C --> E[packages/core]
    D --> E
    E --> F[agents/*]
    E --> G[apps/*]
```

## Design Principles

1. **Separation of Concerns** - Each package has a single responsibility
2. **Dependency Inversion** - Depend on abstractions, not implementations
3. **Configuration as Code** - Environment validated with Zod schemas
4. **Type Safety** - TypeScript strict mode throughout
5. **Testability** - Dependency injection for easy mocking

## Key Components

### Shared Package (`@monorepo/shared`)

- Type definitions
- Error classes
- Constants
- Utility functions

### Config Package (`@monorepo/config`)

- Environment variable loading
- Schema validation (Zod)
- Configuration helpers

### Core Package (`@monorepo/core`)

- Base utilities
- Helper functions
- Common abstractions

## Next Steps

- [Monorepo Structure](monorepo-structure.md) - Detailed directory layout
- [Agent Architecture](agent-architecture.md) - Design patterns
- [Tech Stack](tech-stack.md) - Technologies used

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)** | [info@bemind.tech](mailto:info@bemind.tech)
