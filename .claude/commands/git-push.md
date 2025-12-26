# Push and Fetch All

Push local changes and fetch updates from all remotes.

## Instructions

### Default Action (Push Current Branch)

1. **Check Current Status**

   ```bash
   git status
   git log --oneline origin/$(git branch --show-current)..HEAD
   ```

2. **Run Pre-push Checks**

   ```bash
   pnpm lint && pnpm type-check && pnpm test
   ```

3. **Push Current Branch**

   ```bash
   git push -u origin $(git branch --show-current)
   ```

### Actions Based on Arguments

#### `all` - Push all branches

```bash
git push --all origin
```

#### `tags` - Push all tags

```bash
git push --tags origin
```

#### `fetch` - Fetch from all remotes

```bash
git fetch --all --prune
```

#### `sync` - Full sync (fetch + push)

```bash
git fetch --all --prune
git push -u origin $(git branch --show-current)
```

#### `force` - Force push (use with caution)

```bash
git push --force-with-lease origin $(git branch --show-current)
```

### Pre-push Verification

Before pushing, verify:

- [ ] All tests pass
- [ ] No lint errors
- [ ] No type errors
- [ ] Build succeeds
- [ ] No uncommitted changes

### Useful Commands

```bash
# Show what will be pushed
git log origin/main..HEAD --oneline

# Push and set upstream
git push -u origin <branch>

# Push specific branch
git push origin <branch>

# Push all branches
git push --all origin

# Push all tags
git push --tags

# Fetch all remotes
git fetch --all

# Fetch and prune deleted branches
git fetch --all --prune

# Force push with safety (prevents overwriting others' work)
git push --force-with-lease

# Delete remote branch
git push origin --delete <branch>
```

### Remote Management

```bash
# List remotes
git remote -v

# Add remote
git remote add <name> <url>

# Update remote URL
git remote set-url origin <new-url>

# Prune stale remote branches
git remote prune origin
```

## Arguments

- `$ARGUMENTS` - Action: (empty for current branch), `all`, `tags`, `fetch`, `sync`, `force`

## Output

1. Show current branch and pending commits
2. Run verification checks
3. Execute push/fetch operation
4. Display result and remote status
