# Monorepo Template - Claude Rules

> **Version**: 0.1.0
> **Project**: TypeScript Monorepo Template

## Core Principles

1. **Modularity First**: Each package should be self-contained and reusable
2. **Type Safety**: Strict TypeScript, no `any` types
3. **Test Coverage**: Maintain 80%+ coverage on changed code
4. **Clean Architecture**: Separate concerns between packages, apps, and tools

## Pre-Development Checklist

Before making ANY code changes:

```bash
# 1. Check current state
git status
git pull origin main

# 2. Validate environment
pnpm build:packages    # Build shared packages first
pnpm type-check        # Check for type errors
pnpm lint              # Check code quality

# 3. Create feature branch
git checkout -b feature/<descriptive-name>
```

## Project Structure

```
monorepo-template/
├── apps/             # Applications
├── packages/         # Shared packages
│   ├── core/         # Core framework utilities
│   ├── shared/       # Shared types and utilities
│   └── config/       # Configuration utilities
├── tools/            # CLI tools and utilities
├── docs/             # Documentation
└── infra/            # Infrastructure configs
```

## Package Development Rules

### Package Structure

```
packages/<package-name>/
├── src/
│   ├── index.ts          # Entry point
│   └── types.ts          # Type definitions
├── tests/
├── package.json
└── tsconfig.json
```

### Rules

- Use `@monorepo/core` for base utilities
- Define clear input/output types
- Implement proper error handling
- Add logging for debugging
- Write tests for critical paths
- Document package capabilities

## Shared Packages

### @monorepo/core

Core framework providing:

- Base utilities
- Type definitions
- Helper functions

### @monorepo/shared

Shared across all packages:

- Common types
- Error classes
- Constants

### @monorepo/config

Environment and configuration:

- Environment validation
- Config schemas (Zod)
- dotenv integration

## Code Quality

### Before Committing

```bash
pnpm type-check       # No TypeScript errors
pnpm lint             # No ESLint errors
pnpm format           # Prettier formatting
pnpm test             # All tests pass
```

### Commit Guidelines

**Format**: Conventional Commits

```bash
feat(core): add new utility function
fix(shared): correct type definition
docs(readme): update installation guide
test(config): add validation tests
```

## Security Rules

**CRITICAL**: Never commit sensitive data

**Protected Patterns** (auto-blocked):

- `*.env` (except `.env.example`)
- `*.key`, `*.pem`, `*.p12`, `*.pfx`
- `*credentials*.json`
- `*secrets*.json`

**Rules**:

- Use `.env.example` for documentation
- Load secrets from environment variables
- Never log API keys
- Validate all external inputs

## Testing Requirements

- Unit tests for core functions
- Integration tests for workflows
- Mock external API calls
- Test error handling paths
- Coverage: 80%+ on changed files

## Code Style

### TypeScript

```typescript
// Good
interface Config {
  name: string;
  options?: Record<string, unknown>;
}

const createService = (config: Config): Service => {
  return new Service(config);
};

// Bad
const service: any = {}; // NO 'any' types
function doSomething() {} // Use arrow functions
```

## Common Issues & Solutions

### "Cannot find module '@monorepo/xxx'"

```bash
cd packages/xxx && pnpm build
# Or rebuild all packages
pnpm clean && pnpm build:packages
```

### Type errors after package update

```bash
pnpm build:packages
find . -name "*.tsbuildinfo" -delete
# Restart TypeScript server in IDE
```

## Review Checklist

Before submitting PR:

- [ ] Code follows project patterns
- [ ] All tests pass (`pnpm test`)
- [ ] No lint errors (`pnpm lint`)
- [ ] No type errors (`pnpm type-check`)
- [ ] Security reviewed (no secrets)
- [ ] Documentation updated
- [ ] Conventional commit messages

---

**Remember**: Build packages first, test thoroughly, maintain type safety.
