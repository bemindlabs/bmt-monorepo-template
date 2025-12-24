# ==============================================================================
# Docker
# ==============================================================================

DOCKER_COMPOSE := docker compose -f infra/docker/docker-compose.yml

docker-build: ## Build Docker images
	$(DOCKER_COMPOSE) build

docker-build-nc: ## Build Docker images (no cache)
	$(DOCKER_COMPOSE) build --no-cache

docker-up: ## Start Docker containers
	$(DOCKER_COMPOSE) up -d

docker-down: ## Stop Docker containers
	$(DOCKER_COMPOSE) down

docker-restart: docker-down docker-up ## Restart Docker containers

docker-logs: ## View Docker container logs
	$(DOCKER_COMPOSE) logs -f

docker-logs-web: ## View web container logs
	$(DOCKER_COMPOSE) logs -f web

docker-ps: ## Show running Docker containers
	$(DOCKER_COMPOSE) ps

docker-shell: ## Open shell in web container
	$(DOCKER_COMPOSE) exec web sh

docker-clean: ## Stop containers and remove volumes
	$(DOCKER_COMPOSE) down -v --remove-orphans

docker-prune: ## Remove all unused Docker resources
	docker system prune -af
