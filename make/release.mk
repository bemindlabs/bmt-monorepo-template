# ==============================================================================
# Release & Publishing
# ==============================================================================

changeset: ## Create a new changeset
	pnpm changeset

version: ## Update package versions from changesets
	pnpm version-packages

release: ## Build and publish packages
	pnpm release

tag: ## Create git tag for current version
	@VERSION=$$(node -p "require('./package.json').version"); \
	git tag -a "v$$VERSION" -m "Release v$$VERSION"; \
	echo "$(GREEN)Created tag v$$VERSION$(RESET)"

tag-push: ## Push tags to origin
	git push origin --tags

release-full: build test tag tag-push ## Full release (build, test, tag, push)
