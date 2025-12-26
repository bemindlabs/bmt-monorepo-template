# Generate Burndown Chart

Generate and update sprint burndown/burnup charts for progress tracking.

## Instructions

### Burndown Actions

Based on `$ARGUMENTS`, perform one of these actions:

#### `show` (default) - Display current burndown

1. Read current sprint data from `.scrum/sprints/sprint-{N}/`
2. Calculate ideal burndown line
3. Calculate actual burndown
4. Display burndown chart in ASCII/text format
5. Show variance from ideal

#### `update` - Update burndown data

1. Recalculate remaining work
2. Update `.scrum/sprints/sprint-{N}/burndown.md`
3. Add today's data point

#### `burnup` - Show burnup chart

1. Display work completed over time
2. Show scope changes
3. Track total vs completed

### Burndown Template

Maintain `.scrum/sprints/sprint-{N}/burndown.md`:

```markdown
# Sprint {N} Burndown

**Sprint Goal:** {goal}
**Total Points:** {X}
**Days Remaining:** {Y}

## Daily Progress

| Day | Date       | Remaining | Completed | Notes |
| --- | ---------- | --------- | --------- | ----- |
| 1   | YYYY-MM-DD | 40        | 0         |       |
| 2   | YYYY-MM-DD | 35        | 5         |       |

## Burndown Chart
```

Points
40 |_
35 | _---_
30 | \
 25 | _
20 | \
 15 | _
10 | \
 5 | _
0 |******\_******\*\_\_\_\_
1 2 3 4 5 6 Days

Legend: \* Actual --- Ideal

```

## Status

- **On Track:** {Yes|No|At Risk}
- **Projection:** {Complete by Day X | Need Y more days}
```

## Arguments

- `$ARGUMENTS` - Action: `show`, `update`, `burnup`

## Output

Display burndown chart and sprint progress status.
