#!/bin/bash

###############################################################################
# Documentation Link Validator Hook
# Purpose: Validates internal markdown links and ensures no broken references
# Checks for moved/removed files and suggests corrections
# Version: 1.0.0
###############################################################################

set -euo pipefail

# Colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

FILE_PATH="${1:-$KIRO_FILE_PATH}"
PROJECT_ROOT="${KIRO_PROJECT_ROOT:-$(cd "$(dirname "$0")/../../.." && pwd)}"

if [ -z "$FILE_PATH" ] || [ ! -f "$FILE_PATH" ]; then
    exit 0
fi

# Only check markdown files
if [[ ! "$FILE_PATH" =~ \.md$ ]]; then
    exit 0
fi

log_error() { echo -e "${RED}[DOC-LINKS]${NC} $1" >&2; }
log_warning() { echo -e "${YELLOW}[DOC-LINKS]${NC} $1" >&2; }
log_success() { echo -e "${GREEN}[DOC-LINKS]${NC} $1" >&2; }

ISSUES=0
WARNINGS=0

# Get directory of the current file
FILE_DIR=$(dirname "$FILE_PATH")

# Read file content
CONTENT=$(cat "$FILE_PATH")

# Extract all markdown links
# Patterns: [text](link) and [text][ref]
LINKS=$(echo "$CONTENT" | grep -oE '\]\([^)]+\)' | sed 's/\](\(.*\))/\1/' | grep -v '^http' | grep -v '^#' || echo "")

# Check each internal link
while IFS= read -r link; do
    [ -z "$link" ] && continue

    # Remove anchor from link
    link_path="${link%%#*}"

    # Skip empty links or pure anchors
    [ -z "$link_path" ] && continue

    # Resolve relative path
    if [[ "$link_path" == /* ]]; then
        # Absolute path from project root
        full_path="$PROJECT_ROOT$link_path"
    elif [[ "$link_path" == ../* ]] || [[ "$link_path" == ./* ]]; then
        # Relative path
        full_path=$(cd "$FILE_DIR" && realpath -m "$link_path" 2>/dev/null || echo "$FILE_DIR/$link_path")
    else
        # Simple relative path
        full_path="$FILE_DIR/$link_path"
    fi

    # Normalize path
    full_path=$(realpath -m "$full_path" 2>/dev/null || echo "$full_path")

    # Check if file exists
    if [ ! -e "$full_path" ]; then
        log_warning "Broken link: $link"

        # Try to find similar file
        base_name=$(basename "$link_path")
        similar=$(find "$PROJECT_ROOT" -name "$base_name" -type f 2>/dev/null | head -1 || echo "")

        if [ -n "$similar" ]; then
            # Calculate relative path from file location
            rel_similar=$(realpath --relative-to="$FILE_DIR" "$similar" 2>/dev/null || echo "$similar")
            log_warning "  Suggestion: $rel_similar"
        fi

        ((WARNINGS++))
    fi

done <<< "$LINKS"

# Check 2: Validate document naming convention (UPPERCASE_UNDERSCORE.md)
base_name=$(basename "$FILE_PATH")
if [[ "$FILE_PATH" =~ /docs/ ]] && [[ "$base_name" != "README.md" ]]; then
    # Should be UPPERCASE_UNDERSCORE.md
    if ! echo "$base_name" | grep -qE '^[A-Z][A-Z0-9_]*\.md$'; then
        log_warning "Document naming: Consider UPPERCASE_UNDERSCORE.md convention"
        ((WARNINGS++))
    fi
fi

# Check 3: Look for common broken patterns
BROKEN_PATTERNS=(
    '\[.*\]\(\s*\)'          # Empty links
    '\[.*\]\(TODO\)'         # TODO links
    '\[.*\]\(TBD\)'          # TBD links
    '\[.*\]\(#TODO\)'        # TODO anchors
)

for pattern in "${BROKEN_PATTERNS[@]}"; do
    if echo "$CONTENT" | grep -qE "$pattern"; then
        log_warning "Placeholder link found: $pattern"
        ((WARNINGS++))
    fi
done

# Check 4: Validate anchor links exist in target file
ANCHOR_LINKS=$(echo "$CONTENT" | grep -oE '\]\([^)]*#[^)]+\)' | sed 's/\](\(.*\))/\1/' || echo "")

while IFS= read -r anchor_link; do
    [ -z "$anchor_link" ] && continue

    # Extract file and anchor
    link_file="${anchor_link%%#*}"
    anchor="${anchor_link#*#}"

    # For same-file anchors
    if [ -z "$link_file" ]; then
        # Check if heading exists in current file
        # Convert anchor to heading search pattern
        heading_pattern=$(echo "$anchor" | tr '-' ' ' | tr '[:lower:]' '[:upper:]')

        if ! echo "$CONTENT" | grep -qiE "^#+\s*$heading_pattern"; then
            log_warning "Anchor may not exist: #$anchor"
            ((WARNINGS++))
        fi
    fi

done <<< "$ANCHOR_LINKS"

# Summary
if [ $ISSUES -gt 0 ]; then
    log_error "Found $ISSUES documentation issue(s)"
    exit 2
elif [ $WARNINGS -gt 0 ]; then
    log_warning "Found $WARNINGS documentation warning(s)"
    exit 1
else
    log_success "Documentation links validated"
    exit 0
fi
