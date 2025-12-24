import { resolve } from 'path';
import { defineConfig } from 'vitest/config';

export default defineConfig({
  test: {
    globals: true,
    environment: 'node',
    include: ['tests/**/*.spec.ts', 'tests/**/*.test.ts'],
    exclude: ['**/node_modules/**', '**/dist/**'],
    setupFiles: ['./tests/setup.ts'],
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json', 'html', 'lcov'],
      reportsDirectory: './coverage',
      exclude: ['node_modules', 'dist', '**/*.d.ts', 'tests/**', '**/*.config.*'],
      thresholds: {
        statements: 50,
        branches: 50,
        functions: 50,
        lines: 50,
      },
    },
    testTimeout: 10000,
    hookTimeout: 10000,
  },
  resolve: {
    alias: {
      '@monorepo-agents/core': resolve(__dirname, './packages/core/src'),
      '@monorepo-agents/shared': resolve(__dirname, './packages/shared/src'),
      '@monorepo-agents/config': resolve(__dirname, './packages/config/src'),
    },
  },
});
