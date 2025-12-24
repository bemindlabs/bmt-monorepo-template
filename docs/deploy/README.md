# Deployment

Docker deployment and infrastructure management.

## Commands Overview

| Command          | Description                          |
| ---------------- | ------------------------------------ |
| `/deploy-docker` | Deploy services to Docker containers |

## /deploy-docker

Deploy services to Docker containers.

### Usage

```bash
/deploy-docker [action] [service] [options]
```

### Actions

| Action         | Description                |
| -------------- | -------------------------- |
| `up` (default) | Build and start containers |
| `logs`         | View container logs        |
| `stop`         | Stop containers            |
| `restart`      | Restart containers         |
| `status`       | Show container status      |

### Services

| Service         | Description                |
| --------------- | -------------------------- |
| `all` (default) | All services               |
| `dashboard`     | Dashboard (API + Frontend) |
| `api`           | API services               |

### Examples

```bash
# Deploy all services
/deploy-docker

# Deploy specific service
/deploy-docker up dashboard

# View logs
/deploy-docker logs dashboard
/deploy-docker logs --tail 100

# Stop all
/deploy-docker stop

# Restart service
/deploy-docker restart dashboard

# Show status
/deploy-docker status
```

## Docker Commands

### Build and Start

```bash
docker compose up -d --build
```

### View Logs

```bash
docker compose logs -f <service>
docker compose logs --tail 100 <service>
```

### Stop Services

```bash
docker compose down
```

### Check Status

```bash
docker compose ps
```

## Health Checks

After deployment, verify:

1. **Containers running**

   ```bash
   docker compose ps
   ```

2. **API responding**

   ```bash
   curl http://localhost:<port>/health
   ```

3. **No restart loops**
   ```bash
   docker compose logs <service> | grep -i restart
   ```

## Troubleshooting

### Container Restarting

```bash
# Check logs for errors
docker compose logs <service> --tail 50

# Check resource limits
docker stats
```

### Port in Use

```bash
# Find process using port
lsof -i :<port>

# Kill process
kill -9 <PID>
```

### Rebuild from Scratch

```bash
# Remove containers and volumes
docker compose down -v

# Rebuild without cache
docker compose build --no-cache

# Start fresh
docker compose up -d
```

### Clean Docker Resources

```bash
# Remove unused containers
docker container prune

# Remove unused images
docker image prune

# Remove all unused resources
docker system prune -a
```

## Docker Compose Structure

```yaml
# docker-compose.yml
version: '3.8'

services:
  api:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - '3000:3000'
    environment:
      - NODE_ENV=production
    healthcheck:
      test: ['CMD', 'curl', '-f', 'http://localhost:3000/health']
      interval: 30s
      timeout: 10s
      retries: 3

  frontend:
    build:
      context: ./frontend
      dockerfile: Dockerfile
    ports:
      - '80:80'
    depends_on:
      - api
```

## Environment Variables

```bash
# .env.docker
NODE_ENV=production
DATABASE_URL=postgres://...
REDIS_URL=redis://...
```

## Production Checklist

- [ ] Environment variables set
- [ ] Health checks configured
- [ ] Logging configured
- [ ] Resource limits set
- [ ] Volumes for persistent data
- [ ] Network security configured
- [ ] SSL/TLS enabled
- [ ] Backup strategy in place

## Monitoring

### Container Metrics

```bash
docker stats
```

### Application Logs

```bash
docker compose logs -f --tail 100
```

### System Resources

```bash
df -h           # Disk space
free -m         # Memory
top             # CPU usage
```

## Best Practices

1. **Use multi-stage builds** - Reduce image size
2. **Non-root user** - Security best practice
3. **Health checks** - Enable auto-recovery
4. **Resource limits** - Prevent runaway containers
5. **Named volumes** - Persistent data
6. **Environment files** - Keep secrets out of compose
