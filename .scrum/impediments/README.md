# Impediments

Track blockers and impediments affecting the team.

## Structure

```
impediments/
├── README.md
├── board.md           # Impediment board overview
└── IMP-XXX-*.md       # Individual impediment files
```

## Impediment Lifecycle

1. **Open** - Impediment identified
2. **In Progress** - Being worked on
3. **Escalated** - Requires external help
4. **Resolved** - Fixed and documented

## Severity Levels

| Level    | Description           | Response Time |
| -------- | --------------------- | ------------- |
| Critical | Blocks sprint goal    | Immediate     |
| High     | Blocks multiple items | Same day      |
| Medium   | Slows progress        | 2-3 days      |
| Low      | Minor inconvenience   | Sprint end    |

## Commands

- `/scrum-impediment list` - View all impediments
- `/scrum-impediment add <title>` - Add new impediment
- `/scrum-impediment resolve <id>` - Mark resolved
- `/scrum-impediment escalate <id>` - Escalate issue
