const colors = {
  reset: '\x1b[0m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
  magenta: '\x1b[35m',
  cyan: '\x1b[36m',
  red: '\x1b[31m',
};

function getMethodColor(method: string): string {
  const methodColors: Record<string, string> = {
    GET: colors.green,
    POST: colors.blue,
    PUT: colors.yellow,
    DELETE: colors.red,
    PATCH: colors.magenta,
    OPTIONS: colors.cyan,
  };
  return methodColors[method] || colors.reset;
}

function getStatusColor(status: number): string {
  if (status >= 500) return colors.red;
  if (status >= 400) return colors.yellow;
  if (status >= 300) return colors.cyan;
  if (status >= 200) return colors.green;
  return colors.reset;
}

export function logRequest(req: Request, status: number, duration: number): void {
  const method = req.method;
  const url = new URL(req.url);
  const path = url.pathname;
  const timestamp = new Date().toISOString();

  const methodColor = getMethodColor(method);
  const statusColor = getStatusColor(status);

  console.log(
    `${colors.cyan}[${timestamp}]${colors.reset} ` +
      `${methodColor}${method.padEnd(7)}${colors.reset} ` +
      `${path} ` +
      `${statusColor}${status}${colors.reset} ` +
      `${colors.magenta}${duration.toFixed(2)}ms${colors.reset}`
  );
}
