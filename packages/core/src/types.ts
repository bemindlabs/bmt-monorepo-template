/**
 * Core types for the monorepo
 */

/**
 * Generic configuration interface
 */
export interface BaseConfig {
  name: string;
  description?: string;
  options?: Record<string, unknown>;
}

/**
 * Result type for operations that can fail
 */
export type Result<T, E = Error> = { success: true; data: T } | { success: false; error: E };

/**
 * Async result type
 */
export type AsyncResult<T, E = Error> = Promise<Result<T, E>>;

/**
 * Logger interface
 */
export interface Logger {
  debug(message: string, ...args: unknown[]): void;
  info(message: string, ...args: unknown[]): void;
  warn(message: string, ...args: unknown[]): void;
  error(message: string, ...args: unknown[]): void;
}

/**
 * Event emitter interface
 */
export interface EventEmitter<T extends Record<string, unknown[]>> {
  on<K extends keyof T>(event: K, listener: (...args: T[K]) => void): void;
  off<K extends keyof T>(event: K, listener: (...args: T[K]) => void): void;
  emit<K extends keyof T>(event: K, ...args: T[K]): void;
}
