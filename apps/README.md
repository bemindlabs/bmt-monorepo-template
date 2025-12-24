# Apps Directory

This directory contains application implementations that use the agent framework.

## Structure

```
apps/
├── <app-name>/
│   ├── src/
│   ├── package.json
│   └── tsconfig.json
```

## Application Types

### CLI Applications

Command-line interfaces for agent interaction.

```bash
mkdir -p apps/cli/src
```

### Web Applications

Web interfaces for agent management and interaction.

```bash
mkdir -p apps/web/src
```

### API Services

Backend services exposing agent capabilities.

```bash
mkdir -p apps/api/src
```

## Creating a New App

1. Create the app directory structure
2. Add `package.json` with workspace dependencies
3. Configure TypeScript and build tools
4. Implement the application logic
5. Add to the workspace in `pnpm-workspace.yaml`

## Best Practices

- Keep apps focused on a single responsibility
- Use shared packages for common functionality
- Implement proper logging and error handling
- Add health checks for services
- Document API endpoints and CLI commands
