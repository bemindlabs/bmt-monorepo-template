import { addCorsHeaders, handleCors } from './middleware/cors';
import { logRequest } from './middleware/logger';
import { matchRoute } from './routes';
import type { ApiResponse } from './types';

const PORT = 3010;
const VERSION = '0.1.1';

function getApiInfo(): Response {
  const info = {
    name: 'BMT Monorepo API',
    version: VERSION,
    description: 'Sample REST API built with Bun',
    endpoints: {
      health: '/health',
      docs: '/docs',
      docsUI: '/docs/ui',
      users: '/users',
    },
    links: {
      github: 'https://github.com/bemindlabs/bmt-monorepo-template',
      documentation: '/docs/ui',
    },
  };

  const response: ApiResponse<typeof info> = {
    success: true,
    data: info,
  };

  return Response.json(response);
}

function notFound(): Response {
  const response: ApiResponse = {
    success: false,
    error: 'Not Found',
  };
  return Response.json(response, { status: 404 });
}

const server = Bun.serve({
  port: PORT,
  async fetch(req) {
    const startTime = performance.now();
    const url = new URL(req.url);
    const path = url.pathname;
    const method = req.method;

    // Handle CORS preflight
    const corsResponse = handleCors(req);
    if (corsResponse) {
      logRequest(req, 204, performance.now() - startTime);
      return corsResponse;
    }

    let response: Response;

    try {
      // Root endpoint
      if (path === '/' && method === 'GET') {
        response = getApiInfo();
      } else {
        // Match route
        const match = matchRoute(method, path);
        if (match) {
          response = await match.handler(req, match.params);
        } else {
          response = notFound();
        }
      }
    } catch (error) {
      console.error('Request error:', error);
      const errorResponse: ApiResponse = {
        success: false,
        error: 'Internal Server Error',
      };
      response = Response.json(errorResponse, { status: 500 });
    }

    // Add CORS headers and log
    response = addCorsHeaders(response);
    logRequest(req, response.status, performance.now() - startTime);

    return response;
  },
});

console.log(`
  ╔══════════════════════════════════════════════════╗
  ║                                                  ║
  ║   🚀 BMT Monorepo API v${VERSION}                  ║
  ║                                                  ║
  ║   Server running at:                             ║
  ║   → http://localhost:${PORT}                       ║
  ║                                                  ║
  ║   Endpoints:                                     ║
  ║   → GET  /           API info                    ║
  ║   → GET  /health     Health check                ║
  ║   → GET  /docs       OpenAPI spec                ║
  ║   → GET  /docs/ui    Swagger UI                  ║
  ║   → GET  /users      List users                  ║
  ║   → POST /users      Create user                 ║
  ║   → GET  /users/:id  Get user                    ║
  ║   → PUT  /users/:id  Update user                 ║
  ║   → DELETE /users/:id Delete user                ║
  ║                                                  ║
  ╚══════════════════════════════════════════════════╝
`);

export default server;
