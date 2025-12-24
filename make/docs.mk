# ==============================================================================
# Documentation
# ==============================================================================

docs-serve: ## Serve documentation locally
	@echo "$(YELLOW)Opening wiki/Home.md...$(RESET)"
	@command -v grip >/dev/null 2>&1 && grip wiki/Home.md || echo "Install grip: pip install grip"

docs-wiki-sync: ## Sync wiki to GitHub
	@echo "$(GREEN)Syncing wiki to GitHub...$(RESET)"
	@cd /tmp && rm -rf bmt-monorepo-template.wiki && \
	git clone git@github.com:bemindlabs/bmt-monorepo-template.wiki.git && \
	cp $(CURDIR)/wiki/*.md bmt-monorepo-template.wiki/ && \
	cd bmt-monorepo-template.wiki && \
	git add . && git commit -m "docs: sync wiki content" && git push && \
	rm -rf /tmp/bmt-monorepo-template.wiki
	@echo "$(GREEN)Wiki synced successfully!$(RESET)"
