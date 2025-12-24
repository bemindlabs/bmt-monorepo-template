#!/bin/bash
# Script: lockfile-sync-validator.sh
# Description: Validate pnpm-lock.yaml synchronization with package.json files
# Usage: ./lockfile-sync-validator.sh
#        SKIP_VALIDATION=1 ./lockfile-sync-validator.sh  (bypass validation)
# Author: BEMIND TECHNOLOGY CO., LTD.
# Last Updated: 2025-11-27

set -e  # Exit on error

# Check if validation should be skipped
if [ "${SKIP_VALIDATION:-0}" = "1" ]; then
    echo -e "\033[1;33m⚠️  SKIP_VALIDATION=1, bypassing lockfile validation\033[0m" >&2
    exit 0
fi

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get repository root
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
cd "$REPO_ROOT"

echo -e "${BLUE}🔍 Validating pnpm-lock.yaml synchronization...${NC}"
echo ""

# Check if pnpm-lock.yaml exists
if [ ! -f "pnpm-lock.yaml" ]; then
    echo -e "${RED}❌ ERROR: pnpm-lock.yaml not found${NC}"
    echo -e "${YELLOW}Run 'pnpm install' to generate the lockfile${NC}"
    exit 1
fi

# Check if any package.json files have been modified
MODIFIED_PACKAGE_JSON=$(git diff --cached --name-only | grep -E 'package\.json$' || true)

if [ -z "$MODIFIED_PACKAGE_JSON" ]; then
    # No package.json files modified, check if lockfile is in staging
    LOCKFILE_STAGED=$(git diff --cached --name-only | grep -E '^pnpm-lock\.yaml$' || true)

    if [ -n "$LOCKFILE_STAGED" ]; then
        echo -e "${BLUE}📝 pnpm-lock.yaml is being committed${NC}"
        echo -e "${BLUE}Validating lockfile integrity...${NC}"
        echo ""
    else
        echo -e "${GREEN}✅ No package.json changes detected, skipping validation${NC}"
        exit 0
    fi
fi

# If package.json files are modified, check if lockfile is also staged
if [ -n "$MODIFIED_PACKAGE_JSON" ]; then
    LOCKFILE_STAGED=$(git diff --cached --name-only | grep -E '^pnpm-lock\.yaml$' || true)

    if [ -z "$LOCKFILE_STAGED" ]; then
        echo -e "${RED}❌ ERROR: package.json modified but pnpm-lock.yaml not staged${NC}"
        echo ""
        echo -e "${YELLOW}Modified package.json files:${NC}"
        echo "$MODIFIED_PACKAGE_JSON" | sed 's/^/  - /'
        echo ""
        echo -e "${YELLOW}Fix:${NC}"
        echo "  1. Run: ${BLUE}pnpm install${NC}"
        echo "  2. Stage: ${BLUE}git add pnpm-lock.yaml${NC}"
        echo "  3. Commit again"
        exit 1
    fi

    echo -e "${BLUE}📦 Detected package.json changes:${NC}"
    echo "$MODIFIED_PACKAGE_JSON" | sed 's/^/  - /'
    echo ""
fi

# Validate lockfile synchronization
echo -e "${BLUE}🔧 Validating lockfile integrity...${NC}"
echo ""

# Smart caching: Check if node_modules is up-to-date first
SKIP_FULL_INSTALL=false
if [ -d "node_modules" ] && [ -f "node_modules/.modules.yaml" ]; then
    # node_modules exists, check if lockfile is newer
    if [ "pnpm-lock.yaml" -ot "node_modules/.modules.yaml" ]; then
        echo -e "${BLUE}📦 node_modules is up-to-date, using fast validation${NC}"
        SKIP_FULL_INSTALL=true
    fi
fi

# Choose validation strategy
if [ "$SKIP_FULL_INSTALL" = true ]; then
    # Fast path: Only validate lockfile format without full install
    if OUTPUT=$(pnpm install --lockfile-only --frozen-lockfile 2>&1); then
        VALIDATION_SUCCESS=true
    else
        VALIDATION_SUCCESS=false
        EXIT_CODE=$?
    fi
else
    # Full path: Run complete install validation
    echo -e "${BLUE}Running full dependency validation...${NC}"
    if OUTPUT=$(pnpm install --frozen-lockfile 2>&1); then
        VALIDATION_SUCCESS=true
    else
        VALIDATION_SUCCESS=false
        EXIT_CODE=$?
    fi
fi

# Handle validation result
if [ "$VALIDATION_SUCCESS" = true ]; then
    echo -e "${GREEN}✅ Lockfile is synchronized with all package.json files${NC}"
    echo ""

    # Show summary
    if [ -n "$MODIFIED_PACKAGE_JSON" ]; then
        echo -e "${GREEN}✓ Dependencies validated${NC}"
        echo -e "${GREEN}✓ Lockfile is up-to-date${NC}"
    else
        echo -e "${GREEN}✓ Lockfile integrity verified${NC}"
    fi

    exit 0
else
    EXIT_CODE=$?
    echo -e "${RED}❌ ERROR: Lockfile validation failed${NC}"
    echo ""
    echo -e "${YELLOW}Error details:${NC}"
    echo "$OUTPUT" | sed 's/^/  /'
    echo ""
    echo -e "${YELLOW}Common causes:${NC}"
    echo "  1. ${RED}Out of sync:${NC} package.json modified without updating lockfile"
    echo "  2. ${RED}Missing dependency:${NC} New dependency added but lockfile not regenerated"
    echo "  3. ${RED}Version mismatch:${NC} Dependency version changed without updating lockfile"
    echo ""
    echo -e "${YELLOW}Fix:${NC}"
    echo "  1. Run: ${BLUE}pnpm install${NC}"
    echo "  2. Review changes: ${BLUE}git diff pnpm-lock.yaml${NC}"
    echo "  3. Stage lockfile: ${BLUE}git add pnpm-lock.yaml${NC}"
    echo "  4. Commit again"
    echo ""
    echo -e "${YELLOW}To skip this check (NOT RECOMMENDED):${NC}"
    echo "  ${BLUE}git commit --no-verify${NC}"
    echo ""

    exit $EXIT_CODE
fi
