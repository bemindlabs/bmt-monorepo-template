# Pull Request

## Description

<!-- Provide a clear and concise description of your changes -->

## Type of Change

<!-- Mark the relevant option with an "x" -->

- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Refactoring (code changes that neither fix a bug nor add a feature)
- [ ] Documentation update
- [ ] Performance improvement
- [ ] Configuration change
- [ ] Dependency update
- [ ] Other (please describe):

## Related Issues

<!-- Link related issues using keywords: Fixes #123, Closes #456, Relates to #789 -->

Fixes #

## Component(s) Affected

<!-- Check all that apply -->

- [ ] Platform (API Gateway)
- [ ] Core Services (core, inventory, accounting, pos, bi)
- [ ] Domain Services (crm, hr, project, franchise, etc.)
- [ ] Integration Services (payment, ai, documents, etc.)
- [ ] Platform Services (marketing, loyalty, website, workflow, etc.)
- [ ] Web Applications
- [ ] Native Applications (mobile, desktop)
- [ ] Shared Packages
- [ ] Infrastructure (Docker, K8s, CI/CD)
- [ ] Documentation

## Changes Made

<!-- Provide a detailed list of changes -->

-
-
-

## Testing

### Manual Testing

<!-- Describe how you tested your changes -->

- [ ] Tested locally in development environment
- [ ] Tested with affected services running
- [ ] Verified database migrations (if applicable)
- [ ] Tested UI changes in multiple browsers (if applicable)
- [ ] Tested on mobile devices (if applicable)

### Automated Testing

- [ ] Unit tests added/updated
- [ ] Integration tests added/updated
- [ ] E2E tests added/updated (if applicable)
- [ ] All tests passing locally

### Test Coverage

<!-- Paste test coverage output if applicable -->

```
Current coverage: XX%
```

## Quality Checks

<!-- Ensure all checks pass before requesting review -->

- [ ] `pnpm type-check` passes
- [ ] `pnpm lint` passes
- [ ] `pnpm format` applied
- [ ] `pnpm test` passes (for affected packages)
- [ ] No new TypeScript errors introduced
- [ ] No console errors or warnings

## Documentation

- [ ] Code comments added/updated for complex logic
- [ ] JSDoc comments added for public APIs
- [ ] README updated (if applicable)
- [ ] API documentation updated (if applicable)
- [ ] CHANGELOG.md updated
- [ ] Migration guide created (for breaking changes)

## Database Changes

<!-- If your PR includes database changes -->

- [ ] Migration files created
- [ ] Migration tested (up and down)
- [ ] Seed data updated (if needed)
- [ ] Database changes documented

## Breaking Changes

<!-- If this PR includes breaking changes, list them here -->

### For API Changes

- [ ] API version bumped
- [ ] Deprecation notices added
- [ ] Migration path documented

### For Package Changes

- [ ] Package version bumped
- [ ] CHANGELOG updated with breaking changes
- [ ] Migration guide provided

## Deployment Notes

<!-- Any special deployment considerations -->

### Environment Variables

<!-- List any new or changed environment variables -->

```bash
# New variables
NEW_VAR=value

# Changed variables
EXISTING_VAR=new_value
```

### Dependencies

- [ ] No new dependencies
- [ ] New dependencies added (list below)
- [ ] Dependencies updated (list below)

### Infrastructure Changes

- [ ] Kubernetes configs updated
- [ ] Docker configs updated
- [ ] CI/CD pipelines updated
- [ ] No infrastructure changes

## Performance Impact

<!-- Describe any performance implications -->

- [ ] No performance impact
- [ ] Performance improved (describe)
- [ ] Potential performance concerns (describe)

## Security Considerations

<!-- Address any security implications -->

- [ ] No security impact
- [ ] Security improved (describe)
- [ ] New security measures added
- [ ] Security review needed

## Screenshots / Videos

<!-- If applicable, add screenshots or videos to demonstrate changes -->

### Before

### After

## Checklist

<!-- Ensure all items are completed before requesting review -->

- [ ] My code follows the project's coding standards
- [ ] I have performed a self-review of my code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings or errors
- [ ] I have added tests that prove my fix is effective or that my feature works
- [ ] New and existing unit tests pass locally with my changes
- [ ] Any dependent changes have been merged and published
- [ ] I have checked my code and corrected any misspellings
- [ ] I have read and followed the [CONTRIBUTING.md](../CONTRIBUTING.md) guidelines

## Reviewer Notes

<!-- Any specific areas you'd like reviewers to focus on -->

## Additional Context

<!-- Any other information that would be helpful for reviewers -->

---

**By submitting this pull request, I confirm that my contribution is made under the terms of the project license.**
