# Manage Product Backlog

Manage the product backlog for agile development.

## Instructions

### Backlog Actions

Based on `$ARGUMENTS`, perform one of these actions:

#### `list` - List backlog items

1. Read all items from `.scrum/backlog/`
2. Display sorted by priority
3. Show item details (ID, title, points, priority)

#### `add` - Add new backlog item

1. Create new item file: `.scrum/backlog/{id}-{slug}.md`
2. Use template:

   ```markdown
   # {Title}

   **ID:** {ITEM-XXX}
   **Type:** Feature | Bug | Tech Debt | Spike
   **Priority:** High | Medium | Low
   **Points:** {estimate}
   **Created:** {YYYY-MM-DD}

   ## Description

   As a {user}, I want {goal} so that {benefit}.

   ## Acceptance Criteria

   - [ ]

   ## Notes
   ```

#### `prioritize` - Reorder backlog

1. Update priority fields in items
2. Regenerate backlog index

#### `groom` - Groom backlog item

1. Update item details
2. Add/update acceptance criteria
3. Set/update story points

#### `remove` - Remove item from backlog

1. Archive or delete the item file

### Backlog Index

Maintain `.scrum/backlog/index.md`:

```markdown
# Product Backlog

| Priority | ID  | Title | Type | Points | Status |
| -------- | --- | ----- | ---- | ------ | ------ |
```

## Arguments

- `$ARGUMENTS` - Action: `list`, `add {title}`, `prioritize`, `groom {id}`, `remove {id}`

## Output

Execute the backlog action and show updated backlog status.
