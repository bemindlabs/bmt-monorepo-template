# ==============================================================================
# Development
# ==============================================================================

dev: ## Start all development servers
	pnpm dev

dev-web: ## Start web app development server only
	pnpm --filter @monorepo/web dev

dev-api: ## Start API development server (Bun)
	pnpm --filter @monorepo/api dev

dev-packages: ## Start packages in watch mode
	pnpm --filter './packages/*' dev
