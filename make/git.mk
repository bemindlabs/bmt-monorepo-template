# ==============================================================================
# Git & Version Control
# ==============================================================================

CURRENT_BRANCH := $(shell git branch --show-current)

status: ## Show git status
	git status

diff: ## Show git diff
	git diff

log: ## Show git log (last 10 commits)
	git log --oneline -10

branch: ## Show current branch
	git branch --show-current

branches: ## List all branches
	git branch -a

pull: ## Pull latest changes
	git pull origin $(CURRENT_BRANCH)

push: ## Push to origin
	git push origin $(CURRENT_BRANCH)
