# CI/CD Pipeline

Continuous integration and deployment workflows.

## Pipeline Overview

```mermaid
graph LR
    subgraph "Trigger"
        A[Push/PR]
    end

    subgraph "CI Pipeline"
        B[Install]
        C[Lint]
        D[Type Check]
        E[Test]
        F[Build]
    end

    subgraph "CD Pipeline"
        G[Release]
        H[Deploy]
    end

    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
    F --> G
    G --> H
```

## GitHub Actions Workflows

### Main CI Workflow

```mermaid
graph TB
    subgraph "on: push/pull_request"
        A[Checkout]
        B[Setup Node.js]
        C[Setup pnpm]
        D[Install Dependencies]
        E[Lint]
        F[Type Check]
        G[Test]
        H[Build]
    end

    A --> B --> C --> D
    D --> E & F & G
    E & F & G --> H
```

### Agent Workflows

```mermaid
graph TB
    subgraph "AI Agent Workflows"
        SCRUM[SCRUM Agent<br/>Daily standups, Sprint ceremonies]
        CODEGEN[CodeGen Agent<br/>Generate services, components]
        DOCS[Docs Agent<br/>Generate documentation]
        REFACTOR[Refactor Agent<br/>Code improvements]
        ORCHESTRATOR[Orchestrator<br/>Multi-agent coordination]
    end

    subgraph "Triggers"
        SCHEDULE[Schedule/Cron]
        COMMENT[Issue Comment]
        DISPATCH[Manual Dispatch]
    end

    SCHEDULE --> SCRUM
    COMMENT --> CODEGEN
    COMMENT --> DOCS
    COMMENT --> REFACTOR
    DISPATCH --> ORCHESTRATOR
```

## Workflow Stages

### 1. Install Stage

```yaml
- name: Setup pnpm
  uses: pnpm/action-setup@v2

- name: Setup Node.js
  uses: actions/setup-node@v4
  with:
    node-version: '22'
    cache: 'pnpm'

- name: Install dependencies
  run: pnpm install --frozen-lockfile
```

### 2. Quality Gates

```mermaid
graph LR
    subgraph "Quality Checks"
        A[ESLint<br/>Code Style]
        B[TypeScript<br/>Type Safety]
        C[Vitest<br/>Unit Tests]
        D[Coverage<br/>Code Coverage]
    end

    subgraph "Results"
        E{All Pass?}
        F[Continue]
        G[Fail Build]
    end

    A --> E
    B --> E
    C --> E
    D --> E
    E -->|Yes| F
    E -->|No| G
```

### 3. Build Stage

```mermaid
graph TB
    subgraph "Turborepo Build"
        A[Analyze Dependencies]
        B[Check Cache]
        C{Cache Hit?}
        D[Skip Build]
        E[Build Package]
        F[Store in Cache]
    end

    A --> B --> C
    C -->|Yes| D
    C -->|No| E --> F
```

### 4. Release Stage

```mermaid
graph TB
    subgraph "Changesets Release"
        A[Check for Changesets]
        B{Has Changes?}
        C[Version Packages]
        D[Generate Changelog]
        E[Create Release PR]
        F[Publish to npm]
        G[Skip]
    end

    A --> B
    B -->|Yes| C --> D --> E
    E -->|Merged| F
    B -->|No| G
```

## Environment Strategy

```mermaid
graph LR
    subgraph "Branches"
        FEAT[feature/*]
        DEV[develop]
        MAIN[main]
    end

    subgraph "Environments"
        PREVIEW[Preview]
        STAGING[Staging]
        PROD[Production]
    end

    FEAT --> PREVIEW
    DEV --> STAGING
    MAIN --> PROD
```

## Secrets Management

| Secret              | Purpose           | Scope            |
| ------------------- | ----------------- | ---------------- |
| `GITHUB_TOKEN`      | GitHub API access | All workflows    |
| `NPM_TOKEN`         | npm publishing    | Release workflow |
| `ANTHROPIC_API_KEY` | Claude API        | Agent workflows  |
| `OPENAI_API_KEY`    | OpenAI API        | Agent workflows  |
| `GOOGLE_AI_API_KEY` | Gemini API        | Agent workflows  |

## Caching Strategy

```mermaid
graph TB
    subgraph "Cache Layers"
        A[pnpm Store<br/>~/.pnpm-store]
        B[Turborepo Cache<br/>node_modules/.cache]
        C[Build Artifacts<br/>dist/]
    end

    subgraph "Cache Keys"
        D[pnpm-lock.yaml hash]
        E[Source file hashes]
        F[turbo.json hash]
    end

    D --> A
    E --> B
    F --> C
```

## Deployment Flow

### Docker Deployment

```mermaid
graph TB
    A[Build Success] --> B[Build Docker Image]
    B --> C[Push to Registry]
    C --> D[Deploy to Staging]
    D --> E{Health Check?}
    E -->|Pass| F[Deploy to Production]
    E -->|Fail| G[Rollback]
```

### Kubernetes Deployment

```mermaid
graph LR
    subgraph "CI"
        A[Build]
        B[Push Image]
    end

    subgraph "CD"
        C[Update Manifests]
        D[ArgoCD Sync]
        E[Rolling Update]
    end

    A --> B --> C --> D --> E
```

## Monitoring

### Pipeline Metrics

| Metric           | Target  | Alert Threshold |
| ---------------- | ------- | --------------- |
| Build Time       | < 5 min | > 10 min        |
| Test Coverage    | > 80%   | < 70%           |
| Success Rate     | > 95%   | < 90%           |
| Deploy Frequency | Daily   | < Weekly        |

### Health Checks

```mermaid
graph TB
    A[Deploy Complete] --> B[Wait 30s]
    B --> C[Health Check]
    C --> D{Healthy?}
    D -->|Yes| E[Success]
    D -->|No| F[Retry 3x]
    F --> G{Still Unhealthy?}
    G -->|Yes| H[Rollback]
    G -->|No| E
```

## Rollback Strategy

```mermaid
graph TB
    A[Detect Failure] --> B[Stop Traffic]
    B --> C[Identify Last Good Version]
    C --> D[Deploy Previous Version]
    D --> E[Verify Health]
    E --> F[Restore Traffic]
    F --> G[Post-mortem]
```
