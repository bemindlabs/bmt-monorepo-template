/**
 * @monorepo/config
 * Configuration and environment utilities
 */

import { config } from 'dotenv';
import { z } from 'zod';

// Load environment variables
config();

/**
 * Environment schema
 */
const envSchema = z.object({
  NODE_ENV: z.enum(['development', 'production', 'test']).default('development'),
  LOG_LEVEL: z.enum(['debug', 'info', 'warn', 'error']).default('info'),
});

export type Env = z.infer<typeof envSchema>;

/**
 * Parse and validate environment variables
 */
export function getEnv(): Env {
  const result = envSchema.safeParse(process.env);

  if (!result.success) {
    console.error('Invalid environment variables:', result.error.format());
    throw new Error('Invalid environment configuration');
  }

  return result.data;
}

/**
 * Check if running in development mode
 */
export function isDev(): boolean {
  return getEnv().NODE_ENV === 'development';
}

/**
 * Check if running in production mode
 */
export function isProd(): boolean {
  return getEnv().NODE_ENV === 'production';
}

/**
 * Check if running in test mode
 */
export function isTest(): boolean {
  return getEnv().NODE_ENV === 'test';
}

export { envSchema };
