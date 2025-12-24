# Contributing to Monorepo Template

Thank you for your interest in contributing! This document provides guidelines and instructions for contributing.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [Commit Messages](#commit-messages)

## Code of Conduct

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## Getting Started

### Prerequisites

- Node.js >= 22.0.0
- pnpm >= 9.0.0
- Git

### Setup

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/monorepo-template.git
   cd monorepo-template
   ```
3. Install dependencies:
   ```bash
   pnpm install
   ```
4. Build packages:
   ```bash
   pnpm build:packages
   ```

## Development Workflow

### Branch Naming

Use the following prefixes for your branches:

| Type          | Prefix      | Example                   |
| ------------- | ----------- | ------------------------- |
| Feature       | `feature/`  | `feature/add-new-utility` |
| Bug fix       | `fix/`      | `fix/type-error`          |
| Documentation | `docs/`     | `docs/api-reference`      |
| Refactor      | `refactor/` | `refactor/core-module`    |
| Test          | `test/`     | `test/integration-tests`  |

### Running Tests

```bash
# Run all tests
pnpm test

# Run tests in watch mode
pnpm test:watch

# Run tests with coverage
pnpm test:coverage
```

### Linting and Formatting

```bash
# Check linting
pnpm lint

# Fix linting issues
pnpm lint:fix

# Format code
pnpm format

# Check types
pnpm type-check
```

## Pull Request Process

1. **Create a branch** from `main` with a descriptive name
2. **Make your changes** following the coding standards
3. **Write/update tests** for your changes
4. **Run the test suite** to ensure everything passes
5. **Update documentation** if needed
6. **Submit a pull request** with a clear description

### PR Checklist

- [ ] Code follows the project's coding standards
- [ ] Tests added/updated and passing
- [ ] Documentation updated if needed
- [ ] Commit messages follow conventional commits
- [ ] No breaking changes (or properly documented)
- [ ] Self-reviewed the code

## Coding Standards

### TypeScript

- Use strict TypeScript configuration
- Avoid `any` type - use proper typing
- Use interfaces for object shapes
- Export types from `index.ts` files

### File Organization

```
packages/
├── core/
│   └── src/
│       ├── index.ts       # Public exports
│       ├── types.ts       # Type definitions
│       └── utils.ts       # Utility functions
```

### Naming Conventions

| Type             | Convention      | Example           |
| ---------------- | --------------- | ----------------- |
| Files            | kebab-case      | `some-utility.ts` |
| Classes          | PascalCase      | `SomeClass`       |
| Functions        | camelCase       | `doSomething`     |
| Constants        | SCREAMING_SNAKE | `MAX_RETRIES`     |
| Types/Interfaces | PascalCase      | `SomeConfig`      |

### Code Style

- Maximum line length: 100 characters
- Use single quotes for strings
- Use semicolons
- Use 2 spaces for indentation

## Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting)
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Adding/updating tests
- `build`: Build system changes
- `ci`: CI configuration changes
- `chore`: Other changes

### Scopes

- `core`: Core package
- `shared`: Shared package
- `config`: Config package
- `cli`: CLI tools
- `docs`: Documentation
- `deps`: Dependencies

### Examples

```
feat(core): add new utility function

fix(shared): correct type definition

docs(readme): update installation instructions

refactor(core): simplify module structure
```

## Questions?

Feel free to open an issue for any questions or concerns.

Thank you for contributing!

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)** | [info@bemind.tech](mailto:info@bemind.tech)
