# Day 38 — YAML Basics

## Files Created
- `person.yaml` — key-value pairs, lists, booleans
- `server.yaml` — nested objects, multi-line strings

## YAML Syntax Rules
- **Spaces only** — tabs cause validation errors
- **Indentation** is structural — 2 spaces standard
- **Lists**:
  - Block style: each item on new line starting with `- `
  - Inline style: `[item1, item2]`
- **Nested objects**: indented key-value pairs
- **Multi-line strings**:
  - `|` preserves newlines (good for scripts)
  - `>` folds into a single line (good for descriptions)

## Validation
```bash
yamllint person.yaml
yamllint server.yaml
```
Using a tab instead of spaces gives: `error: syntax error: found tab character`.

## Spot the Difference
Block 2 is broken because `- docker` is not indented at the same level as `- kubernetes`. All list items must share the same indentation level.

## What I Learned
- YAML is whitespace-sensitive — a single misplaced space can break configs
- No quotes needed for most strings, but `:` or `#` in values require quotes
- `|` and `>` make multi-line values readable without escaping
