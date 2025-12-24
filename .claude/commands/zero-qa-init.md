# Initialize Zero-QA Project Configuration

Initialize Zero-QA practices and configuration for quality-first development.

## Instructions

1. Create the `.zero-qa/` directory structure:

   ```
   .zero-qa/
   ├── config.json
   ├── checklists/
   │   ├── code-review.md
   │   ├── definition-of-done.md
   │   └── pre-commit.md
   └── reports/
       └── README.md
   ```

2. Create `config.json` with default settings:

   ```json
   {
     "enabled": true,
     "autoReview": true,
     "qualityGates": {
       "testCoverage": 80,
       "lintErrors": 0,
       "typeErrors": 0,
       "securityVulnerabilities": 0
     },
     "checks": {
       "lint": true,
       "typeCheck": true,
       "unitTests": true,
       "integrationTests": true,
       "securityScan": true
     },
     "reviewCriteria": {
       "codeComplexity": 10,
       "functionLength": 50,
       "fileLength": 300
     }
   }
   ```

3. Create checklist templates:
   - `checklists/code-review.md` - Automated code review checklist
   - `checklists/definition-of-done.md` - DoD checklist for features
   - `checklists/pre-commit.md` - Pre-commit verification steps

4. Create `reports/README.md` explaining report storage.

5. Add Zero-QA scripts to package.json if not present:
   ```json
   {
     "scripts": {
       "zero-qa": "pnpm lint && pnpm type-check && pnpm test",
       "zero-qa:full": "pnpm zero-qa && pnpm test:e2e"
     }
   }
   ```

## Output

Confirm the Zero-QA structure has been initialized and provide a summary of:

- Created directories and files
- Quality gate thresholds configured
- Next steps for the team
