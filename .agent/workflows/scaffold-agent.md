---
description: Create a new agent in the monorepo
---

Follow these steps to create a new agent package.

1. Create the directory structure:

```bash
# Replace 'my-agent' with your agent name
mkdir -p agents/my-agent/src
```

2. Create `agents/my-agent/package.json`:

```json
{
  "name": "@monorepo-agents/my-agent",
  "version": "0.1.0",
  "private": true,
  "main": "./dist/index.js",
  "scripts": {
    "build": "tsup",
    "dev": "tsup --watch"
  },
  "dependencies": {
    "@monorepo-agents/core": "workspace:*"
  }
}
```

3. Create `agents/my-agent/src/agent.ts`:

```typescript
import { Agent, AgentConfig, AgentResponse } from '@monorepo-agents/core';

export class MyAgent extends Agent {
  constructor(config: AgentConfig) {
    super(config);
  }

  async execute(input: string): Promise<AgentResponse> {
    return {
      success: true,
      data: `Processed: ${input}`,
    };
  }
}
```

4. Build and start:

```bash
pnpm build
pnpm agent:start
```
