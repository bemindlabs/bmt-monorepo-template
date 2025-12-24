# Installation

Detailed installation instructions for various environments.

## System Requirements

### Minimum Requirements

| Component | Requirement                                  |
| --------- | -------------------------------------------- |
| OS        | macOS 12+, Ubuntu 20.04+, Windows 10+ (WSL2) |
| Node.js   | 22.0.0 or higher                             |
| pnpm      | 9.0.0 or higher                              |
| RAM       | 8GB minimum, 16GB recommended                |
| Disk      | 2GB free space                               |

### Optional Tools

| Tool         | Purpose               |
| ------------ | --------------------- |
| Docker       | Container development |
| Minikube     | Local Kubernetes      |
| Firebase CLI | Firebase deployment   |

## Installing Prerequisites

### Node.js

Using nvm (recommended):

```bash
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install Node.js 22
nvm install 22
nvm use 22
nvm alias default 22
```

Using Homebrew (macOS):

```bash
brew install node@22
```

### pnpm

```bash
# Using npm
npm install -g pnpm@9

# Using Homebrew
brew install pnpm

# Using corepack (Node.js 16.13+)
corepack enable
corepack prepare pnpm@latest --activate
```

### Docker (Optional)

```bash
# macOS
brew install --cask docker

# Ubuntu
sudo apt-get update
sudo apt-get install docker.io docker-compose-v2
sudo usermod -aG docker $USER
```

### Minikube (Optional)

```bash
# macOS
brew install minikube

# Ubuntu
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

### Firebase CLI (Optional)

```bash
npm install -g firebase-tools
firebase login
```

## Project Installation

### Standard Installation

```bash
# Clone repository
git clone https://github.com/your-org/monorepo-template.git
cd monorepo-template

# Install dependencies
pnpm install

# Build packages
pnpm build:packages

# Verify installation
pnpm type-check
pnpm lint
pnpm test
```

### Using Init Script

```bash
chmod +x scripts/init-project.sh
./scripts/init-project.sh
```

### Development Installation

For development with all optional tools:

```bash
# Install all dependencies
pnpm install

# Build everything
pnpm build

# Start development environment
pnpm dev
```

## Environment Setup

### Create Environment Files

```bash
# Copy example environment files
cp .env.example .env.local
```

### Configure Environment Variables

Edit `.env.local`:

```env
# Application
NODE_ENV=development
PORT=3000

# AI Providers (optional)
ANTHROPIC_API_KEY=your-claude-key
OPENAI_API_KEY=your-openai-key

# Firebase (optional)
FIREBASE_PROJECT_ID=your-project-id
```

## Verification

### Run All Checks

```bash
pnpm type-check && pnpm lint && pnpm test && pnpm build
```

### Expected Output

```
✓ Type checking passed
✓ Linting passed
✓ All tests passed
✓ Build completed successfully
```

## Troubleshooting Installation

### Common Issues

**Node version mismatch:**

```bash
nvm use 22
```

**pnpm not found:**

```bash
npm install -g pnpm@9
```

**Permission denied:**

```bash
chmod +x scripts/*.sh
```

**Build failures:**

```bash
pnpm clean && pnpm install && pnpm build:packages
```

See [Troubleshooting](Troubleshooting) for more solutions.

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)**
