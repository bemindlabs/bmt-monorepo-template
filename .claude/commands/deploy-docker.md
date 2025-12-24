Deploy services to Docker containers.

## Usage

```
/deploy-docker [action] [service] [options]
```

**Actions:**

- `up` (default) - Build and start containers
- `logs` - View container logs
- `stop` - Stop containers
- `restart` - Restart containers
- `status` - Show container status

**Services:**

- `all` (default) - All services
- `api` - API services
- `web` - Web applications
- `<service-name>` - Specific service

## Examples

```sh
/deploy-docker                     # Deploy all services
/deploy-docker up api              # Deploy API service
/deploy-docker logs api            # View logs
/deploy-docker logs --tail 100     # Last 100 lines
/deploy-docker stop                # Stop all
/deploy-docker restart web         # Restart web service
/deploy-docker status              # Show status
```

## Commands

### API Service

```sh
cd apps/api
docker compose up -d --build
docker compose ps
```

### Web Application

```sh
cd apps/web
docker compose up -d --build
docker compose ps
```

### All Services

```sh
cd infra/docker
docker compose up -d --build
docker compose ps
```

### View Logs

```sh
docker compose logs -f <service>
```

### Stop

```sh
docker compose down
```

## Health Checks

After deployment, verify:

1. Containers running: `docker compose ps`
2. API responding: `curl http://localhost:<port>/health`
3. No restart loops in logs

## Troubleshooting

**Container restarting:**

```sh
docker compose logs <service> --tail 50
```

**Port in use:**

```sh
lsof -i :<port>
```

**Rebuild from scratch:**

```sh
docker compose down -v
docker compose build --no-cache
docker compose up -d
```
