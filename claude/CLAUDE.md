# Claude Global Instructions

## Skills

Before starting any task, check if a relevant skill exists and read it before writing
any code or files.

Skills are organized as one folder per skill type, each containing a `SKILL.md` file.

### How to find skills

Fetch the skills index from:

```
~/.claude/skills
```

List subdirectories, then read `<skill-name>/SKILL.md` for any that match the task.

### When to read a skill

- Match the task to a skill folder name
- If multiple skills seem relevant, read all of them
- If no skill matches, proceed with your best judgment
- You do not need to read skills for casual conversation or simple one-off questions

### Adding new skills

New skill folders added to the repo will be discovered automatically — no need to update
these instructions.

## Project instructions

Always check for a `CLAUDE.md` file in the current project directory or its parents for
project-specific instructions. These take precedence over global instructions where they
conflict.

## Using R

When working with R:

- Use `btw_tool_session_*` and `btw_tool_env_*` tools to inspect the active R session
  before making assumptions about loaded data or packages
- Prefer tidyverse packages over base R equivalents
- Use the native pipe `|>` instead of `%>%`
- Prefer `purrr` for iteration over `apply` family functions
- Use `here::here()` for file paths, never hardcode absolute paths
- If data frame is large, or if you detect use of data.table syntax, then use data.table for efficiency over tidyverse approaches.

## Response style

- Be concise — avoid unnecessary explanation or preamble

## ast-grep with R support

R language support is configured globally via `~/.config/ast-grep/sgconfig.yml`.

Usage:
\```bash
sg -l r -p 'pattern' .
\```

Note: Use `_VAR` for named metavariables and `___` for wildcards (not `$VAR`) because R uses `$` for column access.

