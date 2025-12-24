import { getOpenApiSpec, getSwaggerUI } from '../docs/openapi';
import { healthCheck } from './health';
import { createUserHandler, deleteUser, getUser, listUsers, updateUser } from './users';

export interface RouteMatch {
  handler: (req: Request, params?: Record<string, string>) => Promise<Response> | Response;
  params?: Record<string, string>;
}

function matchPath(
  pattern: string,
  path: string
): { match: boolean; params: Record<string, string> } {
  const patternParts = pattern.split('/').filter(Boolean);
  const pathParts = path.split('/').filter(Boolean);

  if (patternParts.length !== pathParts.length) {
    return { match: false, params: {} };
  }

  const params: Record<string, string> = {};

  for (let i = 0; i < patternParts.length; i++) {
    const patternPart = patternParts[i];
    const pathPart = pathParts[i];

    if (patternPart.startsWith(':')) {
      params[patternPart.slice(1)] = pathPart;
    } else if (patternPart !== pathPart) {
      return { match: false, params: {} };
    }
  }

  return { match: true, params };
}

export function matchRoute(method: string, path: string): RouteMatch | null {
  const routes: Array<{
    method: string;
    pattern: string;
    handler: (req: Request, params?: Record<string, string>) => Promise<Response> | Response;
  }> = [
    // Health
    { method: 'GET', pattern: '/health', handler: healthCheck },

    // Documentation
    { method: 'GET', pattern: '/docs', handler: getOpenApiSpec },
    { method: 'GET', pattern: '/docs/ui', handler: getSwaggerUI },

    // Users
    { method: 'GET', pattern: '/users', handler: listUsers },
    {
      method: 'GET',
      pattern: '/users/:id',
      handler: (_req, params) => getUser(params!.id),
    },
    { method: 'POST', pattern: '/users', handler: createUserHandler },
    {
      method: 'PUT',
      pattern: '/users/:id',
      handler: (req, params) => updateUser(params!.id, req),
    },
    {
      method: 'DELETE',
      pattern: '/users/:id',
      handler: (_req, params) => deleteUser(params!.id),
    },
  ];

  for (const route of routes) {
    if (route.method !== method) continue;

    const { match, params } = matchPath(route.pattern, path);
    if (match) {
      return { handler: route.handler, params };
    }
  }

  return null;
}
