# Plan Team Capacity

Plan and track team capacity for sprint planning.

## Instructions

### Capacity Actions

Based on `$ARGUMENTS`, perform one of these actions:

#### `plan` (default) - Plan sprint capacity

1. Read team from `.scrum/config.json`
2. Calculate available capacity:
   - Sprint duration (days)
   - Team members
   - Holidays/PTO
   - Focus factor (typically 0.6-0.8)
3. Suggest commitment based on velocity

#### `show` - Show current capacity

1. Display team availability
2. Show capacity breakdown by member
3. Compare with historical velocity

#### `update` - Update capacity factors

1. Adjust focus factor
2. Record PTO/holidays
3. Update team member availability

### Capacity Template

Maintain `.scrum/sprints/sprint-{N}/capacity.md`:

```markdown
# Sprint {N} Capacity Planning

## Sprint Details

- **Duration:** {X} days
- **Working Days:** {Y} days (excluding weekends/holidays)
- **Team Size:** {Z} members

## Team Availability

| Member | Available Days | Focus Factor | Capacity (pts) |
| ------ | -------------- | ------------ | -------------- |
| Dev 1  | 10             | 0.7          | 7              |
| Dev 2  | 8              | 0.7          | 5.6            |

## Capacity Summary

- **Total Available Days:** {X}
- **Focus Factor:** {0.7}
- **Total Capacity:** {Y} points
- **Recommended Commitment:** {Z} points (based on velocity)

## Holidays/PTO

| Date | Member | Reason |
| ---- | ------ | ------ |

## Assumptions

- 1 story point ≈ 1 ideal day
- Focus factor accounts for meetings, support, etc.
```

## Arguments

- `$ARGUMENTS` - Action: `plan`, `show`, `update`

## Output

Display capacity planning data and recommendations.
