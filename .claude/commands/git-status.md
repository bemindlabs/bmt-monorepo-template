Show the current status of the monorepo.

Display:

1. Git status of the main repository
2. Status of each submodule (current branch, commit, changes)
3. Any uncommitted changes across all projects

Run:

```sh
git status
git submodule status
git submodule foreach 'git status --short'
```

Summarize findings in a clear format.
