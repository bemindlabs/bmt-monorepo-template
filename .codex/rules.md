# Codex Workflow Rules

> **Project**: dev-agents-workflow  
> **Stack**: TypeScript, pnpm, Turborepo, Vitest

## Core Expectations

- Always use `pnpm`; the `preinstall` hook blocks other package managers.
- Build shared packages (`pnpm build:packages`) before apps (`pnpm build --filter ./apps/*`).
- Maintain strict TypeScript (no `any`) and rely on ESLint + Prettier for formatting.
- Keep docs in sync; architecture changes require updates in `docs/` and `wiki/`.

## Pre-Work Checklist

```bash
pnpm install          # sync dependencies
pnpm lint             # baseline quality gate
pnpm type-check       # ensure TS is happy
pnpm test             # run Vitest suites
git checkout -b feat/<short-purpose>
```

## Coding Standards

- Files use two spaces, single quotes, trailing commas; let Prettier format automatically.
- React components + classes use PascalCase; hooks/utilities use camelCase; files stay kebab-case.
- Export public APIs through each package's `src/index.ts` and update `package.json` exports when needed.
- Use `workspace:*` for internal dependencies so Turborepo can infer task graphs.

## Testing Matrix

- `pnpm test` for full coverage, `pnpm test:unit` or `pnpm test:integration` when narrowing the scope.
- Update or add specs under `tests/` mirroring the touched module tree.
- Run `pnpm test:coverage` for release branches; target ≥80% on touched files.

## Security & Secrets

- Never commit `.env*` files; use `.env.example` for documentation.
- Ports 3000-3099 are reserved for apps; avoid collisions when spinning up new services.
- When adding API keys, document them in `infra/` READMEs, not source files.

## Pull Request Gate

- All lint, type-check, tests, and relevant builds must run locally before opening a PR.
- Follow Conventional Commits (see `commitlint.config.js`), keep subjects ≤100 chars.
- Include screenshots or cURL samples for any user-facing change and mention required env vars.
