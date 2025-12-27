---
description: Sync environment variables across environment files
allowed-tools: Read, Edit, Write
argument-hint: [source] [target]
---

Synchronize environment variables between environment files.

## Usage

```
/env-sync [source] [target]
```

**Default:** Sync `.env.example` → all env files

## Process

1. Read source file (default: `.env.example`)
2. Compare with target file(s)
3. Add missing variables with placeholders
4. Report differences
5. Optionally remove extras not in source

## Sync Modes

### Template to All

Sync `.env.example` to all environment files:

```bash
/env-sync
```

### Specific Files

Sync between specific files:

```bash
/env-sync .env.local .env.staging
```

### Reverse Sync

Update template from local:

```bash
/env-sync .env.local .env.example
```

## Options

| Flag              | Description                              |
| ----------------- | ---------------------------------------- |
| `--add-only`      | Only add missing, don't remove extras    |
| `--remove-extras` | Remove variables not in source           |
| `--dry-run`       | Show what would change without modifying |

## Example Output

```
Environment Sync: .env.example → .env.local
────────────────────────────────────────────

📥 Adding to .env.local:
   + NEW_API_ENDPOINT=<REQUIRED>
   + FEATURE_FLAG_X=false

📤 In .env.local but not in template:
   ~ DEBUG_MODE=true
   ~ LOCAL_OVERRIDE=value

✅ Synced 2 variables
ℹ️  2 extra variables kept (use --remove-extras to clean)
```

## Multi-Environment Sync

Sync to all environments at once:

```bash
/env-sync .env.example all
```

Updates:

- `.env.local`
- `.env.development`
- `.env.staging`
- `.env.production`
- `.env.test`
