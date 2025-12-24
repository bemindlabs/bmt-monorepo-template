# GitHub Wiki

This directory contains the source files for the GitHub Wiki.

## Structure

| File                 | Description                |
| -------------------- | -------------------------- |
| `Home.md`            | Wiki home page             |
| `Getting-Started.md` | Quick start guide          |
| `Installation.md`    | Detailed installation      |
| `Configuration.md`   | Configuration options      |
| `Architecture.md`    | System architecture        |
| `Packages.md`        | Package documentation      |
| `Development.md`     | Development workflow       |
| `Deployment.md`      | Deployment guides          |
| `Troubleshooting.md` | Common issues              |
| `FAQ.md`             | Frequently asked questions |
| `_Sidebar.md`        | Navigation sidebar         |
| `_Footer.md`         | Page footer                |

## Publishing to GitHub Wiki

### Option 1: Manual Copy

1. Go to your repository on GitHub
2. Click the "Wiki" tab
3. Create pages manually and copy content

### Option 2: Clone Wiki Repository

```bash
# Clone the wiki repository
git clone https://github.com/your-org/monorepo-template.wiki.git

# Copy wiki files
cp wiki/*.md ../monorepo-template.wiki/

# Commit and push
cd ../monorepo-template.wiki
git add .
git commit -m "Update wiki content"
git push
```

### Option 3: GitHub Actions (Automated)

Add this workflow to `.github/workflows/wiki.yml`:

```yaml
name: Update Wiki

on:
  push:
    branches: [main]
    paths: ['wiki/**']

jobs:
  update-wiki:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Sync Wiki
        uses: Andrew-Chen-Wang/github-wiki-action@v4
        with:
          path: wiki
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Local Preview

To preview wiki pages locally:

```bash
# Using grip (GitHub Readme Instant Preview)
pip install grip
grip wiki/Home.md

# Or use VS Code with Markdown preview
code wiki/
```

## Contributing

When updating wiki content:

1. Edit files in the `wiki/` directory
2. Follow existing formatting conventions
3. Update `_Sidebar.md` if adding new pages
4. Test links work correctly

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)**
