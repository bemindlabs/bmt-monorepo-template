# Cursor Configuration

This directory contains Cursor-specific configuration files for the monorepo.

## Files

- `.cursorrules` - Main rules file for Cursor AI assistant behavior
- `.cursorignore` - Files and directories to exclude from Cursor context

## Configuration Overview

### .cursorrules

Comprehensive rules covering:

- Project structure and monorepo architecture
- TypeScript strict mode guidelines
- Code style and formatting (ESLint, Prettier)
- Build system (Turborepo, tsup)
- Testing patterns (Vitest)
- Git workflow and commit conventions
- Package development guidelines
- Infrastructure setup

### .cursorignore

Excludes from Cursor context:

- Build outputs (`dist/`, `.turbo/`, etc.)
- Dependencies (`node_modules/`)
- Environment files with secrets
- Test coverage reports
- IDE and OS-specific files
- Generated and temporary files

## Usage

Cursor will automatically use these configuration files when working in this repository. The AI assistant will:

- Follow the coding standards defined in `.cursorrules`
- Exclude files listed in `.cursorignore` from context
- Understand the monorepo structure and package dependencies
- Generate code that matches the project's conventions

## Customization

To customize Cursor behavior for this project:

1. Edit `.cursorrules` to add or modify rules
2. Update `.cursorignore` to exclude additional files
3. Restart Cursor or reload the workspace to apply changes

## Related Documentation

- `AGENTS.md` - Repository guidelines and coding standards
- `README.md` - Project overview and setup
- `docs/` - Detailed documentation
- `CONTRIBUTING.md` - Contribution guidelines
