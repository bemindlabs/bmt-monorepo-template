Update and sync the GitHub wiki with current project state.

## Usage

```
/doc-wiki-sync [options]
```

## Process

1. **Update Wiki Content**
   - Scan `apps/` and `agents/` directory structure
   - Update project pages in `wiki/projects/`
   - Regenerate `wiki/_Sidebar.md`
   - Sync architecture docs with codebase

2. **Validate Changes**
   - Check all internal wiki links are valid
   - Report any broken links found
   - Show summary of changes

3. **Commit to Wiki Submodule**

   ```bash
   cd wiki
   git add -A
   git status
   git commit -m "docs(wiki): update wiki content"
   ```

4. **Push to GitHub**

   ```bash
   cd wiki
   git push origin master
   ```

   Note: GitHub wikis use `master` branch by default.

5. **Update Main Repo Submodule Reference**

   ```bash
   cd ..
   git add wiki
   git commit -m "chore: update wiki submodule reference"
   ```

## Options

| Option           | Description                                |
| ---------------- | ------------------------------------------ |
| `--dry-run`      | Show changes without committing or pushing |
| `--no-push`      | Commit locally but don't push to GitHub    |
| `--force`        | Skip validation and sync immediately       |
| `--projects`     | Only update project pages                  |
| `--architecture` | Only update architecture docs              |

## Output

After completion, display:

1. List of updated wiki pages
2. Any new pages created
3. Validation results (broken links if any)
4. Git status of wiki submodule
5. Push confirmation or dry-run summary

## Example Workflow

```bash
# Update and sync wiki (full process)
/doc-wiki-sync

# Preview changes without syncing
/doc-wiki-sync --dry-run

# Update and commit locally only
/doc-wiki-sync --no-push
```

## Error Handling

- If wiki submodule not initialized: run `git submodule update --init wiki`
- If no changes detected: skip commit, show "Wiki already up to date"
- If push fails: show error and keep local commits for manual resolution
- If links broken: warn but continue sync (use `--force` to skip validation)

## Related Commands

- `/doc-wiki` - Update wiki content only (no sync)
- `/git-submodule-update` - Update all submodules
