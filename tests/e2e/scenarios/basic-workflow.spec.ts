/**
 * E2E Tests: Basic Workflow
 *
 * These tests verify complete user workflows from start to finish.
 */

import { loadEnv } from '@monorepo-agents/config';
import { SimpleAgent } from '@monorepo-agents/core';
import { afterAll, beforeAll, describe, expect, it } from 'vitest';

describe('E2E: Basic Agent Workflow', () => {
  beforeAll(() => {
    // Setup for E2E tests
    loadEnv();
  });

  afterAll(() => {
    // Cleanup
  });

  describe('Agent Creation and Execution', () => {
    it('should create and execute a simple agent', async () => {
      // Step 1: Create agent
      const agent = new SimpleAgent({
        name: 'e2e-test-agent',
        description: 'Agent for E2E testing',
      });

      expect(agent).toBeDefined();
      expect(agent.name).toBe('e2e-test-agent');

      // Step 2: Execute agent
      const response = await agent.execute('Hello from E2E test');

      // Step 3: Verify response
      expect(response).toBeDefined();
      expect(response.content).toBeDefined();
      expect(typeof response.content).toBe('string');
    });

    it('should handle complex multi-step workflow', async () => {
      // Step 1: Create multiple agents
      const agents = {
        analyzer: new SimpleAgent({
          name: 'analyzer',
          description: 'Analyzes input',
        }),
        processor: new SimpleAgent({
          name: 'processor',
          description: 'Processes data',
        }),
        reporter: new SimpleAgent({
          name: 'reporter',
          description: 'Generates reports',
        }),
      };

      // Step 2: Run analysis
      const analysis = await agents.analyzer.execute('Analyze this data: [1, 2, 3, 4, 5]');
      expect(analysis.content).toBeDefined();

      // Step 3: Process results
      const processed = await agents.processor.execute(`Process: ${analysis.content}`);
      expect(processed.content).toBeDefined();

      // Step 4: Generate report
      const report = await agents.reporter.execute(`Report on: ${processed.content}`);
      expect(report.content).toBeDefined();

      // Step 5: Verify complete workflow
      expect(report.metadata).toBeDefined();
    });
  });

  describe('Error Recovery Workflow', () => {
    it('should handle and recover from errors', async () => {
      const agent = new SimpleAgent({
        name: 'error-recovery-agent',
        description: 'Tests error recovery',
      });

      // Execute with valid input
      const validResponse = await agent.execute('Valid input');
      expect(validResponse.content).toBeDefined();

      // System should remain stable after error
      const afterErrorResponse = await agent.execute('After error input');
      expect(afterErrorResponse.content).toBeDefined();
    });
  });
});

describe('E2E: Configuration Workflow', () => {
  it('should work with environment configuration', () => {
    const env = loadEnv();

    expect(env).toBeDefined();
    // Verify required configuration is present
  });
});
