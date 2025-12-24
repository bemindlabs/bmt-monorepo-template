#!/bin/sh
set -e

echo "🔧 Installing dependencies..."
pnpm install

echo "🚀 Starting development server..."
exec pnpm dev
