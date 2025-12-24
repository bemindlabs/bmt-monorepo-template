# Tests Directory

This directory contains the test suite for the monorepo.

## Structure

```
tests/
├── unit/               # Unit tests
│   └── packages/       # Package-specific unit tests
├── integration/        # Integration tests
│   └── agents/         # Agent integration tests
├── e2e/                # End-to-end tests
│   └── scenarios/      # Test scenarios
├── fixtures/           # Test fixtures and mocks
├── helpers/            # Test utilities
└── setup.ts            # Global test setup
```

## Test Types

### Unit Tests

Test individual functions and classes in isolation.

```typescript
// tests/unit/packages/core/agent.spec.ts
import { describe, it, expect, vi } from 'vitest';
import { SimpleAgent } from '@monorepo-agents/core';

describe('SimpleAgent', () => {
  it('should execute with input', async () => {
    const agent = new SimpleAgent({
      name: 'test-agent',
      description: 'Test agent',
    });

    const response = await agent.execute('Hello');
    expect(response.content).toBeDefined();
  });
});
```

### Integration Tests

Test interactions between components.

```typescript
// tests/integration/agents/multi-provider.spec.ts
import { describe, it, expect } from 'vitest';
import { AgentOrchestrator } from '@monorepo-agents/core';

describe('Multi-Provider Integration', () => {
  it('should fallback to secondary provider', async () => {
    const orchestrator = new AgentOrchestrator({
      providers: ['anthropic', 'openai'],
      fallbackEnabled: true,
    });

    const response = await orchestrator.execute('Test input');
    expect(response.provider).toBeDefined();
  });
});
```

### E2E Tests

Test complete user workflows.

```typescript
// tests/e2e/scenarios/agent-workflow.spec.ts
import { describe, it, expect } from 'vitest';
import { spawn } from 'child_process';

describe('Agent CLI Workflow', () => {
  it('should complete agent execution', async () => {
    // Test CLI end-to-end
  });
});
```

## Running Tests

```bash
# Run all tests
pnpm test

# Run unit tests only
pnpm test:unit

# Run integration tests
pnpm test:integration

# Run e2e tests
pnpm test:e2e

# Run with coverage
pnpm test:coverage

# Watch mode
pnpm test:watch
```

## Configuration

Tests are configured in `vitest.config.ts`:

```typescript
import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    globals: true,
    environment: 'node',
    include: ['tests/**/*.spec.ts'],
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json', 'html'],
      exclude: ['node_modules', 'dist'],
    },
  },
});
```

## Best Practices

1. **Isolation**: Each test should be independent
2. **Mocking**: Use `vi.mock()` for external dependencies
3. **Fixtures**: Store test data in `fixtures/`
4. **Naming**: Use descriptive test names
5. **Coverage**: Aim for 80%+ code coverage
