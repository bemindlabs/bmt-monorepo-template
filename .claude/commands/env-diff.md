---
description: Compare environment files and show differences
allowed-tools: Read, Bash(diff:*)
argument-hint: <file1> <file2>
---

Compare two environment files and show differences.

## Usage

```
/env-diff <file1> <file2>
```

## Process

1. Parse both environment files
2. Compare variable names and values
3. Show:
   - Variables only in file1
   - Variables only in file2
   - Variables with different values
   - Identical variables (optional)

## Example

```bash
# Compare local to staging
/env-diff .env.local .env.staging

# Compare staging to production
/env-diff .env.staging .env.production

# Compare to template
/env-diff .env.local .env.example
```

## Output Format

```
Environment Diff: .env.local ↔ .env.staging
────────────────────────────────────────────

Only in .env.local:
  - DEBUG_MODE=true
  - LOCAL_CACHE=redis://localhost

Only in .env.staging:
  - STAGING_API=https://staging-api.example.com
  - CDN_URL=https://cdn.staging.example.com

Different values:
  NODE_ENV:
    local:   development
    staging: staging

  API_URL:
    local:   http://localhost:3000
    staging: https://staging.example.com

  LOG_LEVEL:
    local:   debug
    staging: info

Summary: 2 only in local, 2 only in staging, 3 different
```

## Security Note

Values are shown in output. Use `--mask-secrets` to hide sensitive values:

```bash
/env-diff .env.local .env.production --mask-secrets
```

Output:

```
API_KEY:
  local:   sk-***
  production: sk-***
```
