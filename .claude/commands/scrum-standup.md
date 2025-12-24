# Record Daily Standup Notes

Record daily standup notes for the team.

## Instructions

1. Check for the current sprint in `.scrum/config.json`

2. Create or update the standup file at:

   ```
   .scrum/standups/{YYYY-MM-DD}.md
   ```

3. Use this template:

   ```markdown
   # Daily Standup - {YYYY-MM-DD}

   **Sprint:** {current-sprint}

   ## Team Updates

   ### {Team Member}

   ## **Yesterday:**

   ## **Today:**

   **Blockers:**

   - None

   ---

   ## Summary

   - Active blockers:
   - Items in progress:
   - Items completed today:
   ```

4. If user provides standup information, parse and add it to the appropriate sections

5. Highlight any blockers that need immediate attention

## Arguments

- `$ARGUMENTS` - Optional: standup updates in format "yesterday: X, today: Y, blockers: Z"

## Output

Record the standup notes and summarize any blockers or concerns.
