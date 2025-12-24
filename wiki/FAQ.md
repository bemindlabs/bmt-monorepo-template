# FAQ

Frequently asked questions about the Monorepo Template.

## General

### What is this template for?

This template provides a production-ready foundation for building TypeScript monorepo applications with:

- Multiple packages sharing code
- AI agent development support
- Modern tooling (Turborepo, pnpm, Vite)
- Infrastructure configurations (Docker, Kubernetes, Firebase)

### Who should use this template?

- Teams building multiple related applications
- Developers creating AI-powered applications
- Projects needing shared code across packages
- Applications requiring modern DevOps practices

### What are the prerequisites?

- Node.js 22+
- pnpm 9+
- Git 2.40+
- (Optional) Docker, Minikube, Firebase CLI

## Architecture

### Why use a monorepo?

Benefits of monorepo architecture:

- **Code sharing**: Reuse code across packages
- **Atomic changes**: Update multiple packages in one commit
- **Unified tooling**: Single configuration for all packages
- **Simplified dependencies**: Internal packages stay in sync

### Why Turborepo?

Turborepo provides:

- **Caching**: Skip unchanged builds
- **Parallelization**: Build packages concurrently
- **Dependency awareness**: Correct build order
- **Remote caching**: Share cache across team

### Why pnpm?

pnpm advantages:

- **Disk efficiency**: Shared package store
- **Speed**: Faster than npm/yarn
- **Strict**: Prevents phantom dependencies
- **Workspaces**: Native monorepo support

## Development

### How do I add a new package?

```bash
# Create package directory
mkdir -p packages/my-package/src

# Add package.json with @monorepo scope
# Add tsconfig.json extending base config
# Create source files in src/

# Install and build
pnpm install
pnpm build:packages
```

### How do I add dependencies?

```bash
# Add to specific package
pnpm --filter @monorepo/web add react

# Add to all packages
pnpm add -w typescript

# Add internal dependency
pnpm --filter @monorepo/web add @monorepo/shared
```

### How do I run a command in a specific package?

```bash
# Using filter
pnpm --filter @monorepo/web dev

# Using turbo
pnpm turbo run dev --filter=@monorepo/web
```

### How do I debug tests?

```bash
# Run single test file
pnpm test -- src/my-test.test.ts

# Run with verbose output
pnpm test -- --reporter=verbose

# Run in watch mode
pnpm test -- --watch
```

## AI Development

### Which AI providers are supported?

| Provider           | Models                  | Use Case                |
| ------------------ | ----------------------- | ----------------------- |
| Claude (Anthropic) | Claude 3.5 Sonnet, Opus | General purpose, coding |
| OpenAI             | GPT-4, GPT-4 Turbo      | General purpose         |
| Google             | Gemini Pro              | Multimodal              |
| Ollama             | Llama, Mistral          | Local development       |

### How do I create an AI agent?

```typescript
import { Agent, AgentConfig } from '@monorepo/core';

class MyAgent extends Agent {
  constructor(config: AgentConfig) {
    super(config);
  }

  async execute(input: string) {
    const response = await this.provider.createCompletion({
      messages: [{ role: 'user', content: input }],
    });
    return { success: true, data: response.content };
  }
}
```

### Can I use multiple AI providers?

Yes, the framework supports multiple providers:

```typescript
const claudeAgent = new Agent({ provider: 'claude' });
const openaiAgent = new Agent({ provider: 'openai' });
const localAgent = new Agent({ provider: 'ollama' });
```

## Deployment

### How do I deploy to production?

1. **Docker**: `docker compose -f docker-compose.prod.yml up -d`
2. **Kubernetes**: `kubectl apply -k infra/k8s/overlays/production`
3. **Firebase**: `firebase deploy`

### How do I set up CI/CD?

GitHub Actions workflows are included:

- `.github/workflows/ci.yml` - Continuous integration
- `.github/workflows/release.yml` - Release automation

### How do I manage secrets?

| Platform   | Method                    |
| ---------- | ------------------------- |
| Local      | `.env.local` (gitignored) |
| Docker     | Docker secrets            |
| Kubernetes | Kubernetes Secrets        |
| GitHub     | Repository secrets        |

## Troubleshooting

### Why is my build failing?

Common causes:

1. Dependencies not installed: `pnpm install`
2. Packages not built: `pnpm build:packages`
3. TypeScript errors: `pnpm type-check`
4. Cache issues: `pnpm turbo clean`

### Why are my changes not reflected?

Try:

1. Clear build cache: `pnpm clean`
2. Rebuild: `pnpm build`
3. Clear browser cache
4. Restart dev server

### How do I report a bug?

1. Check existing [issues](https://github.com/anthropics/claude-code/issues)
2. Create new issue with:
   - Description of the problem
   - Steps to reproduce
   - Expected vs actual behavior
   - Environment details

## Contributing

### How can I contribute?

See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines:

1. Fork the repository
2. Create feature branch
3. Make changes with tests
4. Submit pull request

### What coding standards should I follow?

- TypeScript strict mode
- ESLint rules enforced
- Prettier formatting
- Conventional commits

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)**
