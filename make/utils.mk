# ==============================================================================
# Utilities
# ==============================================================================

info: ## Show project information
	@echo ""
	@echo "$(CYAN)Project Information$(RESET)"
	@echo "──────────────────────────────────────"
	@echo "Name:        $$(node -p "require('./package.json').name")"
	@echo "Version:     $$(node -p "require('./package.json').version")"
	@echo "Node:        $$(node --version)"
	@echo "pnpm:        $$(pnpm --version)"
	@echo "TypeScript:  $$(pnpm exec tsc --version | cut -d' ' -f2)"
	@echo "Turbo:       $$(pnpm exec turbo --version)"
	@echo "──────────────────────────────────────"
	@echo ""

outdated: ## Check for outdated dependencies
	pnpm outdated

update: ## Update all dependencies
	pnpm update

update-interactive: ## Update dependencies interactively
	pnpm update -i

audit: ## Run security audit
	pnpm audit

size: ## Show package sizes
	@echo "$(CYAN)Package Sizes$(RESET)"
	@du -sh packages/*/dist 2>/dev/null || echo "No dist folders found. Run 'make build' first."
	@du -sh apps/*/dist 2>/dev/null || echo ""

tree: ## Show project structure
	@command -v tree >/dev/null 2>&1 && tree -L 2 -I 'node_modules|dist|.git|.turbo' || \
	ls -la
