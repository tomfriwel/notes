

https://github.com/alibaba/open-code-review

```sh
npm install -g @alibaba-group/open-code-review
ocr config provider          # Select a built-in provider or add a custom one
ocr config model             # Pick a model for the active provider

# Test Connectivity
ocr llm test

# Review
cd your-project

# Workspace mode — review all staged, unstaged, and untracked changes
ocr review

# Branch range — compare two refs
ocr review --from main --to feature-branch

# Single commit
ocr review --commit abc123

# Option 1: Install as a Skill
# Use npx to install the OCR skill into your project:
npx skills add alibaba/open-code-review --skill open-code-review



# Examples

# Interactive provider and model setup
ocr config provider
ocr config model
ocr llm providers

# Delete a custom provider
ocr config unset custom_providers.my-gateway

# Preview which files will be reviewed (no LLM calls)
ocr review --preview
ocr review -c abc123 -p

# Review workspace changes with default settings
ocr review

# Review branch diff with higher concurrency
ocr review --from main --to my-feature --concurrency 4

# Review a specific commit with verbose JSON output
ocr review --commit abc123 --format json --audience agent

# Select or override model for this review
ocr review --model claude-opus-4-6
ocr review --commit abc123 --model claude-sonnet-4-6

# Provide requirement context for more targeted review
ocr review --background "Adding rate limiting to the login API"

# Use custom review rules
ocr review --rule /path/to/my-rules.json

# Preview which rule applies to a file
ocr rules check src/main/java/com/example/Foo.java
ocr rules check --rule custom.json src/main/resources/mapper/UserMapper.xml

# View review session history in browser
ocr viewer
ocr viewer --addr :3000
```