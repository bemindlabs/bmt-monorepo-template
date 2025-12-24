# ==============================================================================
# CI/CD Helpers
# ==============================================================================

ci-install: ## CI: Install dependencies
	pnpm install --frozen-lockfile

ci-build: ## CI: Build all packages
	pnpm build

ci-test: ## CI: Run tests with coverage
	pnpm test:coverage

ci-lint: ## CI: Run linting
	pnpm lint

ci-all: ci-install ci-build ci-lint ci-test ## CI: Full pipeline
