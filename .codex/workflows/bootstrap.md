---
description: Bring the repository up locally with pnpm and Turborepo
---

# Bootstrap Repository

1. **Clone & enter**

   ```bash
   git clone <repo-url>
   cd dev-agents-workflow
   ```

2. **Install toolchain** – ensure Node 22+ and pnpm 9+.

   ```bash
   node --version   # expect v22.x
   pnpm --version   # expect 9.x
   pnpm install
   ```

3. **Environment files** – copy the examples and fill in values used by apps/tests.

   ```bash
   cp .env.example .env.local
   ```

   Keep secrets out of git; commit only the template updates.

4. **Prime shared packages** – build libraries once so dependent apps resolve dist outputs.

   ```bash
   pnpm build:packages
   pnpm type-check
   ```

5. **Start development** – Turborepo watches every workspace.

   ```bash
   pnpm dev              # global watcher
   pnpm dev --filter=./apps/web  # scoped dev server
   ```

6. **Docs & references** – skim `AGENTS.md`, `docs/README.md`, and `.codex/rules.md` before pushing changes.

> Tip: register any new workspace in both `pnpm-workspace.yaml` and `turbo.json` before running commands that depend on it.
