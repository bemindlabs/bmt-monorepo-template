---
inclusion: manual
contextKey: troubleshoot
---

# Troubleshooting Guide

## Common Issues

### Package Manager Issues

**Problem**: "This project is configured to use pnpm"
**Solution**: Install pnpm globally: `npm install -g pnpm`

**Problem**: Node version mismatch
**Solution**: Use Node.js >=22.0.0. Consider using nvm: `nvm use 22`

### Build Issues

**Problem**: TypeScript compilation errors
**Solution**:

1. Check `tsconfig.json` configurations
2. Run `pnpm type-check` to see all errors
3. Ensure all dependencies are installed: `pnpm install`

**Problem**: Turbo cache issues
**Solution**: Clear cache with `turbo clean` or `pnpm clean`

### Test Issues

**Problem**: Tests failing in CI but passing locally
**Solution**:

1. Check environment variables
2. Ensure all dependencies are installed
3. Run `pnpm test:coverage` to check coverage

### Dependency Issues

**Problem**: Package not found in workspace
**Solution**:

1. Check `pnpm-workspace.yaml` configuration
2. Ensure package is properly referenced in `package.json`
3. Run `pnpm install` to refresh workspace links

### Git Hook Issues

**Problem**: Pre-commit hooks failing
**Solution**:

1. Run `pnpm prepare` to reinstall Husky hooks
2. Check `.husky/` directory permissions
3. Manually run `pnpm lint:fix` and `pnpm format`

## Performance Optimization

### Build Performance

- Use `--filter` to build specific packages
- Leverage Turbo's dependency graph for incremental builds
- Check `.turbo/cache` for caching effectiveness

### Development Performance

- Use `pnpm dev` for hot reload
- Consider running only needed services during development
- Monitor memory usage with large monorepos

## Debugging Commands

```bash
# Check workspace structure
pnpm list -r

# Verify Turbo configuration
turbo run build --dry-run

# Check dependency graph
pnpm why <package-name>

# Analyze bundle size
pnpm build && npx bundlesize

# Check for outdated dependencies
pnpm outdated -r
```
