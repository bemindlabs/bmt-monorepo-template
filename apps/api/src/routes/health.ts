import type { ApiResponse, HealthStatus } from '../types';

const startTime = Date.now();
const VERSION = '0.1.1';

export function healthCheck(): Response {
  const health: HealthStatus = {
    status: 'healthy',
    timestamp: new Date().toISOString(),
    version: VERSION,
    uptime: Math.floor((Date.now() - startTime) / 1000),
  };

  const response: ApiResponse<HealthStatus> = {
    success: true,
    data: health,
  };

  return Response.json(response);
}
