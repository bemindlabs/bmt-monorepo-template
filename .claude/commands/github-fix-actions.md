# Fix GitHub Actions

Diagnose and fix failing GitHub Actions workflows.

## Instructions

### Workflow

1. **List Recent Workflow Runs**

   ```bash
   gh run list --limit 10
   ```

2. **Identify Failing Runs**
   - Filter for failed or cancelled runs
   - Note the run ID and workflow name

3. **Get Failure Details**

   ```bash
   gh run view <run-id> --log-failed
   ```

4. **Analyze Failure**
   - Parse error messages
   - Identify root cause:
     - Test failures
     - Build errors
     - Lint/type errors
     - Dependency issues
     - Configuration problems
     - Secret/environment issues

5. **Fix the Issue**

   Based on failure type:
   - **Test failures:** Fix failing tests or update snapshots
   - **Build errors:** Fix TypeScript/compilation errors
   - **Lint errors:** Run `pnpm lint:fix`
   - **Type errors:** Fix TypeScript type issues
   - **Dependency issues:** Update `pnpm-lock.yaml`
   - **Config issues:** Fix workflow YAML or project config

6. **Verify Fix Locally**

   ```bash
   pnpm lint && pnpm type-check && pnpm test && pnpm build
   ```

7. **Commit and Push**

   Create a fix commit with conventional format:

   ```
   fix(ci): resolve GitHub Actions failure

   - Description of what was fixed
   ```

### Common Fixes

| Error Type    | Command           | Fix              |
| ------------- | ----------------- | ---------------- |
| Lint errors   | `pnpm lint:fix`   | Auto-fix linting |
| Type errors   | `pnpm type-check` | Fix TS errors    |
| Test failures | `pnpm test`       | Fix tests        |
| Build errors  | `pnpm build`      | Fix build        |
| Lock file     | `pnpm install`    | Regenerate lock  |

### Useful Commands

```bash
# List all workflows
gh workflow list

# List runs for specific workflow
gh run list --workflow=ci.yml

# View specific run
gh run view <run-id>

# View failed logs only
gh run view <run-id> --log-failed

# Re-run failed jobs
gh run rerun <run-id> --failed

# Download run logs
gh run download <run-id>
```

## Arguments

- `$ARGUMENTS` - Optional: specific run ID or workflow name

## Output

1. Show list of recent workflow runs with status
2. Identify and analyze failures
3. Propose and implement fixes
4. Verify fixes locally
5. Commit and push if successful
