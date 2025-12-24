/**
 * Unit Tests: Config Environment
 */

import { getEnv, isDev, isProd, isTest } from '@monorepo/config';
import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest';

describe('Environment Configuration', () => {
  const originalEnv = process.env;

  beforeEach(() => {
    vi.resetModules();
    process.env = { ...originalEnv };
    // Set default LOG_LEVEL to avoid validation errors
    process.env.LOG_LEVEL = 'info';
  });

  afterEach(() => {
    process.env = originalEnv;
  });

  describe('isDev', () => {
    it('should return true in development', () => {
      process.env.NODE_ENV = 'development';
      expect(isDev()).toBe(true);
    });

    it('should return false in production', () => {
      process.env.NODE_ENV = 'production';
      expect(isDev()).toBe(false);
    });
  });

  describe('isProd', () => {
    it('should return true in production', () => {
      process.env.NODE_ENV = 'production';
      expect(isProd()).toBe(true);
    });

    it('should return false in development', () => {
      process.env.NODE_ENV = 'development';
      expect(isProd()).toBe(false);
    });
  });

  describe('isTest', () => {
    it('should return true in test environment', () => {
      process.env.NODE_ENV = 'test';
      expect(isTest()).toBe(true);
    });

    it('should return false in production', () => {
      process.env.NODE_ENV = 'production';
      expect(isTest()).toBe(false);
    });
  });

  describe('getEnv', () => {
    it('should return environment configuration', () => {
      process.env.NODE_ENV = 'development';
      const env = getEnv();

      expect(env).toBeDefined();
      expect(env.NODE_ENV).toBe('development');
    });

    it('should have default values', () => {
      delete process.env.NODE_ENV;
      const env = getEnv();

      expect(env.NODE_ENV).toBe('development');
      expect(env.LOG_LEVEL).toBe('info');
    });
  });
});
