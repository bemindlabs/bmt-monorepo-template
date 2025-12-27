# GitHub Projects Automation

**ID:** PBI-053
**Type:** Feature
**Priority:** Medium
**Points:** 8
**Category:** AI Automation
**Created:** 2025-12-27
**Status:** New

## Description

As a project manager, I want AI to automate GitHub Projects workflows so that project boards stay updated and sprints are managed efficiently.

## Acceptance Criteria

- [ ] Sync local `.scrum/backlog/` to GitHub Issues
- [ ] Auto-move issues through project columns:
  - New → Backlog (on issue creation)
  - Backlog → In Progress (on branch creation)
  - In Progress → Review (on PR creation)
  - Review → Done (on PR merge)
- [ ] Update sprint milestones
- [ ] Generate sprint reports from project data
- [ ] AI-powered sprint planning suggestions

## Technical Notes

- Use GitHub Projects V2 GraphQL API
- Bidirectional sync with local backlog
- Respect manual overrides
- Track velocity metrics

## Dependencies

- GitHub Projects enabled
- GitHub Actions
