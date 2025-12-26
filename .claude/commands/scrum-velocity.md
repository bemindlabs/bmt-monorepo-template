# Track Team Velocity

Track and analyze team velocity across sprints for capacity planning.

## Instructions

### Velocity Actions

Based on `$ARGUMENTS`, perform one of these actions:

#### `show` (default) - Display velocity metrics

1. Read completed sprints from `.scrum/sprints/`
2. Calculate velocity for each sprint
3. Display:
   - Velocity per sprint (story points completed)
   - Average velocity (last 3-5 sprints)
   - Velocity trend (increasing/stable/decreasing)
   - Commitment vs completion ratio

#### `history` - Show velocity history

1. List all completed sprints with velocity
2. Show velocity chart data
3. Calculate standard deviation

#### `forecast` - Forecast future capacity

1. Based on average velocity
2. Suggest sustainable commitment for next sprint
3. Project backlog completion timeline

### Velocity Tracking File

Maintain `.scrum/metrics/velocity.md`:

```markdown
# Velocity Tracking

## Summary

- **Average Velocity:** {X} points/sprint
- **Last Sprint:** {Y} points
- **Trend:** {Increasing|Stable|Decreasing}

## Sprint History

| Sprint | Committed | Completed | Velocity | Ratio |
| ------ | --------- | --------- | -------- | ----- |

## Velocity Chart
```

Sprint 1: ████████░░ 8/10
Sprint 2: █████████░ 9/10
Sprint 3: ██████████ 10/10

```

```

## Arguments

- `$ARGUMENTS` - Action: `show`, `history`, `forecast`

## Output

Display velocity metrics and recommendations for sprint planning.
