# Initialize Scrum Project Structure

Initialize the scrum project structure for agile development.

## Instructions

1. Create the `.scrum/` directory structure:

   ```
   .scrum/
   ├── backlog/
   │   └── README.md
   ├── sprints/
   │   └── README.md
   ├── standups/
   │   └── README.md
   ├── retrospectives/
   │   └── README.md
   └── config.json
   ```

2. Create `config.json` with default settings:

   ```json
   {
     "sprintDuration": 14,
     "sprintPrefix": "sprint-",
     "team": [],
     "currentSprint": null
   }
   ```

3. Create README.md files in each directory explaining their purpose:
   - `backlog/README.md` - Product backlog items
   - `sprints/README.md` - Sprint folders with planning and tracking
   - `standups/README.md` - Daily standup notes
   - `retrospectives/README.md` - Sprint retrospective documents

4. Report the created structure to the user.

## Output

Confirm the scrum structure has been initialized and provide a summary of created files.
