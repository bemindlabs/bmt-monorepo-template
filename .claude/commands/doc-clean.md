---
description: Clean and organize documentation by project standards
---

## Role

Documentation Cleanup Agent - Enforce project documentation standards

## Task

Audit and clean documentation files to comply with CLAUDE.md standards.

## Standards Reference

### Root Directory Rules

**Allowed files only**:

- `README.md`, `CLAUDE.md`, `CONTRIBUTING.md`, `CHANGELOG.md`, `SECURITY.md`, `LICENSE`
- `.plan.md` (active planning)

**NEVER in root**:

- Session summaries → `docs/archive/project/sessions-YYYY-MM-DD/`
- Implementation reports → `docs/archive/development/sessions-YYYY-MM-DD/`

### Naming Conventions

| Location       | Convention                     | Example              |
| -------------- | ------------------------------ | -------------------- |
| `docs/`        | `UPPERCASE_UNDERSCORE.md`      | `API_REFERENCE.md`   |
| `docs/guides/` | `UPPERCASE_UNDERSCORE.md`      | `GETTING_STARTED.md` |
| Apps/packages  | `kebab-case.md` or `README.md` | `readme.md`          |

### Archive Structure

```
docs/archive/
├── project/sessions-YYYY-MM-DD/     # Daily scrums, diaries
├── development/sessions-YYYY-MM-DD/ # Implementation reports
└── retrospectives/                   # Sprint retros
```

## Process

1. **Scan Root Directory**

   ```bash
   ls -la *.md 2>/dev/null | grep -v -E "^(README|CLAUDE|CONTRIBUTING|CHANGELOG|SECURITY|LICENSE|\.plan)\.md$"
   ```

2. **Check docs/ Naming**

   ```bash
   find docs -maxdepth 2 -name "*.md" -type f | grep -v "UPPERCASE" | head -20
   ```

3. **Find Misplaced Files**
   - Session files in wrong locations
   - Duplicate documentation
   - Orphaned markdown files

4. **Execute Cleanup**
   - Move files to correct locations
   - Rename to correct convention
   - Remove duplicates (keep newest)
   - Archive outdated content

## Cleanup Actions

### Move Misplaced Files

```bash
# Session files to archive
mv *_SESSION*.md docs/archive/project/sessions-$(date +%Y-%m-%d)/
mv *DIARY*.md docs/archive/project/sessions-$(date +%Y-%m-%d)/
mv *SCRUM*.md docs/archive/project/sessions-$(date +%Y-%m-%d)/
```

### Rename to Standard

```bash
# lowercase to UPPERCASE in docs/
# Example: api-reference.md → API_REFERENCE.md
```

### Remove Duplicates

- Compare file content with `diff`
- Keep file with most recent modification
- Log removed files

## Output Report

```markdown
# Documentation Cleanup Report - YYYY-MM-DD

## Summary

| Action             | Count |
| ------------------ | ----- |
| Files Moved        | X     |
| Files Renamed      | X     |
| Duplicates Removed | X     |
| Errors             | X     |

## Changes Made

### Moved Files

- `old/path/file.md` → `new/path/FILE.md`

### Renamed Files

- `docs/api-guide.md` → `docs/API_GUIDE.md`

### Removed Duplicates

- `docs/old-readme.md` (duplicate of README.md)

### Errors/Warnings

- [Any issues encountered]

## Verification

- [ ] No .md files in root except allowed
- [ ] All docs/ files use UPPERCASE_UNDERSCORE
- [ ] Archive structure correct
- [ ] No orphaned documentation
```

## Safety Rules

1. **Never delete without confirmation** for files > 100 lines
2. **Create backup** before bulk operations
3. **Log all changes** for audit trail
4. **Skip** files in `node_modules/`, `.git/`, `dist/`

## Usage

```bash
/doc-clean
```

## Related

- [CLAUDE.md](../../CLAUDE.md) - Project standards
- [Documentation Index](../../docs/DOCUMENTATION_INDEX.md)
