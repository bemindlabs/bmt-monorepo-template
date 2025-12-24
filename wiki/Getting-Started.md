# Getting Started

Get up and running with the Monorepo Template in minutes.

## Prerequisites

Ensure you have the following installed:

| Tool    | Version | Check Command    |
| ------- | ------- | ---------------- |
| Node.js | 22+     | `node --version` |
| pnpm    | 9+      | `pnpm --version` |
| Git     | 2.40+   | `git --version`  |

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/your-org/monorepo-template.git
cd monorepo-template
```

### 2. Run Initialization Script

```bash
chmod +x scripts/init-project.sh
./scripts/init-project.sh
```

The script will:

- Verify Node.js and pnpm versions
- Install all dependencies
- Build shared packages
- Run initial tests
- Display port assignments

### 3. Start Development

```bash
# Start all apps in development mode
pnpm dev

# Or start specific app
pnpm --filter @monorepo/web dev
```

### 4. Open in Browser

Navigate to [http://localhost:3000](http://localhost:3000) to see the web app.

## Using Makefile

The project includes a Makefile for common commands:

```bash
# First-time setup
make init

# Start development
make dev

# Run all quality checks
make check

# Show all available commands
make help
```

## Manual Setup

If you prefer manual setup:

```bash
# Install dependencies
pnpm install

# Build packages (required first)
pnpm build:packages

# Run type checking
pnpm type-check

# Start development
pnpm dev
```

## Verify Installation

Run the following to verify everything is working:

```bash
# Run all checks
pnpm type-check && pnpm lint && pnpm test
```

Expected output: All checks pass with no errors.

## Next Steps

- [Installation](Installation) - Detailed installation options
- [Configuration](Configuration) - Configure your environment
- [Development](Development) - Development workflow guide

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)**
