# Guides

General guides and workflows for development.

## Available Guides

| Guide                               | Description                  |
| ----------------------------------- | ---------------------------- |
| [Work Diary](work-diary.md)         | End-of-day AI work summaries |
| [Daily Workflow](daily-workflow.md) | Recommended daily routine    |
| [Documentation](documentation.md)   | Creating and managing docs   |

## Work Diary

Generate end-of-day AI agent work diary.

### Command

```bash
/work-diary
```

### Schedule

**Time**: End of day (configurable)
**Frequency**: Daily (workdays)

### Output

Creates `docs/archive/project/sessions-YYYY-MM-DD/DAILY_DIARY.md`:

```markdown
# AI Agent Daily Diary - YYYY-MM-DD

## Work Summary

- **Work Hours**: 09:00 - 22:00 (local time)
- **Agent(s)**: Claude Opus 4.5

## Tasks Completed

- [x] Task 1 - Description
- [x] Task 2 - Description
- [ ] Task 3 - Incomplete (reason)

## Code Changes

- **Files created**: X
- **Files modified**: X
- **Lines added**: +X
- **Lines removed**: -X

## Commits Made

| Hash    | Message                  |
| ------- | ------------------------ |
| abc1234 | feat(scope): description |

## Key Accomplishments

1. Major accomplishment 1
2. Major accomplishment 2

## Tomorrow's Plan

1. Priority task for next day
2. Follow-up items
```

## Daily Workflow

### Morning (09:00)

```bash
# Generate standup report
/scrum-standup

# Check sprint status
/scrum-sprint status
```

### During Development

```bash
# Create feature branch
/branch-create US-001

# Auto-commit changes
/git-commit

# Check git status
/git-status
```

### Evening (22:00)

```bash
# Generate work diary
/work-diary
```

## Documentation Commands

| Command         | Description                   |
| --------------- | ----------------------------- |
| `/doc-create`   | Create new documentation file |
| `/doc-generate` | Auto-generate docs from code  |
| `/doc-index`    | Generate/update doc index     |
| `/doc-clean`    | Clean and organize docs       |
| `/doc-wiki`     | Update GitHub wiki            |

### /doc-create

Create a new documentation file following project standards.

```bash
/doc-create <doc-name>
```

### /doc-generate

Auto-generate documentation from code implementation.

```bash
/doc-generate [target-path]
```

### /doc-index

Generate or update the documentation index.

```bash
/doc-index
```

### /doc-clean

Clean and organize documentation by project standards.

```bash
/doc-clean
```

### /doc-wiki

Update the GitHub wiki at `wiki/` to reflect current project state.

```bash
/doc-wiki
```

## Automation

### Cron Schedule

```bash
# Daily standup at 09:00
0 9 * * 1-5 cd /path/to/project && /scrum-standup

# Work diary at 22:00
0 22 * * 1-5 cd /path/to/project && /work-diary

# Sprint review Friday 15:00
0 15 * * 5 cd /path/to/project && /scrum-review
```

## Best Practices

1. **Consistent schedule** - Run commands at same time daily
2. **Archive sessions** - Keep historical records
3. **Review metrics** - Track progress over time
4. **Update docs** - Keep documentation current
5. **Celebrate wins** - Acknowledge accomplishments
