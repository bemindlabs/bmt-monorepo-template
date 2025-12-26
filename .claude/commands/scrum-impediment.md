# Track Impediments

Track and manage impediments (blockers) affecting the team.

## Instructions

### Impediment Actions

Based on `$ARGUMENTS`, perform one of these actions:

#### `list` (default) - List all impediments

1. Read from `.scrum/impediments/`
2. Show active impediments by severity
3. Display resolution status

#### `add` - Add new impediment

1. Create impediment file
2. Classify severity (Critical, High, Medium, Low)
3. Assign owner for resolution
4. Link affected items

#### `resolve` - Mark impediment resolved

1. Update impediment status
2. Document resolution
3. Add to lessons learned

#### `escalate` - Escalate impediment

1. Mark for escalation
2. Identify escalation path
3. Add urgency notes

### Impediment Template

Create `.scrum/impediments/IMP-{XXX}-{slug}.md`:

```markdown
# IMP-{XXX}: {Title}

**Status:** Open | In Progress | Resolved | Escalated
**Severity:** Critical | High | Medium | Low
**Raised By:** {name}
**Raised Date:** {YYYY-MM-DD}
**Owner:** {name responsible for resolution}

## Description

{Detailed description of the impediment}

## Impact

- **Affected Items:** PBI-001, PBI-002
- **Sprint Impact:** {Describe impact on sprint goal}
- **Team Impact:** {Describe impact on team productivity}

## Root Cause

{Analysis of why this impediment exists}

## Resolution Plan

1. Step 1
2. Step 2
3. Step 3

## Timeline

| Date       | Action | Status |
| ---------- | ------ | ------ |
| YYYY-MM-DD | Raised | Open   |

## Resolution (when resolved)

**Resolved Date:** {YYYY-MM-DD}
**Resolution:** {How it was resolved}
**Prevention:** {How to prevent recurrence}
```

### Impediment Board

Maintain `.scrum/impediments/board.md`:

```markdown
# Impediment Board

## Critical/Blocking

| ID  | Title | Days Open | Owner |
| --- | ----- | --------- | ----- |

## High Priority

| ID  | Title | Days Open | Owner |
| --- | ----- | --------- | ----- |

## In Progress

| ID  | Title | Started | Owner |
| --- | ----- | ------- | ----- |

## Recently Resolved

| ID  | Title | Resolved | Resolution |
| --- | ----- | -------- | ---------- |
```

## Arguments

- `$ARGUMENTS` - Action: `list`, `add {title}`, `resolve {id}`, `escalate {id}`

## Output

Display impediment status or update impediment tracking.
