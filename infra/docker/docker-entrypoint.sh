#!/bin/sh
set -e

echo "🔧 Installing dependencies..."
pnpm install

echo "📦 Building packages..."
pnpm --filter './packages/*' build

# Start appropriate service based on SERVICE env var
case "${SERVICE:-web}" in
  api)
    echo "🚀 Starting API server (Node/tsx)..."
    exec pnpm --filter @monorepo/api dev:node
    ;;
  web)
    echo "🚀 Starting web development server..."
    exec pnpm --filter @monorepo/web dev
    ;;
  *)
    echo "🚀 Starting all development servers..."
    exec pnpm dev
    ;;
esac
