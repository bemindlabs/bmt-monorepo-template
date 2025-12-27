---
description: Fix environment file issues automatically
allowed-tools: Read, Edit, Write
argument-hint: [file]
---

Automatically fix common environment file issues.

## Usage

```
/env-fix [file]
```

**Default:** Fixes `.env.local`

## Process

1. Run `/env-check` to identify issues
2. For each issue type:
   - **Missing vars**: Add from template with placeholder
   - **Empty values**: Prompt for value or add placeholder
   - **Duplicate vars**: Keep first occurrence, remove duplicates
   - **Format errors**: Fix syntax (trim spaces, add quotes if needed)
   - **Sort**: Optionally sort alphabetically

## Fixes Applied

| Issue            | Fix                                                   |
| ---------------- | ----------------------------------------------------- |
| Missing variable | Add from `.env.example` with `<REQUIRED>` placeholder |
| Empty value      | Add `<REQUIRED>` placeholder                          |
| Trailing spaces  | Trim whitespace                                       |
| Missing newline  | Add final newline                                     |
| Duplicate key    | Remove duplicate, keep first                          |
| Invalid syntax   | Fix `KEY = value` → `KEY=value`                       |

## Example

```bash
# Fix .env.local
/env-fix

# Fix staging env
/env-fix .env.staging
```

## Output

```
Environment Fix: .env.local
────────────────────────────────
✅ Added missing: DATABASE_URL
✅ Added missing: REDIS_URL
✅ Fixed empty: API_SECRET → <REQUIRED>
✅ Removed duplicate: NODE_ENV (line 15)
✅ Fixed syntax: API_KEY = xxx → API_KEY=xxx

Fixed 5 issues. Please review and update <REQUIRED> placeholders.
```

## After Fixing

1. Review changes with `git diff`
2. Replace `<REQUIRED>` placeholders with actual values
3. Run `/env-check` to verify
