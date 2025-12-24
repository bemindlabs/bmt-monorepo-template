# ==============================================================================
# Cleanup
# ==============================================================================

clean: ## Clean build artifacts and caches
	pnpm clean

clean-modules: ## Remove all node_modules
	find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +

clean-turbo: ## Clean Turborepo cache
	rm -rf .turbo
	rm -rf node_modules/.cache/turbo

clean-dist: ## Clean all dist folders
	find . -name 'dist' -type d -prune -exec rm -rf '{}' +

clean-all: clean-dist clean-turbo clean-modules ## Deep clean everything
	@echo "$(GREEN)All build artifacts and caches cleaned!$(RESET)"

reset: clean-all install build ## Reset project (clean + install + build)
