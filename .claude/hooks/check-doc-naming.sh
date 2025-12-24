#!/bin/bash

###############################################################################
# Documentation Naming Convention Checker
###############################################################################
#
# Description:
#   Validates that new documentation files in docs/ follow the
#   UPPERCASE_UNDERSCORE.md naming convention as defined in CLAUDE.md
#
# Usage:
#   ./.claude/hooks/check-doc-naming.sh
#
# Exit Codes:
#   0 - All documentation follows naming convention
#   1 - Violations found
#
# Created: 2025-11-26
# Author: BEMIND TECHNOLOGY CO., LTD.
#
###############################################################################

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Header
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  Documentation Naming Convention Checker${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Get staged markdown files in docs/ (new or modified)
STAGED_DOCS=$(git diff --cached --name-only --diff-filter=AM | grep '^docs/.*\.md$' || true)

# If no docs/ files staged, skip
if [ -z "$STAGED_DOCS" ]; then
    echo -e "${GREEN}✓${NC} No documentation files in docs/ to check"
    exit 0
fi

echo -e "${BLUE}ℹ️  Checking documentation naming conventions...${NC}"
echo ""

VIOLATIONS=0
CHECKED=0

# Exceptions (files that are allowed to use different naming)
EXCEPTIONS=(
    "docs/README.md"
    "docs/CONTRIBUTORS.md"
    "docs/nia-funding-proposal/"  # External document standard
    "docs/archive/deck/"          # Funding proposal documents (depa, nia) use numbered prefixes
)

# Check if file is in exceptions
is_exception() {
    local file="$1"
    for exception in "${EXCEPTIONS[@]}"; do
        if [[ "$file" == "$exception"* ]]; then
            return 0
        fi
    done
    return 1
}

# Validate naming convention
# UPPERCASE_UNDERSCORE.md pattern: ^[A-Z][A-Z0-9_]*\.md$
validate_filename() {
    local filepath="$1"
    local filename=$(basename "$filepath")

    # Skip if exception
    if is_exception "$filepath"; then
        return 0
    fi

    # Check if filename matches UPPERCASE_UNDERSCORE.md pattern
    if [[ "$filename" =~ ^[A-Z][A-Z0-9_]*\.md$ ]]; then
        return 0
    else
        return 1
    fi
}

# Process each staged file
while IFS= read -r file; do
    if [ -n "$file" ]; then
        CHECKED=$((CHECKED + 1))

        if validate_filename "$file"; then
            echo -e "${GREEN}✓${NC} $file"
        else
            VIOLATIONS=$((VIOLATIONS + 1))
            filename=$(basename "$file")

            # Suggest correct name
            # Convert kebab-case or other patterns to UPPERCASE_UNDERSCORE
            suggested=$(echo "$filename" | sed 's/\.md$//' | tr '[:lower:]' '[:upper:]' | tr '-' '_')

            echo -e "${RED}✗${NC} $file"
            echo -e "  ${YELLOW}→${NC} Should be: ${suggested}.md"
            echo ""
        fi
    fi
done <<< "$STAGED_DOCS"

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# Summary
if [ $VIOLATIONS -eq 0 ]; then
    echo -e "${GREEN}✅ All $CHECKED documentation files follow naming convention${NC}"
    echo ""
    exit 0
else
    echo -e "${RED}❌ Found $VIOLATIONS naming convention violation(s)${NC}"
    echo ""
    echo -e "${YELLOW}📋 Naming Convention:${NC}"
    echo "   • Use UPPERCASE_UNDERSCORE.md format"
    echo "   • Examples: AUTHENTICATION.md, API_OVERVIEW.md"
    echo "   • Single words: ROADMAP.md, SECURITY.md"
    echo ""
    echo -e "${YELLOW}📖 Policy:${NC}"
    echo "   • Required for all files in docs/"
    echo "   • App-specific docs (apps/*/docs/) may use kebab-case"
    echo "   • See CLAUDE.md 'Documentation Policies' section"
    echo ""
    echo -e "${YELLOW}🔧 How to fix:${NC}"
    echo "   1. Rename files to UPPERCASE_UNDERSCORE.md format"
    echo "   2. Update any internal links to renamed files"
    echo "   3. Re-stage the files: git add <files>"
    echo "   4. Try commit again"
    echo ""
    exit 1
fi
