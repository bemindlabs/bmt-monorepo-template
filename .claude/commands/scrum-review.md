# Conduct Sprint Review

Conduct a sprint review to demonstrate completed work.

## Instructions

1. Check for the current sprint in `.scrum/config.json`

2. Read the sprint folder at `.scrum/sprints/{current-sprint}/`

3. Generate a sprint review document with:

   ```markdown
   # Sprint {N} Review

   **Date:** {YYYY-MM-DD}
   **Sprint Goal:** {goal}

   ## Completed Items

   | ID  | Title | Type | Points |
   | --- | ----- | ---- | ------ |

   ## Demo Notes

   -

   ## Incomplete Items

   | ID  | Title | Reason | Action |
   | --- | ----- | ------ | ------ |

   ## Stakeholder Feedback

   -

   ## Sprint Metrics

   - Planned: {X} points
   - Completed: {Y} points
   - Velocity: {Z}
   ```

4. List all completed user stories and their acceptance criteria status

5. Identify any incomplete items and reasons

## Arguments

- `$ARGUMENTS` - Optional: specific items to highlight or stakeholder feedback

## Output

Generate the sprint review summary and highlight key accomplishments.
