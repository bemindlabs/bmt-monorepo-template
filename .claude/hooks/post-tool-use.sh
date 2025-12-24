#!/bin/bash
###############################################################################
# Post-Tool-Use Hook
# Purpose: Lightweight post-processing after file edits
# Exit codes: 0=success (always non-blocking)
# Version: 2.0.0
###############################################################################

set -euo pipefail

# Get project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Read stdin (Claude Code passes JSON context)
INPUT=""
if [ ! -t 0 ]; then
    INPUT=$(cat)
fi

# Extract file path from stdin JSON
FILE_PATH=""
TOOL_NAME=""
if [ -n "$INPUT" ]; then
    FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty' 2>/dev/null || echo "")
    TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty' 2>/dev/null || echo "")
fi

# Skip for read-only tools
case "${TOOL_NAME:-}" in
    Read|Grep|Glob|WebFetch|WebSearch|BashOutput|AskUserQuestion)
        exit 0
        ;;
esac

# Skip if no file modified
[ -z "$FILE_PATH" ] && exit 0

# Get relative path
REL_PATH="${FILE_PATH#$PROJECT_ROOT/}"

# Optional: Run pattern-based validators (non-blocking)
run_validator() {
    local validator="$1"
    local script="$SCRIPT_DIR/$validator.sh"

    if [ -x "$script" ]; then
        "$script" "$FILE_PATH" 2>&1 || true
    fi
}

# Route to appropriate validators based on file patterns
case "$REL_PATH" in
    # Service files - check multi-tenant security
    apps/service-*/src/*.service.ts|apps/service-*/src/*.repository.ts)
        run_validator "multi-tenant-security-guard"
        ;;

    # Controllers - check RBAC and OpenAPI
    apps/service-*/src/*.controller.ts)
        run_validator "rbac-permission-validator"
        run_validator "openapi-sync-checker"
        ;;

    # UI components - check i18n
    apps/web-*/src/components/*.tsx|apps/web-*/src/app/*.tsx)
        run_validator "i18n-completeness-checker"
        ;;

    # Test files
    *.spec.ts|*.test.ts|*.test.tsx)
        run_validator "test-coverage-monitor"
        ;;

    # Documentation
    *.md)
        run_validator "documentation-link-validator"
        ;;
esac

# Always succeed (non-blocking)
exit 0
