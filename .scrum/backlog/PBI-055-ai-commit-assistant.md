# AI Commit Message Assistant

**ID:** PBI-055
**Type:** Feature
**Priority:** Medium
**Points:** 3
**Category:** AI Automation
**Created:** 2025-12-27
**Status:** New
**GitHub Issue:** #11

## Description

As a developer, I want AI to suggest conventional commit messages based on my staged changes so that commit history is consistent and meaningful.

## Acceptance Criteria

- [ ] Git hook integration for commit-msg
- [ ] Analyzes staged diff to determine:
  - Change type (feat/fix/refactor/etc.)
  - Affected scope (package/component)
  - Change description
- [ ] Suggests commit message following Conventional Commits
- [ ] Interactive mode for refinement
- [ ] Batch mode for CI/CD

## Technical Notes

- Use Claude Code `/git-commit` skill as reference
- Respect existing commitlint config
- Allow user override
- Cache suggestions for performance

## Dependencies

- Husky git hooks
- Commitlint configuration
