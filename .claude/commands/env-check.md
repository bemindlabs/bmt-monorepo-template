---
description: Validate environment configuration against template
allowed-tools: Read, Bash(grep:*), Bash(diff:*)
argument-hint: [file]
---

Check environment files for missing or invalid variables.

## Usage

```
/env-check [file]
```

**Default:** Checks `.env.local` against `.env.example`

## Process

1. Read `.env.example` to get required variables
2. Read target env file (default: `.env.local`)
3. Compare and report:
   - Missing required variables
   - Empty values
   - Variables not in template (extras)
   - Invalid format (no value, syntax errors)

## Checks Performed

| Check      | Description                             |
| ---------- | --------------------------------------- |
| Required   | All variables from `.env.example` exist |
| Values     | No empty or placeholder values          |
| Format     | Valid `KEY=value` syntax                |
| Secrets    | No obvious test/demo credentials        |
| Duplicates | No duplicate variable definitions       |

## Output Format

```
Environment Check: .env.local
────────────────────────────────
✅ Found: 15 variables
❌ Missing: 2 variables
   - DATABASE_URL
   - REDIS_URL
⚠️  Empty: 1 variable
   - API_SECRET
ℹ️  Extra: 3 variables (not in template)
   - DEBUG_MODE
   - CUSTOM_VAR
   - LOCAL_ONLY
```

## Example

```bash
# Check default .env.local
/env-check

# Check specific file
/env-check .env.staging

# Check production config
/env-check .env.production
```
