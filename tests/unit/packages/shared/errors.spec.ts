/**
 * Unit Tests: Shared Errors
 */

import {
  AppError,
  ConfigurationError,
  NotFoundError,
  RateLimitError,
  ValidationError,
} from '@monorepo/shared';
import { describe, expect, it } from 'vitest';

describe('AppError', () => {
  it('should create an error with message', () => {
    const error = new AppError('Test error message', 'TEST_ERROR');

    expect(error).toBeInstanceOf(Error);
    expect(error).toBeInstanceOf(AppError);
    expect(error.message).toBe('Test error message');
    expect(error.name).toBe('AppError');
    expect(error.code).toBe('TEST_ERROR');
  });

  it('should have stack trace', () => {
    const error = new AppError('Test error', 'TEST_ERROR');

    expect(error.stack).toBeDefined();
  });

  it('should include details', () => {
    const error = new AppError('Test error', 'TEST_ERROR', { foo: 'bar' });

    expect(error.details).toEqual({ foo: 'bar' });
  });
});

describe('ValidationError', () => {
  it('should create validation error', () => {
    const error = new ValidationError('Invalid input');

    expect(error).toBeInstanceOf(AppError);
    expect(error.code).toBe('VALIDATION_ERROR');
    expect(error.name).toBe('ValidationError');
  });
});

describe('ConfigurationError', () => {
  it('should create configuration error', () => {
    const error = new ConfigurationError('Missing API key');

    expect(error).toBeInstanceOf(AppError);
    expect(error.message).toContain('Missing API key');
    expect(error.code).toBe('CONFIGURATION_ERROR');
  });

  it('should indicate configuration issue', () => {
    const error = new ConfigurationError('Invalid model name');

    expect(error.name).toBe('ConfigurationError');
  });
});

describe('NotFoundError', () => {
  it('should create not found error with resource', () => {
    const error = new NotFoundError('User');

    expect(error).toBeInstanceOf(AppError);
    expect(error.message).toContain('User');
    expect(error.code).toBe('NOT_FOUND_ERROR');
  });

  it('should include id when provided', () => {
    const error = new NotFoundError('User', '123');

    expect(error.message).toContain('123');
  });
});

describe('RateLimitError', () => {
  it('should create rate limit error', () => {
    const error = new RateLimitError('Too many requests', 60);

    expect(error).toBeInstanceOf(AppError);
    expect(error.retryAfter).toBe(60);
  });
});
