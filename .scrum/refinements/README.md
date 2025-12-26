# Backlog Refinements

Track backlog refinement sessions.

## Structure

```
refinements/
├── README.md
└── refinement-YYYY-MM-DD.md    # Session notes
```

## Refinement Goals

1. Ensure backlog is ordered by priority
2. Top items are ready for upcoming sprints
3. Items have clear acceptance criteria
4. Stories are properly sized (≤13 points)
5. Team understands the work

## INVEST Criteria

Good user stories are:

- **I**ndependent: Can be developed separately
- **N**egotiable: Details can be discussed
- **V**aluable: Delivers value to user/business
- **E**stimable: Can estimate size
- **S**mall: Fits in a sprint
- **T**estable: Clear acceptance criteria

## Story Point Scale

| Points | Complexity | Example          |
| ------ | ---------- | ---------------- |
| 1      | Trivial    | Config change    |
| 2      | Simple     | Bug fix          |
| 3      | Small      | Simple feature   |
| 5      | Medium     | Standard feature |
| 8      | Large      | Complex feature  |
| 13     | Very Large | Major feature    |
| 21     | Epic       | Should be split  |

## Commands

- `/scrum-refinement start` - Begin session
- `/scrum-refinement estimate` - Estimate items
- `/scrum-refinement split <id>` - Split large items
- `/scrum-refinement criteria <id>` - Add acceptance criteria
