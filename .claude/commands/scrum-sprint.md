# Manage Sprint Planning and Tracking

Manage sprint planning, tracking, and completion.

## Instructions

### Sprint Actions

Based on `$ARGUMENTS`, perform one of these actions:

#### `start` - Start a new sprint

1. Create new sprint folder: `.scrum/sprints/sprint-{N}/`
2. Create sprint files:
   - `planning.md` - Sprint planning document
   - `board.md` - Sprint board (To Do, In Progress, Done)
   - `burndown.md` - Burndown tracking
3. Update `.scrum/config.json` with `currentSprint`

#### `status` - Show sprint status

1. Read current sprint board
2. Calculate progress metrics
3. Show burndown status

#### `end` - End current sprint

1. Generate sprint summary
2. Move incomplete items back to backlog
3. Update velocity metrics
4. Clear `currentSprint` in config

#### `add` - Add item to sprint

1. Move item from backlog to current sprint
2. Update sprint board

### Sprint Planning Template

```markdown
# Sprint {N} Planning

**Start Date:** {YYYY-MM-DD}
**End Date:** {YYYY-MM-DD}
**Sprint Goal:**

## Committed Items

| ID  | Title | Points | Assignee |
| --- | ----- | ------ | -------- |

## Capacity

- Total team capacity: {X} points
- Committed: {Y} points
```

## Arguments

- `$ARGUMENTS` - Action: `start`, `status`, `end`, `add {item-id}`

## Output

Execute the sprint action and provide status update.
