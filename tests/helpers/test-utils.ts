/**
 * Test Helpers: Utility Functions
 *
 * Common utilities for testing.
 */

import { vi } from 'vitest';

// ============================================================================
// Time Utilities
// ============================================================================

/**
 * Wait for a specified duration
 */
export const wait = (ms: number): Promise<void> =>
  new Promise((resolve) => setTimeout(resolve, ms));

/**
 * Wait for next tick
 */
export const nextTick = (): Promise<void> => new Promise((resolve) => process.nextTick(resolve));

// ============================================================================
// Mock Utilities
// ============================================================================

/**
 * Create a mock function that resolves after a delay
 */
export const createDelayedMock = <T>(value: T, delayMs: number) =>
  vi.fn().mockImplementation(() => wait(delayMs).then(() => value));

/**
 * Create a mock that fails N times before succeeding
 */
export const createFailingMock = <T>(
  successValue: T,
  failureCount: number,
  errorMessage = 'Mock failure'
) => {
  let attempts = 0;
  return vi.fn().mockImplementation(() => {
    attempts++;
    if (attempts <= failureCount) {
      return Promise.reject(new Error(errorMessage));
    }
    return Promise.resolve(successValue);
  });
};

// ============================================================================
// Assertion Utilities
// ============================================================================

/**
 * Assert that a promise resolves within a timeout
 */
export const expectToResolveWithin = async <T>(
  promise: Promise<T>,
  timeoutMs: number
): Promise<T> => {
  const timeoutPromise = new Promise<never>((_, reject) =>
    setTimeout(() => reject(new Error(`Promise did not resolve within ${timeoutMs}ms`)), timeoutMs)
  );
  return Promise.race([promise, timeoutPromise]);
};

/**
 * Assert that a function throws a specific error
 */
export const expectToThrowWithMessage = async (
  fn: () => Promise<unknown>,
  message: string
): Promise<void> => {
  let error: Error | null = null;
  try {
    await fn();
  } catch (e) {
    error = e as Error;
  }
  if (!error) {
    throw new Error('Expected function to throw');
  }
  if (!error.message.includes(message)) {
    throw new Error(`Expected error message to include "${message}", got "${error.message}"`);
  }
};

// ============================================================================
// Data Generation
// ============================================================================

/**
 * Generate random string
 */
export const randomString = (length = 10): string => {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  let result = '';
  for (let i = 0; i < length; i++) {
    result += chars.charAt(Math.floor(Math.random() * chars.length));
  }
  return result;
};

/**
 * Generate random number in range
 */
export const randomNumber = (min: number, max: number): number =>
  Math.floor(Math.random() * (max - min + 1)) + min;

// ============================================================================
// Environment Utilities
// ============================================================================

/**
 * Temporarily set environment variables for a test
 */
export const withEnv = async <T>(env: Record<string, string>, fn: () => Promise<T>): Promise<T> => {
  const original: Record<string, string | undefined> = {};

  // Save and set
  for (const [key, value] of Object.entries(env)) {
    original[key] = process.env[key];
    process.env[key] = value;
  }

  try {
    return await fn();
  } finally {
    // Restore
    for (const [key, value] of Object.entries(original)) {
      if (value === undefined) {
        delete process.env[key];
      } else {
        process.env[key] = value;
      }
    }
  }
};
