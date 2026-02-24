# Data Analysis Skill

Use this skill whenever asked to explore, summarize, visualize, or model tabular data (CSV, Excel, parquet, etc.). **Default to R unless the user specifies Python.**

---

## General Approach

1. **Explore first** — always check dimensions, column types, and missing values before doing anything else. Don't assume column names or types from the filename alone.
2. **Summarize findings in plain English** before showing code or output.
3. **Ask before modeling** — confirm the target variable and evaluation metric before fitting any model.

---

## R Conventions (primary)

- Use `tidyverse` for wrangling, `ggplot2` for visualization
- If the data size is large and efficiency might be important, use data.table as the primary data wrangling tool.
- Use `here::here()` for all file paths — never hardcode absolute paths
- Use `janitor::clean_names()` on import to normalize column names
- Use `skimr::skim()` for a rich summary instead of bare `summary()`
- Prefer `|>` (native pipe) over `%>%` unless the project already uses magrittr

### Standard exploration block

```r
library(tidyverse)
library(here)
library(janitor)
library(skimr)

df <- read_csv(here("data", "input.csv")) |>
  clean_names()

glimpse(df)
skim(df)
```

### Wrangling patterns

```r
# Filter, mutate, summarise
df |>
  filter(!is.na(value)) |>
  mutate(value_log = log1p(value)) |>
  group_by(category) |>
  summarise(
    n       = n(),
    mean    = mean(value_log),
    median  = median(value_log),
    .groups = "drop"
  )

# Check for duplicate rows
df |> janitor::get_dupes()

# Check join safety — verify row counts before and after
nrow(df)
df_joined <- df |> left_join(lookup, by = "id")
nrow(df_joined)  # should match if join key is unique in lookup
```

### ggplot2 conventions

```r
library(ggplot2)
library(cowplot)

font <- 'Roboto Condensed'

df |>
  ggplot(aes(x = category, y = value, fill = category)) +
  geom_boxplot(alpha = 0.7, outlier.shape = 21) +
  scale_fill_viridis_d() +
  labs(
    title  = "Value by Category",
    x      = NULL,
    y      = "Value",
    fill   = NULL
  ) +
  # Preferred theme conventions:
  theme_minimal_grid(font_family = font, font_size = 16) +
  theme(
    strip.background = element_rect("grey80"),
    panel.grid.minor = element_blank(),
    plot.title.position = "plot",
    legend.position = c(0.02, 0.88),
    legend.justification = c(0, 1),
    legend.background = element_rect(
      fill = "white", color = "black", size = 0.2
    ),
    legend.margin = margin(6, 6, 6, 6),
    panel.background = element_rect(fill = 'white', color = NA),
    plot.background = element_rect(fill = 'white', color = NA)
  ) +
  panel_border()

ggsave(here("figs", "value_by_category.png"),
       width = 8, height = 5, dpi = 300)
```

### Common gotchas in R

- Numeric columns read as character when they contain commas: use `readr::parse_number()`
- Dates often need explicit format: `lubridate::dmy()` or `ymd()` — don't rely on auto-parse
- `summary()` hides NAs in character columns; `skim()` surfaces them
- `left_join()` can silently fan out rows if the right table has duplicate keys — always check

---

## Python Conventions (secondary — use only if requested)

- Use `pandas` for wrangling, `polars` for large files (>500k rows)
- Use `matplotlib` for quick plots, `seaborn` for statistical plots
- Always set `random_state=42` for reproducibility
- Prefer `pathlib.Path` over string paths

```python
import pandas as pd
from pathlib import Path

df = pd.read_csv(Path("data/input.csv"))
print(df.shape)
print(df.dtypes)
print(df.isnull().sum())
print(df.head())
```

---

## Output Conventions

- Save plots to `figs/` as `.png` at 300 dpi minimum
- Save cleaned/processed data to `data/` as `.csv` or `.parquet`, depending on size (larger files save to parquet)
- Always print or comment a brief summary of what was done at the end of the script
