#!/bin/bash
# Setup Git Hooks for Monorepo Agents Workflow
# Installs all pre-commit hooks automatically
# Version: 1.0.0

set -e

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
cd "$REPO_ROOT"

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🔧 Setting up Git hooks for Monorepo Agents Workflow...${NC}"

# Create combined pre-commit hook
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# Combined Pre-Commit Hook
# Runs lint-staged and updates README on feature changes

set -e

REPO_ROOT=$(git rev-parse --show-toplevel)

# Run lint-staged first
echo "Running pre-commit checks..."
"$REPO_ROOT/.claude/hooks/pre-commit.sh"

# Then update README if feature changes detected
echo ""
echo "Checking for feature changes..."
"$REPO_ROOT/.claude/hooks/update-readme-on-feature-change.sh"

exit 0
EOF

# Make executable
chmod +x .git/hooks/pre-commit

echo -e "${GREEN}✅ Git pre-commit hook installed${NC}"
echo -e "${BLUE}   - Lint-staged (ESLint + Prettier)${NC}"
echo -e "${BLUE}   - README auto-update on feature changes${NC}"
echo ""
echo -e "${GREEN}🎉 Setup complete! Your hooks are ready.${NC}"
echo ""
echo -e "To test the hooks, try:"
echo -e "  1. Make changes to TypeScript/JavaScript files"
echo -e "  2. Stage them: ${BLUE}git add .${NC}"
echo -e "  3. Commit: ${BLUE}git commit -m \"test: hooks\"${NC}"
echo ""
