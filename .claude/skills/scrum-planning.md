# Sprint Planning

AI-assisted sprint planning and workflow suggestions.

## Usage

```
/scrum-planning [action] [topic]
```

## Actions

### `suggest` - AI Workflow Suggestions

Analyze the request and suggest backlog items for implementation:

```
/scrum-planning suggest <topic>
```

Example topics:

- `ai coding automation` - AI-powered development workflows
- `github integration` - GitHub Actions, Issues, Projects
- `devops pipeline` - CI/CD and deployment automation
- `security hardening` - Security features and compliance

### `plan` - Sprint Planning

1. Read current sprint capacity from `.scrum/config.json`
2. Analyze backlog items from `.scrum/backlog/`
3. Suggest sprint scope based on:
   - Team velocity
   - Priority ordering
   - Dependencies
   - Capacity constraints

### `scope` - Scope Assessment

Analyze a feature request and break it into backlog items:

1. Parse the feature description
2. Identify components/packages affected
3. Estimate story points
4. Create PBI files in `.scrum/backlog/`
5. Update backlog index

### `sync` - Sync to GitHub

Synchronize local backlog with GitHub:

1. Create GitHub Issues for new PBIs
2. Update issue labels and milestones
3. Link to GitHub Projects
4. Sync status changes bidirectionally

```bash
# Create issue from PBI
gh issue create --title "PBI-XXX: Title" \
  --body "$(cat .scrum/backlog/PBI-XXX-slug.md)" \
  --label "feature,priority:high"

# Update PBI with issue number
# Add **GitHub Issue:** #XXX to PBI file
```

## AI Automation Workflow Items

The following workflow has been added to the backlog:

| ID      | Title                      | Points | Priority |
| ------- | -------------------------- | ------ | -------- |
| PBI-048 | AI Code Review Actions     | 8      | High     |
| PBI-049 | AI Issue Triage            | 5      | High     |
| PBI-050 | AI PR Description          | 5      | Medium   |
| PBI-051 | AI Test Generation         | 13     | High     |
| PBI-052 | AI Wiki Sync               | 8      | Medium   |
| PBI-053 | GitHub Projects Automation | 8      | Medium   |
| PBI-054 | Claude Code Workflow       | 13     | High     |
| PBI-055 | AI Commit Assistant        | 3      | Medium   |

## Implementation Order

Recommended implementation sequence:

1. **Foundation** (Sprint 1)
   - PBI-055: AI Commit Assistant (3 pts) - Quick win
   - PBI-049: AI Issue Triage (5 pts) - Immediate value

2. **Core Automation** (Sprint 2)
   - PBI-048: AI Code Review (8 pts) - High impact
   - PBI-050: AI PR Description (5 pts) - Developer productivity

3. **Advanced Features** (Sprint 3)
   - PBI-051: AI Test Generation (13 pts) - Quality improvement
   - PBI-052: AI Wiki Sync (8 pts) - Documentation

4. **Integration** (Sprint 4)
   - PBI-053: GitHub Projects Automation (8 pts) - Project management
   - PBI-054: Claude Code Workflow (13 pts) - Full integration

## Output

Display planning results and next steps.
