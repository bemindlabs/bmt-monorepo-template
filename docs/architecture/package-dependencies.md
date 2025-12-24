# Package Dependencies

Visual representation of package relationships and dependency flow.

## Dependency Graph

```mermaid
graph TB
    subgraph "External Dependencies"
        ZOD[zod]
        DOTENV[dotenv]
        TSUP[tsup]
        VITEST[vitest]
    end

    subgraph "Shared Packages"
        SHARED["@monorepo-agents/shared<br/><i>Types, Errors, Constants</i>"]
        CONFIG["@monorepo-agents/config<br/><i>Environment, Validation</i>"]
        CORE["@monorepo-agents/core<br/><i>Agent Framework</i>"]
    end

    subgraph "AI Provider SDKs"
        ANTHROPIC["@anthropic-ai/sdk"]
        OPENAI_SDK["openai"]
        GOOGLE_AI["@google/generative-ai"]
    end

    subgraph "Agents"
        AGENT1["Agent 1"]
        AGENT2["Agent 2"]
        AGENT_N["Agent N"]
    end

    subgraph "Applications"
        API["API App"]
        WEB["Web App"]
        CLI["CLI Tool"]
    end

    %% Package dependencies
    ZOD --> CONFIG
    DOTENV --> CONFIG
    TSUP --> SHARED
    TSUP --> CONFIG
    TSUP --> CORE
    VITEST --> SHARED
    VITEST --> CONFIG
    VITEST --> CORE

    SHARED --> CONFIG
    SHARED --> CORE
    CONFIG --> CORE

    %% AI SDK dependencies
    ANTHROPIC --> CORE
    OPENAI_SDK --> CORE
    GOOGLE_AI --> CORE

    %% Agent dependencies
    CORE --> AGENT1
    CORE --> AGENT2
    CORE --> AGENT_N

    %% App dependencies
    CORE --> API
    CORE --> WEB
    CORE --> CLI
    AGENT1 --> API
    AGENT2 --> WEB
```

## Dependency Matrix

| Package                   | Depends On              | Used By                    |
| ------------------------- | ----------------------- | -------------------------- |
| `@monorepo-agents/shared` | -                       | config, core, agents, apps |
| `@monorepo-agents/config` | shared, zod, dotenv     | core, agents, apps         |
| `@monorepo-agents/core`   | shared, config, AI SDKs | agents, apps               |

## Package Details

### @monorepo-agents/shared

**Purpose:** Foundation types and utilities

```mermaid
graph LR
    subgraph "Exports"
        TYPES[Types]
        ERRORS[Errors]
        CONSTANTS[Constants]
        UTILS[Utilities]
    end

    subgraph "Consumers"
        CONFIG[config]
        CORE[core]
        AGENTS[agents/*]
        APPS[apps/*]
    end

    TYPES --> CONFIG
    TYPES --> CORE
    TYPES --> AGENTS
    TYPES --> APPS
    ERRORS --> CORE
    ERRORS --> AGENTS
    CONSTANTS --> CORE
    CONSTANTS --> AGENTS
```

**Dependencies:** None (leaf package)

**Exports:**

- `AgentConfig`, `AgentResponse` - Agent types
- `ProviderConfig`, `ProviderResponse` - Provider types
- `AgentError`, `ToolExecutionError` - Error classes
- `AGENT_TYPES`, `DEFAULT_MODEL` - Constants

### @monorepo-agents/config

**Purpose:** Configuration and environment management

```mermaid
graph LR
    subgraph "Dependencies"
        SHARED[shared]
        ZOD[zod]
        DOTENV[dotenv]
    end

    subgraph "config"
        ENV[Env Loader]
        SCHEMA[Zod Schemas]
        HELPERS[Helpers]
    end

    subgraph "Exports"
        LOAD[loadEnv]
        VALIDATE[validateConfig]
        IS_DEV[isDev/isProd]
    end

    SHARED --> ENV
    ZOD --> SCHEMA
    DOTENV --> ENV
    ENV --> LOAD
    SCHEMA --> VALIDATE
    HELPERS --> IS_DEV
```

**Dependencies:**

- `@monorepo-agents/shared`
- `zod` - Schema validation
- `dotenv` - Environment loading

**Exports:**

- `loadEnv()` - Load environment variables
- `validateConfig()` - Validate configuration
- `isDev()`, `isProd()`, `isTest()` - Environment helpers

### @monorepo-agents/core

**Purpose:** Agent framework and AI provider abstraction

```mermaid
graph TB
    subgraph "Dependencies"
        SHARED[shared]
        CONFIG[config]
        CLAUDE_SDK["@anthropic-ai/sdk"]
        OPENAI_SDK[openai]
        GEMINI_SDK["@google/generative-ai"]
    end

    subgraph "core"
        BASE_AGENT[BaseAgent]
        PROVIDERS[Providers]
        TOOLS[Tools]
    end

    subgraph "Providers"
        CLAUDE[ClaudeProvider]
        OPENAI[OpenAIProvider]
        GEMINI[GeminiProvider]
        OLLAMA[OllamaProvider]
    end

    SHARED --> BASE_AGENT
    CONFIG --> BASE_AGENT
    CLAUDE_SDK --> CLAUDE
    OPENAI_SDK --> OPENAI
    GEMINI_SDK --> GEMINI
```

**Dependencies:**

- `@monorepo-agents/shared`
- `@monorepo-agents/config`
- AI Provider SDKs (optional peer dependencies)

**Exports:**

- `Agent`, `SimpleAgent` - Base classes
- `ClaudeProvider`, `OpenAIProvider`, `GeminiProvider`, `OllamaProvider`
- `Tool`, `ToolResult` - Tool abstractions

## Build Order

Turborepo ensures packages build in dependency order:

```mermaid
graph LR
    A[shared] --> B[config]
    A --> C[core]
    B --> C
    C --> D[agents/*]
    C --> E[apps/*]
    D --> F[Build Complete]
    E --> F
```

## Version Management

All packages use workspace protocol for internal dependencies:

```json
{
  "dependencies": {
    "@monorepo-agents/shared": "workspace:*",
    "@monorepo-agents/config": "workspace:*",
    "@monorepo-agents/core": "workspace:*"
  }
}
```

This ensures:

- Packages always use local versions during development
- Version conflicts are avoided
- Changes propagate immediately
