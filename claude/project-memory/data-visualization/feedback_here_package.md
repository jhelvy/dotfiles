---
name: Use here package for file paths
description: User prefers the here package over hard-coded relative paths in R scripts
type: feedback
---

Always use `library(here)` and `here("path", "to", "file")` instead of hard-coded relative paths like `"data/file.csv"` in R scripts.

**Why:** User explicitly dislikes hard-coded paths ("I don't like using hard-coded paths for anything").

**How to apply:** Any time you write R code that reads or writes files, use `here()` for all paths. Include `library(here)` at the top with other library calls.
