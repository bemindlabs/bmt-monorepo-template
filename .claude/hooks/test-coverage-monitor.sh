#!/bin/bash

###############################################################################
# Test Coverage Monitor Hook
# Purpose: Ensures adequate test coverage for changed files
# Validates property-based tests and test tag format
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

log_error() { echo -e "${RED}[TEST-COVERAGE]${NC} $1" >&2; }
log_warning() { echo -e "${YELLOW}[TEST-COVERAGE]${NC} $1" >&2; }
log_success() { echo -e "${GREEN}[TEST-COVERAGE]${NC} $1" >&2; }

ISSUES=0
WARNINGS=0

# Read file content
CONTENT=$(cat "$FILE_PATH")

# Check test files
if [[ "$FILE_PATH" =~ \.(spec|test)\.(ts|tsx)$ ]]; then

    # Check 1: Test file should have describe blocks
    if ! echo "$CONTENT" | grep -qE '^describe\(|^[[:space:]]+describe\('; then
        log_warning "Test file may not have describe blocks"
        ((WARNINGS++))
    fi

    # Check 2: Test file should have it/test blocks
    if ! echo "$CONTENT" | grep -qE '\b(it|test)\s*\('; then
        log_warning "Test file may not have any test cases"
        ((WARNINGS++))
    fi

    # Check 3: Property-based tests should have enough iterations
    if echo "$CONTENT" | grep -qE '(fc\.|fast-check|@fast-check|property)'; then
        # Check for numRuns configuration
        if echo "$CONTENT" | grep -qE 'numRuns'; then
            # Extract numRuns value
            NUM_RUNS=$(echo "$CONTENT" | grep -oE 'numRuns:\s*[0-9]+' | grep -oE '[0-9]+' | head -1 || echo "0")
            if [ "$NUM_RUNS" -lt 100 ]; then
                log_warning "Property-based tests should have at least 100 iterations (found: $NUM_RUNS)"
                ((WARNINGS++))
            fi
        else
            # No explicit numRuns - may use default which is 100
            :
        fi
    fi

    # Check 4: Tests should have proper assertions
    ASSERTION_COUNT=$(echo "$CONTENT" | grep -cE '\b(expect|assert|should)\s*\(' || echo "0")
    TEST_COUNT=$(echo "$CONTENT" | grep -cE '\b(it|test)\s*\(' || echo "0")

    if [ "$TEST_COUNT" -gt 0 ] && [ "$ASSERTION_COUNT" -lt "$TEST_COUNT" ]; then
        log_warning "Some tests may be missing assertions"
        ((WARNINGS++))
    fi

    # Check 5: Test tags format (for filtering)
    if echo "$CONTENT" | grep -qE '@tag|\.tag\('; then
        # Validate tag format: should be lowercase with hyphens
        if echo "$CONTENT" | grep -E '@tag|\.tag\(' | grep -qE '[A-Z]'; then
            log_warning "Test tags should be lowercase with hyphens"
            ((WARNINGS++))
        fi
    fi

    # Check 6: Mock usage should be cleaned up
    if echo "$CONTENT" | grep -qE 'jest\.mock|vi\.mock|sinon'; then
        if ! echo "$CONTENT" | grep -qE '(afterEach|afterAll).*\.(reset|restore|clear)'; then
            log_warning "Mocks found but cleanup may be missing (afterEach reset)"
            ((WARNINGS++))
        fi
    fi

    # Check 7: Async tests should await or return promises
    if echo "$CONTENT" | grep -qE 'async\s*\(' | grep -qE '(it|test)\s*\('; then
        # Good - async tests found
        :
    elif echo "$CONTENT" | grep -qE '\.then\(|Promise'; then
        if ! echo "$CONTENT" | grep -qE 'return\s+.*\.(then|finally)|await'; then
            log_warning "Tests with promises may not properly await/return"
            ((WARNINGS++))
        fi
    fi

fi

# Check source files for corresponding tests
if [[ "$FILE_PATH" =~ \.(service|controller|util|helper)\.ts$ ]] && [[ ! "$FILE_PATH" =~ \.(spec|test)\.ts$ ]]; then

    # Check 8: Source file should have corresponding test file
    TEST_FILE="${FILE_PATH%.ts}.spec.ts"
    TEST_FILE_ALT="${FILE_PATH%.ts}.test.ts"

    if [ ! -f "$TEST_FILE" ] && [ ! -f "$TEST_FILE_ALT" ]; then
        log_warning "No test file found for: $(basename "$FILE_PATH")"
        ((WARNINGS++))
    fi

fi

# Summary
if [ $ISSUES -gt 0 ]; then
    log_error "Found $ISSUES test coverage issue(s)"
    exit 2
elif [ $WARNINGS -gt 0 ]; then
    log_warning "Found $WARNINGS test coverage warning(s)"
    exit 1
else
    log_success "Test coverage check passed"
    exit 0
fi
