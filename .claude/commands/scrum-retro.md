# Conduct Sprint Retrospective

Conduct a sprint retrospective to reflect on the past sprint.

## Instructions

1. Check for the current sprint in `.scrum/config.json`

2. Create a retrospective document in `.scrum/retrospectives/` with the format:

   ```
   retro-{sprint-number}-{date}.md
   ```

3. Use this template structure:

   ```markdown
   # Sprint {N} Retrospective

   **Date:** {YYYY-MM-DD}
   **Sprint:** {sprint-name}
   **Participants:** {team members}

   ## What Went Well

   -

   ## What Could Be Improved

   -

   ## Action Items

   - [ ]

   ## Key Metrics

   - Velocity:
   - Completed Stories:
   - Carry-over Items:
   ```

4. If user provides input, populate the sections accordingly

5. Summarize action items and suggest improvements for the next sprint

## Arguments

- `$ARGUMENTS` - Optional: specific topics or feedback to include

## Output

Create the retrospective document and provide a summary of insights and action items.
