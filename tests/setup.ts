/**
 * Global Test Setup
 *
 * This file is loaded before all tests run.
 * Configure global mocks, environment variables, and test utilities here.
 */

import { afterAll, afterEach, beforeAll, beforeEach, vi } from 'vitest';

// ============================================================================
// Environment Setup
// ============================================================================

beforeAll(() => {
  // Set test environment variables
  process.env.NODE_ENV = 'test';
  process.env.LOG_LEVEL = 'silent';

  // Mock API keys for testing (don't use real keys in tests)
  process.env.ANTHROPIC_API_KEY = 'test-anthropic-key';
  process.env.OPENAI_API_KEY = 'test-openai-key';
  process.env.GOOGLE_AI_API_KEY = 'test-google-key';
});

afterAll(() => {
  // Cleanup after all tests
  vi.restoreAllMocks();
});

// ============================================================================
// Per-Test Setup
// ============================================================================

beforeEach(() => {
  // Reset mocks before each test
  vi.clearAllMocks();
});

afterEach(() => {
  // Cleanup after each test
});

// ============================================================================
// Global Mocks
// ============================================================================

// Mock fetch for API calls
vi.mock('node-fetch', () => ({
  default: vi.fn(),
}));

// ============================================================================
// Test Utilities
// ============================================================================

/**
 * Wait for a specified duration
 */
export const wait = (ms: number): Promise<void> =>
  new Promise((resolve) => setTimeout(resolve, ms));

/**
 * Create a mock agent response
 */
export const createMockResponse = (content: string) => ({
  content,
  metadata: {
    model: 'test-model',
    tokens: { input: 10, output: 20 },
    latency: 100,
  },
});

/**
 * Create a mock error
 */
export const createMockError = (message: string, code?: string) => {
  const error = new Error(message);
  if (code) {
    (error as Error & { code: string }).code = code;
  }
  return error;
};
