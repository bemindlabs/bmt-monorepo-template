# ==============================================================================
# Setup & Installation
# ==============================================================================

install: ## Install all dependencies
	pnpm install

install-frozen: ## Install dependencies with frozen lockfile
	pnpm install --frozen-lockfile

setup: install ## Full project setup (install + prepare)
	pnpm prepare

init: ## Initialize project (first-time setup)
	@echo "$(GREEN)Initializing project...$(RESET)"
	corepack enable
	corepack prepare pnpm@9 --activate
	pnpm install
	pnpm prepare
	@echo "$(GREEN)Project initialized successfully!$(RESET)"
