# ==============================================================================
# BMT Monorepo Template - Makefile
# ==============================================================================
# Organized command shortcuts for development, testing, deployment, and more.
#
# Usage: make <target>
# Help:  make help
#
# Author: BEMIND TECHNOLOGY CO., LTD.
# ==============================================================================

.PHONY: help
.DEFAULT_GOAL := help

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

# Colors for terminal output
CYAN := \033[36m
GREEN := \033[32m
YELLOW := \033[33m
RED := \033[31m
RESET := \033[0m

# Export colors for included makefiles
export CYAN GREEN YELLOW RED RESET

# ------------------------------------------------------------------------------
# Include Category Makefiles
# ------------------------------------------------------------------------------

include make/setup.mk    # Setup & Installation
include make/dev.mk      # Development
include make/build.mk    # Building
include make/quality.mk  # Code Quality
include make/test.mk     # Testing
include make/docker.mk   # Docker
include make/k8s.mk      # Kubernetes
include make/firebase.mk # Firebase
include make/git.mk      # Git & Version Control
include make/release.mk  # Release & Publishing
include make/clean.mk    # Cleanup
include make/docs.mk     # Documentation
include make/utils.mk    # Utilities
include make/ci.mk       # CI/CD Helpers

# ------------------------------------------------------------------------------
# Help
# ------------------------------------------------------------------------------

help: ## Show this help message
	@echo ""
	@echo "$(CYAN)BMT Monorepo Template$(RESET) - Available Commands"
	@echo ""
	@echo "$(GREEN)Usage:$(RESET) make $(YELLOW)<target>$(RESET)"
	@echo ""
	@echo "$(CYAN)Setup & Installation$(RESET)"
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' make/setup.mk | awk 'BEGIN {FS = ":.*## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(CYAN)Development$(RESET)"
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' make/dev.mk | awk 'BEGIN {FS = ":.*## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(CYAN)Building$(RESET)"
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' make/build.mk | awk 'BEGIN {FS = ":.*## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(CYAN)Code Quality$(RESET)"
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' make/quality.mk | awk 'BEGIN {FS = ":.*## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(CYAN)Testing$(RESET)"
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' make/test.mk | awk 'BEGIN {FS = ":.*## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(CYAN)Docker$(RESET)"
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' make/docker.mk | awk 'BEGIN {FS = ":.*## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(CYAN)Kubernetes$(RESET)"
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' make/k8s.mk | awk 'BEGIN {FS = ":.*## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(CYAN)Firebase$(RESET)"
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' make/firebase.mk | awk 'BEGIN {FS = ":.*## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(CYAN)Git$(RESET)"
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' make/git.mk | awk 'BEGIN {FS = ":.*## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(CYAN)Release$(RESET)"
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' make/release.mk | awk 'BEGIN {FS = ":.*## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(CYAN)Cleanup$(RESET)"
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' make/clean.mk | awk 'BEGIN {FS = ":.*## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(CYAN)Documentation$(RESET)"
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' make/docs.mk | awk 'BEGIN {FS = ":.*## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(CYAN)Utilities$(RESET)"
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' make/utils.mk | awk 'BEGIN {FS = ":.*## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(CYAN)CI/CD$(RESET)"
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' make/ci.mk | awk 'BEGIN {FS = ":.*## "}; {printf "  $(YELLOW)%-20s$(RESET) %s\n", $$1, $$2}'
	@echo ""

# ------------------------------------------------------------------------------
# Quick Aliases
# ------------------------------------------------------------------------------

q-dev: dev           ## Alias: dev
q-build: build       ## Alias: build
q-test: test         ## Alias: test
q-lint: lint-fix format ## Quick fix (lint + format)

# ==============================================================================
# End of Makefile
# ==============================================================================
