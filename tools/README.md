# Tools Directory

This directory contains CLI tools and utilities for the monorepo.

## Structure

```
tools/
├── <tool-name>/
│   ├── src/
│   │   └── index.ts
│   ├── package.json
│   └── bin/
│       └── <tool-name>.js
```

## Available Tools

Tools are added here as the project grows. Examples:

- **cli**: Command-line interface for agent management
- **mcp**: Model Context Protocol server implementation
- **codegen**: Code generation utilities

## Creating a New Tool

1. Create the tool directory:

```bash
mkdir -p tools/my-tool/src
```

2. Add `package.json`:

```json
{
  "name": "@monorepo-agents/my-tool",
  "version": "0.1.0",
  "private": true,
  "type": "module",
  "bin": {
    "my-tool": "./bin/my-tool.js"
  },
  "scripts": {
    "build": "tsup src/index.ts --format esm --dts",
    "dev": "tsup src/index.ts --format esm --watch"
  },
  "dependencies": {
    "@monorepo-agents/core": "workspace:*"
  }
}
```

3. Implement the tool in `src/index.ts`

4. Create the binary wrapper in `bin/my-tool.js`:

```javascript
#!/usr/bin/env node
import '../dist/index.js';
```

## Best Practices

- Use Commander.js or similar for CLI argument parsing
- Provide helpful error messages
- Support both interactive and non-interactive modes
- Add shell completion support where appropriate
