## Contributing Guidelines

### Code of Conduct
Be respectful. Assume positive intent. Help keep the project welcoming.

### Branching & Commits
- Create feature branches from `main`: `feat/<short-name>` or `fix/<short-name>`
- Write descriptive commits using imperative mood: `Add …`, `Fix …`, `Refactor …`

### Pull Requests
- PR title: concise summary; description: context, screenshots, and test notes
- Link related issues; keep PRs focused and reasonably sized

### Code Style
- PHP: Laravel conventions, PSR-12 formatting
- Naming: prefer descriptive, full words; functions are verbs, variables are nouns
- Types: add explicit types for public APIs; avoid `mixed/any` patterns
- Control flow: use guard clauses; handle edge cases early; avoid deep nesting
- Errors: meaningful exceptions; do not swallow errors silently
- Comments: explain the “why”; keep them concise; avoid inline noise
- Formatting: match existing style; wrap long lines; avoid unrelated reformatting

### Tests & QA
- Write/adjust tests for new behavior
- Run static analysis and linters (`pint`) and ensure no warnings

### Security
- Never commit secrets (API keys, service accounts). Use environment variables
- Use parameterized queries and framework validators; sanitize user content

### Migrations & Seeders
- Keep migrations idempotent and reversible
- Update seeders only if necessary; document default credentials in README

