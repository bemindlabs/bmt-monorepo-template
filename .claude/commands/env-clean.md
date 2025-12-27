---
description: Clean up environment files and remove sensitive data
allowed-tools: Read, Edit, Bash(rm:*)
argument-hint: [action]
---

Clean environment files by removing sensitive data or unused variables.

## Usage

```
/env-clean [action]
```

**Actions:** `secrets`, `unused`, `duplicates`, `all`

## Actions

### `secrets` - Remove Sensitive Values

Replace actual secrets with placeholders:

```bash
/env-clean secrets
```

Detects and masks:

- API keys (patterns: `*_KEY`, `*_SECRET`, `*_TOKEN`)
- Passwords (`*_PASSWORD`, `*_PASS`)
- Private keys (multiline PEM content)
- Connection strings with credentials

### `unused` - Remove Unused Variables

Remove variables not referenced in code:

```bash
/env-clean unused
```

Scans `apps/`, `packages/` for `process.env.*` references.

### `duplicates` - Remove Duplicate Definitions

Remove duplicate variable definitions:

```bash
/env-clean duplicates
```

Keeps first occurrence of each variable.

### `all` - Full Cleanup

Run all cleanup actions:

```bash
/env-clean all
```

## Example Output

```
Environment Clean: .env.local
────────────────────────────────
Action: secrets

🔐 Masked sensitive values:
   - API_KEY: sk-abc...xyz → <API_KEY>
   - DB_PASSWORD: mypass123 → <PASSWORD>
   - JWT_SECRET: verysecret → <SECRET>

✅ Cleaned 3 sensitive values
⚠️  Remember to store actual values securely!
```

## Safety

- Creates backup before cleaning: `.env.local.backup`
- Never deletes `.env.example`
- Prompts before removing variables
