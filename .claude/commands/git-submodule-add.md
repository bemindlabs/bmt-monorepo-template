Add a new git submodule to the apps directory.

Ask the user for:

1. Repository URL (git@github.com:...)
2. Project name (will be placed in apps/<name>)

Then run:

```sh
git submodule add <repository-url> apps/<project-name>
```

After adding, update the README.md projects table and CLAUDE.md with the new project.
