# Troubleshooting

Common issues and solutions.

## Installation Issues

### Node.js Version Mismatch

**Error:**

```
error: The engine "node" is incompatible with this module
```

**Solution:**

```bash
# Check current version
node --version

# Install correct version with nvm
nvm install 22
nvm use 22
```

### pnpm Not Found

**Error:**

```
command not found: pnpm
```

**Solution:**

```bash
# Install pnpm
npm install -g pnpm@9

# Or use corepack
corepack enable
corepack prepare pnpm@latest --activate
```

### Permission Denied on Scripts

**Error:**

```
permission denied: ./scripts/init-project.sh
```

**Solution:**

```bash
chmod +x scripts/*.sh
```

## Build Issues

### TypeScript Compilation Errors

**Error:**

```
error TS2307: Cannot find module '@monorepo/shared'
```

**Solution:**

```bash
# Build packages first
pnpm build:packages

# Then build apps
pnpm build
```

### Package Not Found

**Error:**

```
Cannot find package '@monorepo/core' imported from...
```

**Solution:**

```bash
# Reinstall dependencies
pnpm install

# Rebuild packages
pnpm build:packages
```

### Turbo Cache Issues

**Error:**

```
Unexpected cache behavior or stale builds
```

**Solution:**

```bash
# Clear Turborepo cache
pnpm turbo clean

# Full clean
pnpm clean
pnpm install
pnpm build
```

## Development Issues

### Port Already in Use

**Error:**

```
Error: listen EADDRINUSE: address already in use :::3000
```

**Solution:**

```bash
# Find process using port
lsof -i :3000

# Kill process
kill -9 <PID>

# Or use different port
PORT=3001 pnpm dev
```

### Hot Reload Not Working

**Error:**

```
Changes not reflected in browser
```

**Solution:**

1. Check if file is saved
2. Clear browser cache
3. Restart dev server:

```bash
# Stop and restart
pnpm dev
```

### ESLint/Prettier Conflicts

**Error:**

```
Conflicting rules between ESLint and Prettier
```

**Solution:**

```bash
# Run Prettier first
pnpm format

# Then lint
pnpm lint --fix
```

## Docker Issues

### Container Won't Start

**Error:**

```
Container exits immediately
```

**Solution:**

```bash
# Check logs
docker compose logs web

# Rebuild container
docker compose build --no-cache
docker compose up -d
```

### Volume Mount Issues

**Error:**

```
Files not syncing to container
```

**Solution:**

```bash
# Ensure correct path in docker-compose.yml
volumes:
  - .:/app:delegated

# Restart Docker
docker compose down
docker compose up -d
```

### Network Issues

**Error:**

```
Container can't reach other services
```

**Solution:**

```bash
# Check network
docker network ls
docker network inspect monorepo_default

# Recreate network
docker compose down
docker compose up -d
```

## Kubernetes Issues

### Pod CrashLoopBackOff

**Error:**

```
Pod status: CrashLoopBackOff
```

**Solution:**

```bash
# Check pod logs
kubectl logs <pod-name> -n monorepo

# Check events
kubectl describe pod <pod-name> -n monorepo

# Check resource limits
kubectl get pod <pod-name> -n monorepo -o yaml
```

### Image Pull Errors

**Error:**

```
ErrImagePull or ImagePullBackOff
```

**Solution:**

```bash
# Check image name
kubectl describe pod <pod-name> -n monorepo

# Check registry credentials
kubectl get secrets -n monorepo
```

### Service Not Accessible

**Error:**

```
Cannot connect to service
```

**Solution:**

```bash
# Check service
kubectl get svc -n monorepo

# Port forward for testing
kubectl port-forward svc/web 3000:80 -n monorepo

# Check ingress
kubectl get ingress -n monorepo
```

## Firebase Issues

### Deploy Permission Denied

**Error:**

```
Error: HTTP Error: 403, Permission denied
```

**Solution:**

```bash
# Re-authenticate
firebase logout
firebase login

# Check project
firebase projects:list
firebase use <project-id>
```

### Firestore Rules Errors

**Error:**

```
PERMISSION_DENIED: Missing or insufficient permissions
```

**Solution:**

1. Check `firestore.rules`
2. Verify authentication state
3. Deploy updated rules:

```bash
firebase deploy --only firestore:rules
```

## Test Issues

### Tests Timeout

**Error:**

```
Test timed out
```

**Solution:**

```bash
# Increase timeout
pnpm test -- --testTimeout=30000

# Or in vitest.config.ts
export default {
  test: {
    testTimeout: 30000
  }
}
```

### Test Isolation Issues

**Error:**

```
Tests pass individually but fail together
```

**Solution:**

- Check for shared state
- Use `beforeEach`/`afterEach` hooks
- Run tests in isolation:

```bash
pnpm test -- --no-threads
```

## Getting Help

If you can't resolve an issue:

1. **Search Issues**: Check [GitHub Issues](https://github.com/anthropics/claude-code/issues)
2. **Ask Community**: Post in [GitHub Discussions](https://github.com/anthropics/claude-code/discussions)
3. **Contact Support**: Email [info@bemind.tech](mailto:info@bemind.tech)

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)**
