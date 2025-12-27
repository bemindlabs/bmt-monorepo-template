# AI PR Description Generator

**ID:** PBI-050
**Type:** Feature
**Priority:** Medium
**Points:** 5
**Category:** AI Automation
**Created:** 2025-12-27
**Status:** New
**GitHub Issue:** #6

## Description

As a developer, I want AI to generate comprehensive PR descriptions from my commits so that PRs are well-documented with minimal effort.

## Acceptance Criteria

- [ ] GitHub Actions workflow triggers on PR creation
- [ ] Analyzes all commits in the PR
- [ ] Generates structured PR description:
  - Summary of changes
  - Type of change (feat/fix/refactor/etc.)
  - Breaking changes if any
  - Testing notes
  - Screenshots placeholder for UI changes
- [ ] Updates PR body (if empty or template)
- [ ] Links related issues from commit messages

## Technical Notes

- Parse conventional commits
- Use Claude to summarize diff
- Respect PR templates
- Don't overwrite manual descriptions

## Dependencies

- GitHub Actions
- Claude API
