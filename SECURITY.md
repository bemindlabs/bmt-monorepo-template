# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | :white_check_mark: |

## Reporting a Vulnerability

We take security seriously. If you discover a security vulnerability, please follow these steps:

### 1. Do Not Disclose Publicly

Please do not create a public GitHub issue for security vulnerabilities.

### 2. Report Privately

Send a detailed report to: [info@bemind.tech](mailto:info@bemind.tech)

Include:

- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

### 3. Response Timeline

- **Initial Response:** Within 48 hours
- **Status Update:** Within 7 days
- **Resolution:** Depends on severity

### 4. Disclosure Policy

- We will acknowledge your report within 48 hours
- We will provide a timeline for the fix
- We will notify you when the vulnerability is fixed
- We will credit you in the release notes (unless you prefer to remain anonymous)

## Security Best Practices

When using this template:

1. **Environment Variables**
   - Never commit `.env` files
   - Use secrets management in production
   - Rotate API keys regularly

2. **Dependencies**
   - Run `pnpm audit` regularly
   - Keep dependencies updated
   - Review security advisories

3. **Docker**
   - Use non-root users in containers
   - Scan images for vulnerabilities
   - Keep base images updated

4. **Kubernetes**
   - Use RBAC properly
   - Don't store secrets in manifests
   - Enable network policies

5. **Firebase**
   - Review security rules carefully
   - Test rules before deploying
   - Monitor for suspicious activity

## Security Features

This template includes:

- **Husky hooks** - Pre-commit security checks
- **ESLint security rules** - Static code analysis
- **Dependency auditing** - Via `pnpm audit`
- **Non-root Docker** - Secure container defaults
- **Firestore rules** - Default deny security model

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)** | [info@bemind.tech](mailto:info@bemind.tech)
