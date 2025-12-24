/**
 * Unit Tests: Core Utilities
 */

import { debounce, deepClone, generateId, isDefined, retry, sleep, truncate } from '@monorepo/core';
import { describe, expect, it, vi } from 'vitest';

describe('Core Utilities', () => {
  describe('generateId', () => {
    it('should generate unique IDs', () => {
      const id1 = generateId();
      const id2 = generateId();

      expect(id1).toBeDefined();
      expect(id2).toBeDefined();
      expect(id1).not.toBe(id2);
    });

    it('should generate string IDs', () => {
      const id = generateId();
      expect(typeof id).toBe('string');
    });
  });

  describe('sleep', () => {
    it('should pause execution', async () => {
      const start = Date.now();
      await sleep(50);
      const elapsed = Date.now() - start;

      expect(elapsed).toBeGreaterThanOrEqual(45);
    });
  });

  describe('retry', () => {
    it('should retry on failure', async () => {
      let attempts = 0;
      const fn = vi.fn(async () => {
        attempts++;
        if (attempts < 3) throw new Error('Fail');
        return 'success';
      });

      const result = await retry(fn, { maxRetries: 3, baseDelay: 10 });

      expect(result).toBe('success');
      expect(attempts).toBe(3);
    });

    it('should throw after max retries', async () => {
      const fn = vi.fn(async () => {
        throw new Error('Always fails');
      });

      await expect(retry(fn, { maxRetries: 2, baseDelay: 10 })).rejects.toThrow('Always fails');
    });
  });

  describe('truncate', () => {
    it('should truncate long text', () => {
      const result = truncate('Hello World', 8);
      expect(result).toBe('Hello...');
    });

    it('should not truncate short text', () => {
      const result = truncate('Hello', 10);
      expect(result).toBe('Hello');
    });
  });

  describe('deepClone', () => {
    it('should deep clone objects', () => {
      const original = { a: 1, b: { c: 2 } };
      const clone = deepClone(original);

      expect(clone).toEqual(original);
      expect(clone).not.toBe(original);
      expect(clone.b).not.toBe(original.b);
    });
  });

  describe('isDefined', () => {
    it('should return true for defined values', () => {
      expect(isDefined(0)).toBe(true);
      expect(isDefined('')).toBe(true);
      expect(isDefined(false)).toBe(true);
    });

    it('should return false for null/undefined', () => {
      expect(isDefined(null)).toBe(false);
      expect(isDefined(undefined)).toBe(false);
    });
  });

  describe('debounce', () => {
    it('should debounce function calls', async () => {
      const fn = vi.fn();
      const debounced = debounce(fn, 50);

      debounced();
      debounced();
      debounced();

      expect(fn).not.toHaveBeenCalled();

      await sleep(60);

      expect(fn).toHaveBeenCalledTimes(1);
    });
  });
});
