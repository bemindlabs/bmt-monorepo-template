# Conduct Backlog Refinement

Facilitate product backlog refinement (grooming) sessions.

## Instructions

### Refinement Actions

Based on `$ARGUMENTS`, perform one of these actions:

#### `start` (default) - Start refinement session

1. Identify items needing refinement:
   - Items without story points
   - Items with unclear acceptance criteria
   - Large items needing breakdown
   - Items targeted for next 2-3 sprints
2. Create refinement session notes

#### `estimate` - Estimate backlog items

1. Use Planning Poker or similar technique
2. Apply story point scale: 1, 2, 3, 5, 8, 13, 21
3. Flag items > 13 points for splitting
4. Update item estimates

#### `split` - Split large items

1. Identify items > 13 points
2. Break into smaller, deliverable pieces
3. Ensure each piece delivers value
4. Create new backlog items

#### `criteria` - Define acceptance criteria

1. Add INVEST criteria check
2. Define clear acceptance criteria
3. Add definition of done reference

### Refinement Session Template

Create `.scrum/refinements/refinement-{date}.md`:

```markdown
# Backlog Refinement - {YYYY-MM-DD}

## Attendees

- Product Owner
- Development Team
- Scrum Master

## Items Refined

| ID      | Title     | Before      | After | Action             |
| ------- | --------- | ----------- | ----- | ------------------ |
| PBI-001 | Feature A | No estimate | 5 pts | Estimated          |
| PBI-002 | Feature B | 21 pts      | Split | Split into 3 items |

## Items Split

### PBI-002 → PBI-002a, PBI-002b, PBI-002c

- PBI-002a: {Title} - 8 pts
- PBI-002b: {Title} - 5 pts
- PBI-002c: {Title} - 5 pts

## Acceptance Criteria Added

### PBI-003

- [ ] Criterion 1
- [ ] Criterion 2

## Discussion Notes

{Key decisions and clarifications}

## Next Refinement

- Items to refine: {list}
- Scheduled: {date}
```

### INVEST Criteria

- **I**ndependent: Can be developed separately
- **N**egotiable: Details can be discussed
- **V**aluable: Delivers value to user/business
- **E**stimable: Can estimate size
- **S**mall: Fits in a sprint
- **T**estable: Clear acceptance criteria

## Arguments

- `$ARGUMENTS` - Action: `start`, `estimate`, `split {id}`, `criteria {id}`

## Output

Facilitate refinement session and update backlog items.
