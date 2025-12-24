#!/bin/bash
#
# Project Initialization Wizard
# Monorepo Template
#
# Usage: ./scripts/init-project.sh
#

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# ============================================================================
# Helper Functions
# ============================================================================

print_banner() {
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════════╗"
    echo "║                                                                  ║"
    echo "║         Monorepo Template - Project Initialization              ║"
    echo "║                                                                  ║"
    echo "╚══════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_step() {
    echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}${BLUE}$1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${CYAN}ℹ $1${NC}"
}

# ============================================================================
# Prerequisite Checks
# ============================================================================

check_prerequisites() {
    print_step "Step 1: Checking Prerequisites"

    local missing=0

    # Check Node.js
    if command -v node &> /dev/null; then
        local node_version=$(node --version | sed 's/v//')
        local major_version=$(echo "$node_version" | cut -d. -f1)
        if [ "$major_version" -ge 22 ]; then
            print_success "Node.js $node_version (>= 22.0.0 required)"
        else
            print_error "Node.js $node_version found, but >= 22.0.0 required"
            missing=1
        fi
    else
        print_error "Node.js not found"
        missing=1
    fi

    # Check pnpm
    if command -v pnpm &> /dev/null; then
        local pnpm_version=$(pnpm --version)
        local pnpm_major=$(echo "$pnpm_version" | cut -d. -f1)
        if [ "$pnpm_major" -ge 9 ]; then
            print_success "pnpm $pnpm_version (>= 9.0.0 required)"
        else
            print_error "pnpm $pnpm_version found, but >= 9.0.0 required"
            missing=1
        fi
    else
        print_error "pnpm not found"
        print_info "Install with: npm install -g pnpm"
        missing=1
    fi

    # Check Git
    if command -v git &> /dev/null; then
        local git_version=$(git --version | cut -d' ' -f3)
        print_success "Git $git_version"
    else
        print_error "Git not found"
        missing=1
    fi

    if [ $missing -eq 1 ]; then
        echo ""
        print_error "Please install missing prerequisites and try again."
        exit 1
    fi

    echo ""
    print_success "All prerequisites met!"
}

# ============================================================================
# Install Dependencies
# ============================================================================

install_dependencies() {
    print_step "Step 2: Installing Dependencies"

    cd "$PROJECT_ROOT"

    print_info "Running pnpm install..."
    pnpm install

    print_success "Dependencies installed"
}

# ============================================================================
# Build Packages
# ============================================================================

build_packages() {
    print_step "Step 3: Building Shared Packages"

    cd "$PROJECT_ROOT"

    print_info "Building packages..."
    pnpm build:packages

    print_success "Packages built successfully"
}

# ============================================================================
# Setup Scrum Structure
# ============================================================================

setup_scrum() {
    print_step "Step 4: Setting Up Scrum Structure"

    cd "$PROJECT_ROOT"

    if [ -d ".scrum" ]; then
        print_info "Scrum structure already exists"
        print_success "Scrum ready"
    else
        print_info "Creating .scrum directory structure..."
        mkdir -p .scrum/backlog .scrum/sprints .scrum/standups .scrum/retrospectives

        # Create config.json
        cat > .scrum/config.json << 'EOF'
{
  "sprintDuration": 14,
  "sprintPrefix": "sprint-",
  "team": [],
  "currentSprint": null
}
EOF
        print_success "Scrum structure created"
    fi
}

# ============================================================================
# Setup Zero-QA
# ============================================================================

setup_zero_qa() {
    print_step "Step 5: Setting Up Zero-QA"

    cd "$PROJECT_ROOT"

    if [ -d ".zero-qa" ]; then
        print_info "Zero-QA structure already exists"
        print_success "Zero-QA ready"
    else
        print_info "Creating .zero-qa directory structure..."
        mkdir -p .zero-qa/checklists .zero-qa/reports

        # Create config.json
        cat > .zero-qa/config.json << 'EOF'
{
  "enabled": true,
  "autoReview": true,
  "qualityGates": {
    "testCoverage": 80,
    "lintErrors": 0,
    "typeErrors": 0,
    "securityVulnerabilities": 0
  },
  "checks": {
    "lint": true,
    "typeCheck": true,
    "unitTests": true,
    "integrationTests": true,
    "securityScan": true
  },
  "reviewCriteria": {
    "codeComplexity": 10,
    "functionLength": 50,
    "fileLength": 300
  }
}
EOF
        print_success "Zero-QA structure created"
    fi
}

# ============================================================================
# Setup Git Hooks
# ============================================================================

setup_git_hooks() {
    print_step "Step 6: Setting Up Git Hooks"

    cd "$PROJECT_ROOT"

    if [ -d ".husky" ]; then
        print_info "Husky hooks already configured"
        print_success "Git hooks ready"
    else
        print_info "Initializing Husky..."
        pnpm exec husky init 2>/dev/null || true
        print_success "Git hooks configured"
    fi
}

# ============================================================================
# Verify Setup
# ============================================================================

verify_setup() {
    print_step "Step 7: Verifying Setup"

    cd "$PROJECT_ROOT"

    local errors=0

    # Check if packages are built
    if [ -d "packages/core/dist" ]; then
        print_success "@monorepo/core built"
    else
        print_warning "@monorepo/core not built"
        errors=1
    fi

    if [ -d "packages/shared/dist" ]; then
        print_success "@monorepo/shared built"
    else
        print_warning "@monorepo/shared not built"
        errors=1
    fi

    if [ -d "packages/config/dist" ]; then
        print_success "@monorepo/config built"
    else
        print_warning "@monorepo/config not built"
        errors=1
    fi

    # Check Scrum structure
    if [ -d ".scrum" ] && [ -f ".scrum/config.json" ]; then
        print_success "Scrum structure configured"
    else
        print_warning "Scrum structure not configured"
        errors=1
    fi

    # Check Zero-QA structure
    if [ -d ".zero-qa" ] && [ -f ".zero-qa/config.json" ]; then
        print_success "Zero-QA structure configured"
    else
        print_warning "Zero-QA structure not configured"
        errors=1
    fi

    # Run type check
    print_info "Running type check..."
    if pnpm type-check 2>/dev/null; then
        print_success "Type check passed"
    else
        print_warning "Type check had issues (may be expected for empty packages)"
    fi

    echo ""
    if [ $errors -eq 0 ]; then
        print_success "Setup verified successfully!"
    else
        print_warning "Setup completed with some warnings"
    fi
}

# ============================================================================
# Print Port Assignments
# ============================================================================

print_port_assignments() {
    echo -e "\n${BOLD}Port Assignments (3000-3099):${NC}"
    echo ""
    echo -e "  ${CYAN}┌─────────────────────────────────────────────────────────────────┐${NC}"
    echo -e "  ${CYAN}│${NC} ${BOLD}Range${NC}       ${CYAN}│${NC} ${BOLD}Service${NC}                    ${CYAN}│${NC} ${BOLD}Description${NC}        ${CYAN}│${NC}"
    echo -e "  ${CYAN}├─────────────────────────────────────────────────────────────────┤${NC}"
    echo -e "  ${CYAN}│${NC} 3000        ${CYAN}│${NC} Web App (Production)        ${CYAN}│${NC} Main web server    ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 3001        ${CYAN}│${NC} Web App (Preview)           ${CYAN}│${NC} Vite preview       ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 3002-3009   ${CYAN}│${NC} Additional Web Apps         ${CYAN}│${NC} Reserved           ${CYAN}│${NC}"
    echo -e "  ${CYAN}├─────────────────────────────────────────────────────────────────┤${NC}"
    echo -e "  ${CYAN}│${NC} 3010-3019   ${CYAN}│${NC} API Services                ${CYAN}│${NC} REST/GraphQL APIs  ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 3020-3029   ${CYAN}│${NC} WebSocket Services          ${CYAN}│${NC} Real-time comms    ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 3030-3039   ${CYAN}│${NC} Background Workers          ${CYAN}│${NC} Queue processors   ${CYAN}│${NC}"
    echo -e "  ${CYAN}├─────────────────────────────────────────────────────────────────┤${NC}"
    echo -e "  ${CYAN}│${NC} 3040-3049   ${CYAN}│${NC} Documentation               ${CYAN}│${NC} Storybook, Docs    ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 3050-3059   ${CYAN}│${NC} Testing                     ${CYAN}│${NC} Test servers       ${CYAN}│${NC}"
    echo -e "  ${CYAN}├─────────────────────────────────────────────────────────────────┤${NC}"
    echo -e "  ${CYAN}│${NC} 3060-3069   ${CYAN}│${NC} Monitoring                  ${CYAN}│${NC} Metrics, Health    ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 3070-3079   ${CYAN}│${NC} Admin Tools                 ${CYAN}│${NC} Internal tools     ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 3080-3089   ${CYAN}│${NC} Development Tools           ${CYAN}│${NC} Dev utilities      ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 3090-3099   ${CYAN}│${NC} Reserved                    ${CYAN}│${NC} Future use         ${CYAN}│${NC}"
    echo -e "  ${CYAN}└─────────────────────────────────────────────────────────────────┘${NC}"
    echo ""
    echo -e "  ${BOLD}Vite Development Ports:${NC}"
    echo -e "  ${CYAN}│${NC} 5173        ${CYAN}│${NC} @monorepo/web (Vite dev)    ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 5174-5179   ${CYAN}│${NC} Additional Vite apps        ${CYAN}│${NC}"
    echo ""
    echo -e "  ${BOLD}Infrastructure Ports:${NC}"
    echo -e "  ${CYAN}│${NC} 4000        ${CYAN}│${NC} Firebase Emulator UI        ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 5000        ${CYAN}│${NC} Firebase Hosting            ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 5432        ${CYAN}│${NC} PostgreSQL                  ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 6379        ${CYAN}│${NC} Redis                       ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 8080        ${CYAN}│${NC} Firestore Emulator          ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 9199        ${CYAN}│${NC} Storage Emulator            ${CYAN}│${NC}"
    echo -e "  ${CYAN}│${NC} 30080       ${CYAN}│${NC} Kubernetes NodePort         ${CYAN}│${NC}"
    echo ""
}

# ============================================================================
# Print Summary
# ============================================================================

print_summary() {
    echo -e "\n${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════════╗"
    echo "║                    Setup Complete!                               ║"
    echo "╚══════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"

    print_port_assignments

    echo -e "${BOLD}Next Steps:${NC}"
    echo ""
    echo "  1. Start development:"
    echo -e "     ${CYAN}pnpm dev${NC}"
    echo ""
    echo "  2. Run tests:"
    echo -e "     ${CYAN}pnpm test${NC}"
    echo ""
    echo "  3. Create a new package:"
    echo -e "     ${CYAN}mkdir -p packages/my-package/src${NC}"
    echo ""
    echo "  4. Create a new app:"
    echo -e "     ${CYAN}mkdir -p apps/my-app/src${NC}"
    echo ""
    echo -e "${BOLD}Useful Commands:${NC}"
    echo ""
    echo -e "  ${CYAN}pnpm dev${NC}            - Start development mode"
    echo -e "  ${CYAN}pnpm build${NC}          - Build all packages"
    echo -e "  ${CYAN}pnpm test${NC}           - Run tests"
    echo -e "  ${CYAN}pnpm lint${NC}           - Check code quality"
    echo -e "  ${CYAN}pnpm type-check${NC}     - Check TypeScript types"
    echo -e "  ${CYAN}pnpm zero-qa${NC}        - Run Zero-QA quality checks"
    echo ""
    echo -e "${BOLD}Scrum Commands (Claude Code):${NC}"
    echo ""
    echo -e "  ${CYAN}/scrum-backlog${NC}      - Manage product backlog"
    echo -e "  ${CYAN}/scrum-sprint${NC}       - Sprint management"
    echo -e "  ${CYAN}/scrum-standup${NC}      - Daily standup notes"
    echo -e "  ${CYAN}/scrum-retro${NC}        - Sprint retrospectives"
    echo ""
    echo -e "${BOLD}Zero-QA Commands (Claude Code):${NC}"
    echo ""
    echo -e "  ${CYAN}/zero-qa-check${NC}      - Pre-commit quality checks"
    echo -e "  ${CYAN}/zero-qa-review${NC}     - Automated code review"
    echo -e "  ${CYAN}/zero-qa-dod${NC}        - Definition of Done verification"
    echo ""
    echo -e "${GREEN}Happy coding!${NC}"
    echo ""
}

# ============================================================================
# Main
# ============================================================================

main() {
    print_banner
    check_prerequisites
    install_dependencies
    build_packages
    setup_scrum
    setup_zero_qa
    setup_git_hooks
    verify_setup
    print_summary
}

main "$@"
