# LLM Fuzzy Joins Project

## Project Overview
- Paper: "Matching Without Meaning: LLM Entity Matchers Rely on Non-Essential Semantic Priors"
- Target: IEEE TKDE
- Paper source: `source/bare_jrnl.tex`
- Experiment code: `/Users/jhelvy/gh/research/fuzzy-join-llm/`
- Charts script: `scripts/charts.R` (uses cowplot, tidyverse, Roboto Condensed font)
- CV threshold script: `scripts/cv_threshold.py` (5-fold CV, generates cv_results.csv)
- Analysis script: `scripts/analyze_results.py` (generates summary.csv)
- Virtual env at `.venv/` in the repo

## Experiment Status (as of 2026-06-17)
ALL RUNS COMPLETE. See `memory/experiment-status.md` for full details.

## Code Changes Made This Session
- `scripts/methods.py`: Fixed checkpoint resume to drop failed rows (empty pred + zero score) so retries work after laptop sleep. Added connection/network errors to retry logic.
- `scripts/charts.R`: Updated robustness chart to GPT-4o vs GPT-4o-mini only (Amazon-Google), all transformations as points+errorbars. Updated prompt comparison chart to single facet_grid(model ~ dataset). Main F1/PR charts exclude expensive models.
- `scripts/analyze_results.py`: matplotlib import optional (HAS_PLOT flag), cost/latency in summary, dropna for incomplete checkpoints.

## Charts Structure (charts.R)
1. **f1_comparison.png** - F1 by transformation, facet_grid(method ~ dataset), excludes expensive models. Baseline vertical bar for Original.
2. **precision_recall_scatter.png** - PR scatter, facet_grid(method ~ dataset), excludes expensive models.
3. **llm_robustness.png** - GPT-4o vs GPT-4o-mini, Amazon-Google only, all 4 transformations as dodged points+errorbars. `facet_wrap(~ dataset)`.
4. **llm_prompt_comparison.png** - Standard vs Token Fallback, `facet_grid(model ~ dataset)`, dodged by prompt. Models: GPT-4o-mini, Claude Haiku.
- `expensive_methods` list excludes `llm_claude` and `llm_gpt4o` from main charts
- `clean_labels()` uses `case_match()` with two-line labels (e.g., `'GPT-4o-mini\nStandard'`)

## Known Data Issues
- `results/amazon-google/llm_claude/ciphered_letters.parquet` is BAD (all zeros, from billing outage). Should be deleted or excluded. F1=0.000 row in cv_results.csv.
- Sonnet runs abandoned due to Anthropic billing issues. Robustness chart uses GPT family only.

## User Preferences
- **Status updates**: Always check actual parquet files on disk, never rely on task output buffers.
- **No git commands**: User handles all git operations.
- **No rendering**: User runs `charts.R` themselves.
- **Resume, don't restart**: On failed runs, trim bad rows from checkpoint and resume, don't delete and re-run from scratch.
