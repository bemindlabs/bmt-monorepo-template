# Manage Sprint Goal

Set, track, and evaluate sprint goals.

## Instructions

### Goal Actions

Based on `$ARGUMENTS`, perform one of these actions:

#### `show` (default) - Display current sprint goal

1. Read current sprint goal
2. Show goal achievement status
3. List items contributing to goal

#### `set` - Set sprint goal

1. Define clear, measurable sprint goal
2. Ensure goal is:
   - Specific and focused
   - Achievable within sprint
   - Valuable to stakeholders
   - Measurable
3. Update sprint planning document

#### `evaluate` - Evaluate goal achievement

1. Assess goal completion at sprint end
2. Calculate achievement percentage
3. Document lessons learned

### Sprint Goal Guidelines

A good sprint goal should:

- **Be singular:** One clear objective
- **Be valuable:** Deliver business/user value
- **Be achievable:** Completable within sprint
- **Be measurable:** Clear success criteria
- **Guide decisions:** Help prioritize during sprint

### Goal Template

In `.scrum/sprints/sprint-{N}/planning.md`:

```markdown
## Sprint Goal

**Goal:** {Clear, concise goal statement}

**Success Criteria:**

- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

**Value Delivered:** {Why this goal matters}

**Key Results:**

- KR1: {Measurable outcome}
- KR2: {Measurable outcome}

## Goal Achievement (End of Sprint)

- **Status:** {Achieved|Partially Achieved|Not Achieved}
- **Achievement:** {X}%
- **Notes:** {What worked, what didn't}
```

## Arguments

- `$ARGUMENTS` - Action: `show`, `set {goal}`, `evaluate`

## Output

Display or update sprint goal information.
