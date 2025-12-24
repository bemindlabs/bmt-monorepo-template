/**
 * Test Fixtures: Mock Responses
 *
 * Pre-defined mock responses for testing.
 */

import type { AgentResponse } from '@monorepo-agents/core';

// ============================================================================
// Mock Agent Responses
// ============================================================================

export const mockAgentResponse: AgentResponse = {
  content: 'This is a mock response from the agent.',
  metadata: {
    model: 'mock-model',
    tokens: {
      input: 10,
      output: 25,
    },
    latency: 150,
  },
};

export const mockErrorResponse = {
  error: {
    message: 'Mock error occurred',
    code: 'MOCK_ERROR',
  },
};

// ============================================================================
// Mock API Responses
// ============================================================================

export const mockAnthropicResponse = {
  id: 'msg_mock_123',
  type: 'message',
  role: 'assistant',
  content: [
    {
      type: 'text',
      text: 'Mock response from Claude',
    },
  ],
  model: 'claude-3-sonnet-20240229',
  usage: {
    input_tokens: 10,
    output_tokens: 20,
  },
};

export const mockOpenAIResponse = {
  id: 'chatcmpl-mock123',
  object: 'chat.completion',
  created: Date.now(),
  model: 'gpt-4',
  choices: [
    {
      index: 0,
      message: {
        role: 'assistant',
        content: 'Mock response from GPT',
      },
      finish_reason: 'stop',
    },
  ],
  usage: {
    prompt_tokens: 10,
    completion_tokens: 20,
    total_tokens: 30,
  },
};

export const mockGeminiResponse = {
  candidates: [
    {
      content: {
        parts: [
          {
            text: 'Mock response from Gemini',
          },
        ],
        role: 'model',
      },
      finishReason: 'STOP',
    },
  ],
  usageMetadata: {
    promptTokenCount: 10,
    candidatesTokenCount: 20,
    totalTokenCount: 30,
  },
};

// ============================================================================
// Mock Tool Responses
// ============================================================================

export const mockToolResponse = {
  name: 'search',
  result: {
    success: true,
    data: ['Result 1', 'Result 2', 'Result 3'],
  },
};

// ============================================================================
// Mock Configuration
// ============================================================================

export const mockConfig = {
  name: 'test-agent',
  description: 'A test agent',
  model: 'test-model',
  temperature: 0.7,
  maxTokens: 1000,
};
