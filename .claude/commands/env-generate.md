---
description: Generate environment files from templates
allowed-tools: Read, Write, Bash(cp:*), Bash(cat:*)
argument-hint: [environment]
---

Generate environment files from `.env.example` template.

## Usage

```
/env-generate [environment]
```

**Environments:** `development`, `staging`, `production`, `test`

## Process

1. Read `.env.example` as template
2. If environment specified, create `.env.[environment]`
3. If no environment, create `.env.local`
4. Prompt for required values (API keys, secrets)
5. Never commit actual secrets - use placeholders

## Template Variables

Replace these placeholders with actual values:

| Placeholder      | Description                   |
| ---------------- | ----------------------------- |
| `<your-api-key>` | API key from service provider |
| `<your-secret>`  | Secret key for encryption     |
| `<database-url>` | Database connection string    |
| `<redis-url>`    | Redis connection URL          |

## Output Files

```
.env.local           # Local development (gitignored)
.env.development     # Development environment
.env.staging         # Staging environment
.env.production      # Production environment
.env.test            # Test environment
```

## Example

```bash
# Generate local development env
/env-generate

# Generate staging env file
/env-generate staging
```

## Security Notes

- Never commit `.env.local` or files with real secrets
- Use `.env.example` to document required variables
- Store production secrets in vault/secrets manager
