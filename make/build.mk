# ==============================================================================
# Building
# ==============================================================================

build: ## Build all packages and apps
	pnpm build

build-packages: ## Build packages only
	pnpm build:packages

build-web: ## Build web app only
	pnpm --filter @monorepo/web build

build-clean: clean build ## Clean and rebuild everything
