# Project Context: TypeScript Monorepo Template

## Overview

This is a production-ready TypeScript monorepo template using Turborepo and pnpm workspaces. It is designed for high-performance builds, strict type safety, and modern development workflows.

### Key Technologies

- **Runtime:** Node.js >= 22.0.0
- **Package Manager:** pnpm >= 9.0.0
- **Build System:** Turborepo 2+
- **Language:** TypeScript 5.9+
- **Frontend:** React 19, Vite 6
- **Testing:** Vitest
- **Linting/Formatting:** ESLint 9, Prettier

## Project Structure

- `apps/`: Application source code.
  - `apps/web/`: Vite + React 19 web application.
- `packages/`: Shared libraries.
  - `packages/shared/`: Common types and utilities.
  - `packages/config/`: Configuration utilities (env vars, etc.).
  - `packages/core/`: Core framework utilities.
- `infra/`: Infrastructure configurations (Docker, Kubernetes, Firebase).
- `docs/`: Documentation.
- `.agent/workflows/`: Antigravity agentic workflows (e.g., scaffolding, release).

## Building and Running

### Prerequisites

Ensure `node` (v22+) and `pnpm` (v9+) are installed.

### Key Commands

- **Install Dependencies:** `pnpm install`
- **Build All:** `pnpm build`
  - **Build Packages Only:** `pnpm build:packages` (Recommended before starting dev)
- **Development:** `pnpm dev`
  - **Specific App/Package:** `pnpm dev --filter=@monorepo/web` or `pnpm dev --filter=@monorepo/core`
- **Testing:** `pnpm test`
- **Linting:** `pnpm lint`
- **Type Checking:** `pnpm type-check`

### Infrastructure

- **Docker:** `pnpm docker:up` (Starts web, redis, postgres)
- **Kubernetes:** See `infra/k8s/README.md` (Minikube support included)

## Development Conventions

### Code Style

- **Strict TypeScript:** All code must be strongly typed.
- **Formatting:** Prettier is used for formatting.
- **Linting:** ESLint 9 is enforced. Run `pnpm lint` to check.

### Git Workflow

- **Commits:** Follow [Conventional Commits](https://www.conventionalcommits.org/) (e.g., `feat:`, `fix:`, `chore:`).
- **Hooks:** Husky is set up for pre-commit linting and message validation.

### Creating New Components

- **New Package:**
  1.  Create directory in `packages/`.
  2.  Add `package.json` (use `@monorepo/` scope).
  3.  Add `tsconfig.json` extending root config.
  4.  Run `pnpm install`.
- **New App:**
  1.  Create directory in `apps/`.
  2.  Add `package.json`.
  3.  Add dependencies on workspace packages if needed (`"workspace:*"`).

## Agentic Workflows

This project contains "Antigravity" workflows in `.agent/workflows/` for automating tasks like scaffolding agents and releasing packages.
