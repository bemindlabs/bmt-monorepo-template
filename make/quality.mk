# ==============================================================================
# Code Quality
# ==============================================================================

lint: ## Run ESLint on all packages
	pnpm lint

lint-fix: ## Run ESLint and fix issues
	pnpm lint:fix

format: ## Format code with Prettier
	pnpm format

format-check: ## Check code formatting
	pnpm format:check

type-check: ## Run TypeScript type checking
	pnpm type-check

check: lint type-check format-check ## Run all code quality checks

fix: lint-fix format ## Fix all auto-fixable issues
