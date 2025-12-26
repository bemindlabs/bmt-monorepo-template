# Scrum Metrics Dashboard

Display comprehensive Scrum metrics and team performance indicators.

## Instructions

### Metrics Actions

Based on `$ARGUMENTS`, perform one of these actions:

#### `show` (default) - Display metrics dashboard

1. Gather all metrics from `.scrum/`
2. Calculate key indicators
3. Display comprehensive dashboard

#### `velocity` - Focus on velocity metrics

1. Show velocity trends
2. Calculate averages
3. Display forecast

#### `quality` - Focus on quality metrics

1. Show defect rates
2. Display DoD compliance
3. Track technical debt

#### `health` - Team health indicators

1. Sprint completion rates
2. Scope change frequency
3. Impediment resolution time

### Metrics Dashboard Template

Maintain `.scrum/metrics/dashboard.md`:

```markdown
# Scrum Metrics Dashboard

**Generated:** {YYYY-MM-DD HH:MM}
**Sprint:** {current sprint}

## Velocity Metrics

| Metric              | Value   | Trend |
| ------------------- | ------- | ----- |
| Current Velocity    | {X} pts | ↑/↓/→ |
| Average Velocity    | {Y} pts |       |
| Commitment Accuracy | {Z}%    | ↑/↓/→ |

## Sprint Health

| Metric        | Current  | Target   | Status |
| ------------- | -------- | -------- | ------ |
| Burndown      | On Track | On Track | ✅     |
| Scope Changes | 2        | 0        | ⚠️     |
| Impediments   | 1 open   | 0        | ⚠️     |

## Quality Metrics

| Metric          | Value | Target | Status |
| --------------- | ----- | ------ | ------ |
| Test Coverage   | 82%   | 80%    | ✅     |
| Bugs Found      | 3     | <5     | ✅     |
| Tech Debt Items | 5     | <10    | ✅     |

## Backlog Health

| Metric           | Value | Status |
| ---------------- | ----- | ------ |
| Total Items      | 47    |        |
| Refined Items    | 35    | 74%    |
| Ready for Sprint | 20    | Good   |
| Story Points     | 299   |        |

## Sprint History

| Sprint   | Velocity | Committed | Completed | Goal Met |
| -------- | -------- | --------- | --------- | -------- |
| Sprint 1 | 21       | 25        | 21        | ✅       |
| Sprint 2 | 24       | 24        | 24        | ✅       |
| Sprint 3 | 22       | 26        | 22        | ⚠️       |

## Trends

### Velocity Trend (Last 5 Sprints)
```

30 |
25 | ▄▄ ▄▄
20 | ▄▄ ▄▄ ▄▄
15 |
10 |
5 |
| S1 S2 S3 S4 S5

```

### Completion Rate
- Last Sprint: 85%
- Average: 88%
- Best: 100% (Sprint 2)

## Action Items

Based on metrics:
1. {Recommendation 1}
2. {Recommendation 2}
```

### Key Performance Indicators (KPIs)

| KPI                     | Description                 | Target            |
| ----------------------- | --------------------------- | ----------------- |
| Velocity                | Points completed per sprint | Stable/Increasing |
| Commitment Accuracy     | Completed/Committed ratio   | >85%              |
| Sprint Goal Achievement | Goals met                   | 100%              |
| Cycle Time              | Time from start to done     | Decreasing        |
| Escaped Defects         | Bugs found post-release     | 0                 |

## Arguments

- `$ARGUMENTS` - Action: `show`, `velocity`, `quality`, `health`

## Output

Display comprehensive metrics dashboard.
