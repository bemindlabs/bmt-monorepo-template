# Cursor Workflow Setup

This document describes the Cursor configuration setup for this monorepo.

## Configuration Files

### `.cursorrules`

The main configuration file that instructs Cursor AI on:

- Project structure and architecture
- Coding standards and conventions
- TypeScript strict mode requirements
- Build system (Turborepo) usage
- Testing patterns (Vitest)
- Git workflow and commit conventions
- Package development guidelines

**Location**: Root directory (`.cursorrules`)

### `.cursorignore`

Specifies files and directories to exclude from Cursor's context window:

- Build outputs (`dist/`, `.turbo/`, `build/`)
- Dependencies (`node_modules/`)
- Environment files with secrets
- Test coverage reports
- IDE and OS-specific files
- Generated and temporary files

**Location**: Root directory (`.cursorignore`)

## Key Features

### Monorepo Awareness

Cursor understands:

- Package structure (`@monorepo/*` namespace)
- Workspace dependencies (`workspace:*`)
- Build order (packages before apps)
- Turborepo task dependencies

### TypeScript Strict Mode

- No `any` types allowed
- Explicit return types for exported functions
- Proper type guards for `unknown` types
- Full type safety across packages

### Code Style Enforcement

- Two-space indentation
- Single quotes
- Trailing commas (ES5 style)
- 100 character line length
- Automatic import organization

### Testing Standards

- Vitest for all tests
- Test files: `*.spec.ts` or `*.test.ts`
- Coverage thresholds: 50% minimum
- Test structure in `tests/` directory

### Commit Convention

- Conventional Commits format
- Scopes: `core`, `shared`, `config`, `app`, `cli`, `infra`, `docs`, `ci`
- Lower-case subjects, max 100 chars
- Enforced by Commitlint

## Usage Tips

### When Adding New Code

1. Cursor will automatically follow TypeScript strict mode
2. Code will match existing style (Prettier formatted)
3. Imports will be organized automatically
4. Tests should be included for new features

### When Creating Packages

1. Use `@monorepo/package-name` naming
2. Extend `tsconfig.base.json`
3. Use tsup for building (ESM + CJS)
4. Add workspace dependencies as `workspace:*`

### When Making Commits

1. Use conventional commit format
2. Include appropriate scope
3. Keep subject under 100 characters
4. Pre-commit hooks will auto-format and lint

## Verification

To verify Cursor is using the configuration:

1. Open a file in Cursor
2. Ask Cursor to generate code
3. Verify it follows the rules (TypeScript strict, proper formatting, etc.)
4. Check that excluded files aren't in context

## Troubleshooting

### Cursor Not Following Rules

- Restart Cursor or reload workspace
- Check that `.cursorrules` is in root directory
- Verify file is not corrupted

### Too Much Context

- Check `.cursorignore` includes large directories
- Verify build outputs are excluded
- Consider adding more patterns if needed

### Code Style Issues

- Ensure Prettier is configured in your editor
- Run `pnpm format` to auto-format
- Check `.prettierrc` matches `.cursorrules` settings

## Related Files

- `AGENTS.md` - Repository guidelines
- `README.md` - Project overview
- `eslint.config.mjs` - ESLint configuration
- `.prettierrc` - Prettier configuration
- `commitlint.config.js` - Commit message rules
- `turbo.json` - Turborepo task configuration
