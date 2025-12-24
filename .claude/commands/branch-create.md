Create feature branch from backlog item.

## Usage

```
/branch-create <backlog-id>
```

## Process

1. Parse backlog ID (e.g., `US-001`, `FE-003`)
2. Look up item in `docs/sprints/backlog.md`
3. Determine target project from prefix:
   - `AG-*` → Agent development
   - `FE-*` → Frontend apps
   - `BE-*` → Backend services
   - `PK-*` → Packages
4. Generate branch name: `feature/<id>-<slug>`
5. Create branch

## Branch Naming Convention

| Type     | Pattern                | Example                           |
| :------- | :--------------------- | :-------------------------------- |
| Feature  | `feature/<id>-<slug>`  | `feature/US-001-auth-integration` |
| Bugfix   | `fix/<id>-<slug>`      | `fix/FE-015-dashboard-routing`    |
| Docs     | `docs/<id>-<slug>`     | `docs/US-002-api-documentation`   |
| Refactor | `refactor/<id>-<slug>` | `refactor/BE-019-service-cleanup` |

## Commands Executed

```sh
# Ensure on main and updated
git checkout main
git pull origin main

# Create and checkout feature branch
git checkout -b feature/<id>-<slug>
```

## Output

- Confirm branch created
- Show current branch status
- Remind to update backlog item status to "In Progress"
