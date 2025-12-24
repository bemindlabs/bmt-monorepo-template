Update the GitHub wiki at `wiki/` to reflect current project state.

## Process

1. **Scan Projects**
   - Read `apps/` and `agents/` directory structure
   - Identify all projects and agents
   - Check each project's README.md and package.json/pyproject.toml

2. **Update Project Pages**

   For each project in `apps/`:
   - Update or create `wiki/projects/<project-name>.md`
   - Extract description, stack, status from project files
   - Include key features and configuration options

3. **Update Sidebar**
   - Regenerate `wiki/_Sidebar.md` based on existing wiki pages
   - Organize by category (Getting Started, Architecture, Projects, Guides, Operations, References)
   - Ensure all wiki pages are linked

4. **Update Architecture Docs**
   - Sync `wiki/architecture/` with current codebase structure
   - Update Tech Stack if new dependencies added
   - Update Project Overview with any new modules

5. **Validate Links**
   - Check all internal wiki links are valid
   - Report any broken links found

## Output Format

### Project Page Template

```markdown
# <Project Name>

<Description from README or package.json>

## Status

| Attribute | Value                     |
| :-------- | :------------------------ |
| Status    | Active/Planned/Deprecated |
| Stack     | <technologies>            |
| Location  | `apps/<category>/<name>`  |

## Overview

<Brief description of what the project does>

## Features

- Feature 1
- Feature 2

## Configuration

| Variable | Description | Default |
| :------- | :---------- | :------ |

## Usage

<Quick start commands>

## Related

- [Link to related project](./related.md)
```

## GitHub Sync

The wiki is stored as a Git submodule. To sync with GitHub:

1. **Check Status**

   ```bash
   cd wiki && git status
   ```

2. **Commit Changes**

   ```bash
   cd wiki
   git add -A
   git commit -m "docs(wiki): update wiki content"
   ```

3. **Push to GitHub**

   ```bash
   cd wiki && git push origin master
   ```

   Note: GitHub wikis use `master` branch by default.
   Wiki remote should be: `git@github.com:<owner>/<repo>.wiki.git`

4. **Update Submodule Reference**

   ```bash
   cd ..
   git add wiki
   git commit -m "chore: update wiki submodule"
   ```

## Options

- `--projects-only` - Only update project pages
- `--sidebar-only` - Only regenerate sidebar
- `--validate` - Only validate links, don't update
- `--sync` - Commit and push changes to GitHub after update
- `--dry-run` - Show what would be updated without making changes

## Workflow

1. Run `/update-wiki` to update content
2. Review changes in `wiki/` directory
3. Run `/update-wiki --sync` to push to GitHub

After updating, show summary of changes and ask user to review before committing.
