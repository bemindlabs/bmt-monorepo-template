# Scrum Metrics

Track team performance and process health.

## Structure

```
metrics/
├── README.md
├── dashboard.md       # Main metrics dashboard
└── velocity.md        # Velocity tracking
```

## Key Metrics

### Velocity Metrics

- **Velocity:** Story points completed per sprint
- **Average Velocity:** Rolling average (last 5 sprints)
- **Commitment Accuracy:** Completed/Committed ratio

### Sprint Health

- **Burndown:** Progress vs ideal
- **Scope Changes:** Items added/removed mid-sprint
- **Impediments:** Open blockers

### Quality Metrics

- **Test Coverage:** Percentage of code covered
- **Defects:** Bugs found per sprint
- **Tech Debt:** Outstanding technical debt items

## Commands

- `/scrum-metrics show` - Full dashboard
- `/scrum-metrics velocity` - Velocity focus
- `/scrum-metrics quality` - Quality focus
- `/scrum-metrics health` - Health indicators
