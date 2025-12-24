# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Nothing yet

### Changed

- Nothing yet

## [0.1.1] - 2024-12-24

### Added

#### Web Application

- Complete landing page redesign for BMT Monorepo Template
  - Feature showcase with 8 key features
  - Tech stack display
  - Quick start code block
  - Links to GitHub and documentation
  - Responsive design with dark/light mode support
  - BEMIND TECHNOLOGY branding

#### Infrastructure

- Makefile with 70+ commands in 14 categories
  - Modular structure with includes from `make/` directory
  - Categories: setup, dev, build, quality, test, docker, k8s, firebase, git, release, clean, docs, utils, ci
- GitHub Pages deployment workflow
  - Automatic deployment on push to main
  - Vite configuration for GitHub Pages base path

#### Docker

- Development entrypoint script for dependency installation
- Named volumes for node_modules isolation
- DOCKER environment variable for container detection

### Changed

- Updated Vite config with proper ESM process import
- Improved docker-compose.yml with better volume management

### Fixed

- ESLint error for undefined `process` in Vite config
- Docker development environment esbuild compatibility

## [0.1.0] - 2024-12-24

### Added

#### Core Infrastructure

- Initial monorepo template setup with Turborepo
- pnpm 9+ workspaces configuration
- TypeScript 5.9+ strict mode across all packages
- ESLint 9 with flat config
- Prettier code formatting
- Husky git hooks with pre-commit linting
- Commitlint for conventional commits
- Vitest testing framework with coverage

#### Packages

- `@monorepo/shared` - Shared types, errors, and utilities
- `@monorepo/config` - Environment configuration with Zod validation
- `@monorepo/core` - Core framework utilities

#### Applications

- `@monorepo/web` - Vite 6 + React 19 web application
  - TypeScript strict mode
  - Hot Module Replacement (HMR)
  - Path aliases (`@/` → `src/`)
  - Production-optimized builds

#### AI Agent Framework

- Multi-provider AI support (Claude, OpenAI, Gemini, Ollama)
- Agent architecture documentation with patterns
- Simple Agent, Tool Agent, Stateful Agent patterns
- Example agent implementation templates
- AI cost estimation guide for all providers

#### Agentic Workflows

- `.agent/` workflow configuration structure
- Scaffold Agent workflow
- Release workflow
- Documentation generation workflow
- Codex CLI workflow support (`.codex/`)

#### Infrastructure - Docker

- Multi-stage Dockerfile for production
- Dockerfile.dev for development with hot reload
- Docker Compose with web, Redis, and PostgreSQL services
- Non-root user security configuration

#### Infrastructure - Kubernetes

- Base manifests (namespace, configmap, secret, deployment, service, ingress)
- Kustomize overlays for development, staging, production
- Minikube local development support
- NodePort service for local access

#### Infrastructure - Firebase

- Firebase Hosting configuration
- Firestore database with security rules
- Storage rules with size limits
- Emulator configuration for local development

#### CI/CD

- GitHub Actions CI workflow (lint, type-check, test, build)
- GitHub Actions Release workflow with source archives
- AI Code Review workflow for pull requests
- Changesets version management

#### Documentation

- Comprehensive README with 1300+ lines
- Architecture documentation with Mermaid diagrams
- Agent architecture patterns guide
- Monorepo structure documentation
- Package dependencies diagram
- Tech stack documentation
- CI/CD pipeline documentation
- GitHub Wiki with 13 pages
  - Home, Getting Started, Installation
  - Configuration, Architecture, Packages
  - Development, Deployment, Troubleshooting, FAQ
  - Sidebar and Footer templates

#### Developer Experience

- Port assignment management (3000-3099)
- init-project.sh setup script
- Detailed troubleshooting guide
- Contributing guidelines
- Code of Conduct
- Security policy

#### Roadmap

- AI Provider integration plans (ChatGLM, Mistral, Cohere, etc.)
- Agent Framework enhancement roadmap
- Infrastructure expansion plans (Terraform, Helm, ArgoCD)
- Observability roadmap (Prometheus, Grafana, OpenTelemetry)
- Testing expansion (Playwright, k6, Contract Testing)
- Database plans (PostgreSQL, Redis, Prisma, Vector DB)
- API plans (REST, GraphQL, tRPC, WebSocket, gRPC)

### Security

- Non-root user in Docker containers
- Firestore security rules with default deny
- Storage security rules with size limits (10MB)
- Kubernetes secrets management
- Environment variable validation with Zod

### Documentation

- BEMIND TECHNOLOGY branding throughout
- MIT License
- Conventional commits guide
- AI cost estimation with pricing tables

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)** | [info@bemind.tech](mailto:info@bemind.tech)
