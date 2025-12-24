import { generateId } from '@monorepo/core';
import { HTTP_STATUS } from '@monorepo/shared';
import type {
  ApiResponse,
  CreateUserInput,
  PaginatedResponse,
  UpdateUserInput,
  User,
} from '../types';

// In-memory store for demo purposes
const users: Map<string, User> = new Map();

// Seed some initial data
function seedUsers(): void {
  if (users.size === 0) {
    const seedData: CreateUserInput[] = [
      { name: 'Alice Johnson', email: 'alice@example.com' },
      { name: 'Bob Smith', email: 'bob@example.com' },
      { name: 'Charlie Brown', email: 'charlie@example.com' },
    ];

    seedData.forEach((input) => {
      const user = createUser(input);
      users.set(user.id, user);
    });
  }
}

function createUser(input: CreateUserInput): User {
  const now = new Date().toISOString();
  return {
    id: generateId(),
    name: input.name,
    email: input.email,
    createdAt: now,
    updatedAt: now,
  };
}

// Initialize seed data
seedUsers();

export function listUsers(req: Request): Response {
  const url = new URL(req.url);
  const page = parseInt(url.searchParams.get('page') || '1', 10);
  const limit = parseInt(url.searchParams.get('limit') || '10', 10);

  const allUsers = Array.from(users.values());
  const start = (page - 1) * limit;
  const paginatedUsers = allUsers.slice(start, start + limit);

  const response: PaginatedResponse<User> = {
    success: true,
    data: paginatedUsers,
    total: allUsers.length,
    page,
    limit,
  };

  return Response.json(response);
}

export function getUser(id: string): Response {
  const user = users.get(id);

  if (!user) {
    const response: ApiResponse = {
      success: false,
      error: 'User not found',
    };
    return Response.json(response, { status: HTTP_STATUS.NOT_FOUND });
  }

  const response: ApiResponse<User> = {
    success: true,
    data: user,
  };

  return Response.json(response);
}

export async function createUserHandler(req: Request): Promise<Response> {
  try {
    const input: CreateUserInput = await req.json();

    if (!input.name || !input.email) {
      const response: ApiResponse = {
        success: false,
        error: 'Name and email are required',
      };
      return Response.json(response, { status: HTTP_STATUS.BAD_REQUEST });
    }

    // Check for duplicate email
    const existingUser = Array.from(users.values()).find((u) => u.email === input.email);
    if (existingUser) {
      const response: ApiResponse = {
        success: false,
        error: 'Email already exists',
      };
      return Response.json(response, { status: HTTP_STATUS.BAD_REQUEST });
    }

    const user = createUser(input);
    users.set(user.id, user);

    const response: ApiResponse<User> = {
      success: true,
      data: user,
      message: 'User created successfully',
    };

    return Response.json(response, { status: HTTP_STATUS.CREATED });
  } catch {
    const response: ApiResponse = {
      success: false,
      error: 'Invalid JSON body',
    };
    return Response.json(response, { status: HTTP_STATUS.BAD_REQUEST });
  }
}

export async function updateUser(id: string, req: Request): Promise<Response> {
  const user = users.get(id);

  if (!user) {
    const response: ApiResponse = {
      success: false,
      error: 'User not found',
    };
    return Response.json(response, { status: HTTP_STATUS.NOT_FOUND });
  }

  try {
    const input: UpdateUserInput = await req.json();

    if (input.email) {
      const existingUser = Array.from(users.values()).find(
        (u) => u.email === input.email && u.id !== id
      );
      if (existingUser) {
        const response: ApiResponse = {
          success: false,
          error: 'Email already exists',
        };
        return Response.json(response, { status: HTTP_STATUS.BAD_REQUEST });
      }
    }

    const updatedUser: User = {
      ...user,
      name: input.name ?? user.name,
      email: input.email ?? user.email,
      updatedAt: new Date().toISOString(),
    };

    users.set(id, updatedUser);

    const response: ApiResponse<User> = {
      success: true,
      data: updatedUser,
      message: 'User updated successfully',
    };

    return Response.json(response);
  } catch {
    const response: ApiResponse = {
      success: false,
      error: 'Invalid JSON body',
    };
    return Response.json(response, { status: HTTP_STATUS.BAD_REQUEST });
  }
}

export function deleteUser(id: string): Response {
  const user = users.get(id);

  if (!user) {
    const response: ApiResponse = {
      success: false,
      error: 'User not found',
    };
    return Response.json(response, { status: HTTP_STATUS.NOT_FOUND });
  }

  users.delete(id);

  const response: ApiResponse = {
    success: true,
    message: 'User deleted successfully',
  };

  return Response.json(response);
}
