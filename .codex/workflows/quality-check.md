---
description: Run the standard Codex quality gate before commits or PRs
---

# Quality Check Workflow

1. **Format & lint staged work**

   ```bash
   pnpm format:check
   pnpm lint
   ```

2. **Type safety**

   ```bash
   pnpm type-check
   ```

3. **Test suites**

   ```bash
   pnpm test                      # full run
   pnpm test:unit                 # for tight loops
   pnpm test:integration          # cross-package flows
   pnpm test:coverage             # verify ≥80% touched coverage
   ```

4. **Build confidence**

   ```bash
   pnpm build:packages
   pnpm build --filter=./apps/web
   ```

5. **Docker/infrastructure (if affected)**

   ```bash
   pnpm docker:up
   pnpm docker:down
   ```

6. **Git hygiene**
   ```bash
   git status
   git diff
   pnpm changeset        # capture notable package updates
   ```

> All steps must succeed locally before authoring a Conventional Commit or opening a PR. Document deviations in the PR template.
