#!/bin/bash
# Pre-commit Hook for Monorepo Agents Workflow
# Filters TypeScript/JavaScript files, determines affected packages/apps,
# removes duplicates, and runs lint-staged for formatting and linting
# Version: 1.0.0

set -e

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
cd "$REPO_ROOT"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info "Running pre-commit hook..."

# Get staged files
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACMR)

if [ -z "$STAGED_FILES" ]; then
    print_warning "No staged files found"
    exit 0
fi

# Filter TypeScript and JavaScript files
TS_JS_FILES=$(echo "$STAGED_FILES" | grep -E '\.(ts|tsx|js|jsx)$' || true)

if [ -z "$TS_JS_FILES" ]; then
    print_info "No TypeScript/JavaScript files to process"
    exit 0
fi

print_info "Found $(echo "$TS_JS_FILES" | wc -l | xargs) TypeScript/JavaScript files"

# Determine affected packages and apps
AFFECTED_PACKAGES=()
AFFECTED_APPS=()

# Process each file and extract unique packages/apps
while IFS= read -r file; do
    if [[ $file == apps/* ]]; then
        # Extract app name from path (apps/app-name/...)
        app_name=$(echo "$file" | cut -d'/' -f2)
        if [[ ! " ${AFFECTED_APPS[@]} " =~ " ${app_name} " ]]; then
            AFFECTED_APPS+=("$app_name")
        fi
    elif [[ $file == packages/* ]]; then
        # Extract package name from path (packages/package-name/...)
        pkg_name=$(echo "$file" | cut -d'/' -f2)
        if [[ ! " ${AFFECTED_PACKAGES[@]} " =~ " ${pkg_name} " ]]; then
            AFFECTED_PACKAGES+=("$pkg_name")
        fi
    fi
done <<< "$TS_JS_FILES"

# Remove duplicates using associative array (already done in loop above)
if [ ${#AFFECTED_APPS[@]} -gt 0 ]; then
    print_info "Affected apps: ${AFFECTED_APPS[*]}"
fi

if [ ${#AFFECTED_PACKAGES[@]} -gt 0 ]; then
    print_info "Affected packages: ${AFFECTED_PACKAGES[*]}"
fi

# Run lint-staged
print_info "Running lint-staged for formatting and linting..."

if ! command -v pnpm &> /dev/null; then
    print_error "pnpm is not installed. Please install it first."
    exit 1
fi

# Check if lint-staged is available
if ! pnpm exec lint-staged --version &> /dev/null; then
    print_error "lint-staged is not installed. Run: pnpm install"
    exit 1
fi

# Run lint-staged on staged files
if pnpm exec lint-staged; then
    print_success "Lint-staged completed successfully"
else
    print_error "Lint-staged failed. Please fix the issues and try again."
    exit 1
fi

# Re-stage files that were modified by lint-staged
echo "$TS_JS_FILES" | while IFS= read -r file; do
    if [ -f "$file" ]; then
        git add "$file"
    fi
done

print_success "Pre-commit checks passed"
exit 0
