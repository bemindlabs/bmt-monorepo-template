---
description: Prepare and publish a release with Changesets and Turborepo
---

# Release Workflow

1. **Collect changes**

   ```bash
   pnpm changeset              # describe each change (select affected packages)
   git add .changeset
   git commit -m "chore: add changeset for <feature>"
   ```

2. **Version bump**

   ```bash
   pnpm version-packages       # updates package versions + changelog
   ```

3. **Final verification**

   ```bash
   pnpm lint
   pnpm type-check
   pnpm test
   pnpm build:packages
   pnpm build --filter=./packages/* --filter=./apps/*
   ```

4. **Publish**

   ```bash
   pnpm release                # builds + changeset publish
   ```

   Ensure `NPM_TOKEN` and other registry credentials are configured in the environment or CI secrets.

5. **Post-release**
   ```bash
   git push --follow-tags origin main
   ```
   Share release notes drawn from `CHANGELOG.md` and tag relevant PRs/issues.
