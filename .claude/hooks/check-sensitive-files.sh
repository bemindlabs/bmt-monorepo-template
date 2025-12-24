#!/bin/bash
###############################################################################
# Check Sensitive Files Hook
# Purpose: Block commits of files containing secrets or credentials
# Exit codes: 0=safe, 2=block (sensitive content found)
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
if [ -n "$INPUT" ]; then
    FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty' 2>/dev/null || echo "")
fi

# If file path passed as argument, use that
if [ $# -gt 0 ]; then
    FILE_PATH="$1"
fi

# Skip if no file to check
if [ -z "$FILE_PATH" ]; then
    exit 0
fi

# Convert to relative path for cleaner output
REL_PATH="${FILE_PATH#$PROJECT_ROOT/}"

# Sensitive filename patterns (BLOCK these files)
is_sensitive_filename() {
    local file="$1"
    local basename
    basename=$(basename "$file")

    case "$basename" in
        .env|.env.local|.env.production|.env.development)
            return 0 ;;
        *.key|*.pem|*.p12|*.pfx|*.keystore)
            return 0 ;;
        *credentials*.json|*secrets*.json|*service-account*.json)
            return 0 ;;
        .npmrc|.yarnrc|.pnpmrc)
            # Only block if contains auth tokens
            if [ -f "$file" ] && grep -qE '_authToken|//registry.*:_' "$file" 2>/dev/null; then
                return 0
            fi
            ;;
    esac

    # Allowed patterns (exceptions)
    case "$basename" in
        .env.example|.env.template|.env.sample|*.env.example)
            return 1 ;;
    esac

    return 1
}

# Check file content for hardcoded secrets
has_sensitive_content() {
    local file="$1"

    # Skip if file doesn't exist or is not readable
    [ ! -f "$file" ] && return 1
    [ ! -r "$file" ] && return 1

    # Skip documentation and test files
    case "$file" in
        *.md|*.txt|*.rst|*README*|*/docs/*|*/__tests__/*|*/test/*|*.spec.*|*.test.*)
            return 1 ;;
    esac

    # Skip this script itself
    [[ "$file" == *"check-sensitive-files.sh" ]] && return 1

    local content
    content=$(cat "$file" 2>/dev/null || echo "")

    # Check for actual API keys (specific patterns)
    # AWS Access Key
    if echo "$content" | grep -qE 'AKIA[0-9A-Z]{16}'; then
        echo "Found AWS Access Key ID" >&2
        return 0
    fi

    # OpenAI API Key (sk-...)
    if echo "$content" | grep -qE '["'"'"'`]sk-[a-zA-Z0-9]{48}["'"'"'`]'; then
        echo "Found OpenAI API Key" >&2
        return 0
    fi

    # GitHub tokens
    if echo "$content" | grep -qE '(ghp|gho|ghu|ghs|ghr)_[a-zA-Z0-9]{36,}'; then
        echo "Found GitHub Token" >&2
        return 0
    fi

    # Private keys in PEM format
    if echo "$content" | grep -qE '-----BEGIN (RSA |DSA |EC )?PRIVATE KEY-----'; then
        echo "Found private key in PEM format" >&2
        return 0
    fi

    # Database connection strings with passwords
    if echo "$content" | grep -qE '(postgresql|mysql|mongodb)://[^:]+:[^@]{8,}@[^/]+'; then
        # Ignore if it's clearly a placeholder
        if ! echo "$content" | grep -qiE '(password|your_password|changeme|placeholder)'; then
            echo "Found database connection string with password" >&2
            return 0
        fi
    fi

    return 1
}

# Main check
if is_sensitive_filename "$FILE_PATH"; then
    echo "BLOCKED: Sensitive file type: $REL_PATH" >&2
    echo "Use .env.example for templates, keep secrets in .env.local" >&2
    exit 2
fi

if has_sensitive_content "$FILE_PATH"; then
    echo "BLOCKED: File contains sensitive content: $REL_PATH" >&2
    echo "Remove secrets and use environment variables instead" >&2
    exit 2
fi

# File is safe
exit 0
