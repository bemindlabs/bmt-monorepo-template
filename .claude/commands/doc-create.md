Create a new documentation file following project standards.

Ask the user for:

1. Category: architecture | api | guides | references | changelogs
2. Document title (will be converted to kebab-case filename)
3. Brief description

Create the file in `docs/<category>/<filename>.md` with proper frontmatter:

```markdown
# <Title>

> <Description>

## Overview

<!-- Content here -->
```

Follow filename conventions from CLAUDE.md:

- Use kebab-case
- Be descriptive
- Use numbered prefix if ordering matters (NN-name.md)
