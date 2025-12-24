#!/bin/bash
###############################################################################
# Pre-Tool-Use Hook - Architecture Validation
# Purpose: Quick validation before write operations
# Exit codes: 0=success, 1=warning, 2=block
# Version: 2.0.0
###############################################################################

set -euo pipefail

# Get script directory and project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Read stdin (Claude Code passes JSON context)
INPUT=""
if [ ! -t 0 ]; then
    INPUT=$(cat)
fi

# Extract tool info from stdin JSON
TOOL_NAME=""
FILE_PATH=""
if [ -n "$INPUT" ]; then
    TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty' 2>/dev/null || echo "")
    FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty' 2>/dev/null || echo "")
fi

# Skip validation for read-only operations
case "${TOOL_NAME:-}" in
    Read|Grep|Glob|WebFetch|WebSearch|BashOutput)
        exit 0
        ;;
esac

# Quick validation: Check critical files exist
CRITICAL_FILES=(
    "CLAUDE.md"
    "package.json"
    "pnpm-workspace.yaml"
)

MISSING=0
for file in "${CRITICAL_FILES[@]}"; do
    if [ ! -f "$PROJECT_ROOT/$file" ]; then
        echo "WARNING: Missing critical file: $file" >&2
        MISSING=1
    fi
done

# Allow bypass with environment variable
if [ "${SKIP_ARCH_VERIFY:-0}" = "1" ]; then
    exit 0
fi

# Exit with warning if files missing (non-blocking)
if [ $MISSING -eq 1 ]; then
    exit 1
fi

exit 0
