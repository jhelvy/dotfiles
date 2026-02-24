# Claude Global Instructions

## Skills

Before starting any task, check if a relevant skill exists and read it before writing
any code or files.

Skills are organized as one folder per skill type, each containing a `SKILL.md` file.

### How to find skills

**Step 1 — try the remote repo first (most up to date):**
Fetch the skills index from GitHub:
https://raw.githubusercontent.com/jhelvy/dotfiles/main/skills/

List available skill folders, then fetch the raw content of any relevant SKILL.md like:
https://raw.githubusercontent.com/jhelvy/dotfiles/main/skills/<skill-name>/SKILL.md

**Step 2 — fall back to local if remote is unavailable** (e.g. no internet):
```
/Users/jhelvy/gh/dotfiles/skills/
```
List subdirectories, then read `<skill-name>/SKILL.md` for any that match the task.

### When to read a skill

- Match the task to a skill folder name (e.g. a data wrangling task → `data-analysis`)
- If multiple skills seem relevant, read all of them
- If no skill matches, proceed with your best judgment
- You do not need to read skills for casual conversation or simple one-off questions

### Adding new skills

New skill folders added to the repo will be discovered automatically — no need to update
these instructions.
