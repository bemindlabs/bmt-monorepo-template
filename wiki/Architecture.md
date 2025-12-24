# Architecture

System architecture overview for the Monorepo Template.

## High-Level Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                        Monorepo                             │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────────────────────────────────────────────┐   │
│  │                  Packages Layer                      │   │
│  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐   │   │
│  │  │   shared    │ │   config    │ │    core     │   │   │
│  │  │ Types/Utils │ │ Env/Settings│ │  Framework  │   │   │
│  │  └─────────────┘ └─────────────┘ └─────────────┘   │   │
│  └─────────────────────────────────────────────────────┘   │
│                            │                                 │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                   Agents Layer                       │   │
│  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐   │   │
│  │  │   Agent 1   │ │   Agent 2   │ │   Agent N   │   │   │
│  │  └─────────────┘ └─────────────┘ └─────────────┘   │   │
│  └─────────────────────────────────────────────────────┘   │
│                            │                                 │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                    Apps Layer                        │   │
│  │  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐   │   │
│  │  │     API     │ │     Web     │ │     CLI     │   │   │
│  │  └─────────────┘ └─────────────┘ └─────────────┘   │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                            │
        ┌───────────────────┼───────────────────┐
        ▼                   ▼                   ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Claude    │     │   OpenAI    │     │   Ollama    │
│     API     │     │     API     │     │   (Local)   │
└─────────────┘     └─────────────┘     └─────────────┘
```

## Layer Descriptions

### Packages Layer

Foundation packages shared across the monorepo:

| Package            | Purpose                  | Dependencies   |
| ------------------ | ------------------------ | -------------- |
| `@monorepo/shared` | Types, errors, constants | None           |
| `@monorepo/config` | Environment, validation  | shared         |
| `@monorepo/core`   | Base classes, utilities  | shared, config |

### Agents Layer

AI agent implementations:

| Component           | Description                     |
| ------------------- | ------------------------------- |
| Base Agent          | Abstract agent class            |
| Tool Agent          | Agent with tool capabilities    |
| Stateful Agent      | Agent with conversation history |
| Orchestration Agent | Multi-agent coordinator         |

### Apps Layer

User-facing applications:

| App | Type            | Port |
| --- | --------------- | ---- |
| Web | Vite + React 19 | 3000 |
| API | (Future)        | 3010 |
| CLI | (Future)        | N/A  |

## Package Dependency Graph

```
@monorepo/shared (Foundation)
         │
         ├──────────────────┐
         ▼                  ▼
@monorepo/config    @monorepo/core
         │                  │
         └────────┬─────────┘
                  ▼
            Applications
         ┌────────┴────────┐
         ▼        ▼        ▼
       apps/   agents/   tools/
```

## Agent Architecture

### Agent Class Hierarchy

```
Agent (abstract)
├── SimpleAgent
│   └── Single-turn completion
├── ToolAgent
│   └── Tool-enabled agent
├── StatefulAgent
│   └── Conversation history
└── OrchestrationAgent
    └── Multi-agent coordination
```

### Agent Execution Flow

```
User Input
    │
    ▼
┌─────────┐
│  Agent  │
└────┬────┘
     │
     ▼
┌──────────┐     ┌──────────┐
│ Provider │────▶│  AI API  │
└────┬─────┘     └──────────┘
     │
     ▼
┌──────────┐
│Tool Call?│
└────┬─────┘
     │ Yes
     ▼
┌──────────┐
│  Tools   │
└────┬─────┘
     │
     ▼
Response
```

## Build System

### Turborepo Pipeline

```
pnpm build
    │
    ▼
┌───────────────────────────────────────┐
│              Turborepo                 │
├───────────────────────────────────────┤
│  1. packages/shared    (parallel)     │
│  2. packages/config    (depends: 1)   │
│  3. packages/core      (depends: 1,2) │
│  4. agents/*           (depends: 3)   │
│  5. apps/*             (depends: 3)   │
└───────────────────────────────────────┘
```

### Caching Strategy

| Cache Type | Location        | Purpose         |
| ---------- | --------------- | --------------- |
| Local      | `.turbo/`       | Dev caching     |
| Remote     | (Optional)      | Team caching    |
| pnpm       | `~/.pnpm-store` | Package caching |

## Infrastructure

### Deployment Options

```
┌─────────────────────────────────────────┐
│              Source Code                 │
└────────────────────┬────────────────────┘
                     │
        ┌────────────┼────────────┐
        ▼            ▼            ▼
   ┌─────────┐  ┌─────────┐  ┌─────────┐
   │ Docker  │  │  k8s    │  │Firebase │
   │Compose  │  │Minikube │  │ Hosting │
   └─────────┘  └─────────┘  └─────────┘
        │            │            │
        ▼            ▼            ▼
   Development   Staging     Production
```

### Docker Architecture

```
┌─────────────────────────────────────┐
│           docker-compose            │
├─────────────────────────────────────┤
│  ┌─────────┐ ┌─────────┐ ┌───────┐ │
│  │   web   │ │  redis  │ │ db    │ │
│  │  :3000  │ │  :6379  │ │ :5432 │ │
│  └─────────┘ └─────────┘ └───────┘ │
└─────────────────────────────────────┘
```

### Kubernetes Architecture

```
┌─────────────────────────────────────────┐
│              Namespace: monorepo         │
├─────────────────────────────────────────┤
│  ┌─────────────────────────────────┐   │
│  │            Ingress               │   │
│  │     (monorepo.local:80)         │   │
│  └──────────────┬──────────────────┘   │
│                 │                       │
│  ┌──────────────▼──────────────────┐   │
│  │            Service               │   │
│  │        (ClusterIP:80)           │   │
│  └──────────────┬──────────────────┘   │
│                 │                       │
│  ┌──────────────▼──────────────────┐   │
│  │          Deployment              │   │
│  │     (replicas: 1-3)             │   │
│  └─────────────────────────────────┘   │
└─────────────────────────────────────────┘
```

## Design Principles

1. **Separation of Concerns** - Each package has single responsibility
2. **Dependency Inversion** - Depend on abstractions
3. **Configuration as Code** - Zod-validated configs
4. **Type Safety** - TypeScript strict mode
5. **Testability** - Dependency injection

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)**
