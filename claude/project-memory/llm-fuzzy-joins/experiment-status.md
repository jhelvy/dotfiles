# Experiment Status (2026-06-17)

## Completed Runs

### GPT-4o-mini Standard Prompt (`llm`)
| Dataset | original | ciphered_letters | ciphered_words | scrambled |
|---|---|---|---|---|
| Abt-Buy | done | done | done | done |
| Amazon-Google | done | done | done | done |

### GPT-4o-mini Token Fallback (`llm_gpt4o_mini_token_fallback`)
| Dataset | original | ciphered_letters | ciphered_words | scrambled |
|---|---|---|---|---|
| Abt-Buy | N/A | done | done | done |
| Amazon-Google | N/A | done | done | done |
Note: No "original" condition exists for this method (not needed - standard prompt covers it).

### Claude Haiku Standard Prompt (`llm_haiku`)
| Dataset | original | ciphered_letters | ciphered_words | scrambled |
|---|---|---|---|---|
| Abt-Buy | done | done | done | done |
| Amazon-Google | done | done | done | done |

### Claude Haiku Token Fallback (`llm_haiku_token_fallback`)
| Dataset | original | ciphered_letters | ciphered_words | scrambled |
|---|---|---|---|---|
| Abt-Buy | done | done | done | done |
| Amazon-Google | done | done | done | done |

### GPT-4o Standard Prompt (`llm_gpt4o`) - for robustness chart
| Dataset | original | ciphered_letters | ciphered_words | scrambled |
|---|---|---|---|---|
| Abt-Buy | done | - | - | - |
| Amazon-Google | done | done | done | done |

### Claude Sonnet Standard Prompt (`llm_claude`) - limited/abandoned
| Dataset | original | ciphered_letters | ciphered_words | scrambled |
|---|---|---|---|---|
| Abt-Buy | done | - | - | - |
| Amazon-Google | done | BAD (billing) | - | - |

### Non-LLM Methods (all datasets x all transformations complete)
- jaro_winkler, levenshtein, monge_elkan, tfidf, soft_tfidf
- openai_embeddings, sentence_transformer

## Key F1 Results (CV, Amazon-Google)

### GPT-4o vs GPT-4o-mini (robustness comparison)
| Transformation | GPT-4o | GPT-4o-mini |
|---|---|---|
| Original | 0.904 | 0.821 |
| Ciphered Letters | 0.749 | 0.582 |
| Ciphered Words | 0.751 | 0.576 |
| Scrambled | 0.850 | 0.555 |

### Standard vs Token Fallback (prompt comparison, Amazon-Google)
| Method | Prompt | Original | Ciphered Letters | Ciphered Words | Scrambled |
|---|---|---|---|---|---|
| GPT-4o-mini | Standard | 0.821 | 0.582 | 0.576 | 0.555 |
| GPT-4o-mini | Token FB | N/A | 0.653 | 0.633 | 0.707 |
| Haiku | Standard | 0.895 | 0.456 | 0.581 | 0.853 |
| Haiku | Token FB | 0.881 | 0.378 | 0.011 | 0.000 |

### Takeaways
- Token fallback HELPS GPT-4o-mini on ablated data (especially scrambled: 0.555->0.707)
- Token fallback HURTS Haiku dramatically (scrambled: 0.853->0.000, ciphered_words: 0.581->0.011)
- GPT-4o outperforms 4o-mini across all conditions but still degrades under ablation
- Non-semantic methods (TF-IDF, Soft TF-IDF) are invariant to transformations as expected

## Files to Regenerate After Any New Runs
1. `python scripts/cv_threshold.py` -> `results/cv_results.csv`
2. `python scripts/analyze_results.py` -> `results/summary.csv`
3. Run `scripts/charts.R` in R for plots
