# Manage Scrum Team

Manage Scrum team roles, members, and responsibilities.

## Instructions

### Team Actions

Based on `$ARGUMENTS`, perform one of these actions:

#### `show` (default) - Display team information

1. Read team from `.scrum/team.md`
2. Show roles and responsibilities
3. Display current capacity

#### `add` - Add team member

1. Add member to team roster
2. Assign role
3. Update capacity calculations

#### `remove` - Remove team member

1. Remove from roster
2. Reassign responsibilities
3. Update capacity

#### `roles` - Show Scrum roles

1. Display role definitions
2. Show current assignments

### Scrum Roles

#### Product Owner

- Owns product backlog
- Prioritizes work
- Defines acceptance criteria
- Accepts/rejects completed work

#### Scrum Master

- Facilitates Scrum events
- Removes impediments
- Coaches team on Scrum
- Protects team from distractions

#### Development Team

- Self-organizing
- Cross-functional
- Delivers increment each sprint
- Owns technical decisions

### Team Template

Create/maintain `.scrum/team.md`:

```markdown
# Scrum Team

**Team Name:** {name}
**Formed:** {YYYY-MM-DD}

## Roles

### Product Owner

- **Name:** {name}
- **Contact:** {email}
- **Responsibilities:** Product vision, backlog prioritization

### Scrum Master

- **Name:** {name}
- **Contact:** {email}
- **Responsibilities:** Process facilitation, impediment removal

### Development Team

| Name  | Role/Skills | Capacity | Contact |
| ----- | ----------- | -------- | ------- |
| Dev 1 | Full-stack  | 1.0 FTE  | email   |
| Dev 2 | Frontend    | 0.5 FTE  | email   |

## Team Agreements

### Working Hours

- Core hours: 10:00 - 16:00
- Timezone: {timezone}

### Communication

- Daily standup: {time}
- Primary channel: {Slack/Teams/etc.}
- Response time: {X hours}

### Code Review

- PRs reviewed within {X hours}
- Minimum {N} approvals required

## Team Capacity

- **Total FTE:** {X}
- **Focus Factor:** {0.7}
- **Sprint Capacity:** {Y} points

## Skills Matrix

| Skill      | Dev 1 | Dev 2 | Dev 3 |
| ---------- | ----- | ----- | ----- |
| TypeScript | ★★★   | ★★    | ★★★   |
| React      | ★★    | ★★★   | ★★    |
| Node.js    | ★★★   | ★     | ★★    |
```

## Arguments

- `$ARGUMENTS` - Action: `show`, `add {name}`, `remove {name}`, `roles`

## Output

Display team information or update team roster.
