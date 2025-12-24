# ==============================================================================
# Testing
# ==============================================================================

test: ## Run all tests
	pnpm test

test-watch: ## Run tests in watch mode
	pnpm test:watch

test-coverage: ## Run tests with coverage report
	pnpm test:coverage

test-unit: ## Run unit tests only
	pnpm test:unit

test-integration: ## Run integration tests only
	pnpm test:integration

test-e2e: ## Run end-to-end tests only
	pnpm test:e2e

test-ci: check test ## Run CI test suite (lint + type-check + tests)
