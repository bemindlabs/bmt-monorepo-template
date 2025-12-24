# Repository Guidelines

## Project Structure & Module Organization

This Turborepo keeps runnable apps inside `apps/` (with `apps/web` as the Vite + React entry point), reusable logic in `packages/` (`core` domain services, `shared` UI/utils, `config` environment defaults), and automation in `scripts/` + `tools/`. Infrastructure definitions live under `infra/` (Docker, Kubernetes, Firebase), while docs span `docs/` and the `wiki/`. Centralized tests sit in `tests/` with `unit`, `integration`, `e2e`, shared `fixtures/`, and global hooks in `tests/setup.ts`. Each workspace exports from `src/index.ts` and inherits compiler settings from `tsconfig.base.json`; remember to register new workspaces in `pnpm-workspace.yaml` and `turbo.json`.

Project management lives in `.scrum/` (backlog with 47 items totaling 299 story points, sprints, standups, retrospectives). Quality assurance is configured in `.zero-qa/` with quality gates (80% coverage, 0 lint/type errors). AI skills reside in `.claude/skills/` including the UI/UX Pro Max design intelligence database.

## Build, Test, and Development Commands

- `pnpm install` – installs workspace deps (guarded by `npx only-allow pnpm`).
- `pnpm dev` – runs `turbo dev`, watching every app/package.
- `pnpm build` / `pnpm build:packages` – produces production bundles; the latter scopes to libraries.
- `pnpm lint`, `pnpm lint:fix`, `pnpm type-check` – enforce ESLint 9 + TS diagnostics.
- `pnpm format` / `pnpm format:check` – Prettier 3 with organize-imports + Tailwind plugins.
- `pnpm test`, `pnpm test:watch`, `pnpm test:coverage`, `pnpm test:integration` (etc.) – Vitest suites wired through `tests/`.
- `pnpm docker:up` / `pnpm docker:down` – orchestrate the services defined in `infra/docker/docker-compose.yml`.

## Coding Style & Naming Conventions

TypeScript strict mode is mandatory; avoid `any` and prefer explicit return types for exported APIs. Source files use two-space indentation, single quotes, and trailing commas—let Prettier handle formatting and lint-staged will enforce it on commit. React components, classes, and types follow PascalCase, hooks/utilities use camelCase, while folders/files stay kebab-case (`packages/shared/src/http-client.ts`). Keep imports sorted via Prettier's organize-imports plugin, colocate CSS with React components, and surface environment-dependent constants through `packages/config` rather than inline literals.

## Testing Guidelines

Vitest drives all suites; target folders mirror runtime modules (`tests/unit/core`, `tests/integration/shared`). Name specs `*.spec.ts`, open with `describe('<Module>')`, and rely on `tests/helpers` for cross-cutting mocks. Prefer fast unit coverage first, then integration/e2e only when behavior spans packages. Use `pnpm test:coverage` before pushing to ensure regressions stay visible, and document unusual fixtures in `tests/README.md`. When touching infra or Docker, run the relevant suite plus `pnpm docker:up` to validate service health.

## Commit & Pull Request Guidelines

Commitlint enforces Conventional Commits with the types listed in `commitlint.config.js` (`feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`) and scopes such as `core`, `shared`, `config`, `app`, `cli`, `infra`, `docs`. Subjects stay lower-case and ≤100 chars, e.g., `feat(core): add auth session guard`. Run lint, type-check, build, and relevant tests before committing so Husky hooks stay fast. PRs should summarize intent, link issues, note the commands executed, and attach screenshots or cURL samples for user-facing or API changes. Flag breaking changes explicitly and copy required environment keys from `.env.example` into local `.env.local` files—never commit secrets.

## Scrum Commands

Use Claude Code slash commands to manage Scrum artifacts: `/scrum-backlog list` shows all 47 backlog items sorted by priority, `/scrum-backlog add "title"` creates new items, `/scrum-sprint start` begins a new sprint, `/scrum-standup` records daily notes, and `/scrum-retro` creates retrospective documents. Configuration in `.scrum/config.json` sets 14-day sprints.

## Zero-QA Commands

Quality gates are enforced via `/zero-qa-check` (pre-commit verification), `/zero-qa-review` (automated code review), `/zero-qa-dod` (Definition of Done), and `/zero-qa-gate` (quality gate validation). Run `pnpm zero-qa` for lint + type-check + test, or `pnpm zero-qa:full` to include E2E tests. Thresholds: 80% coverage, 0 lint errors, 0 type errors, 0 security vulnerabilities.

## UI/UX Pro Max Skill

The design intelligence skill in `.claude/skills/ui-ux-pro-max/` auto-activates on UI/UX requests. It provides 57 UI styles, 95 color palettes, 56 font pairings, 24 chart types, 8 stack guidelines, and 98 UX best practices. Commands: `/ui-review`, `/ux-audit`, `/color-palette`, `/design-system`, `/responsive-check`, `/a11y-check`. Search the database: `python3 .claude/skills/ui-ux-pro-max/scripts/search.py "<keyword>" --domain <style|color|typography|ux>`.
