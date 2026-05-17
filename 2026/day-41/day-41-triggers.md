# Day 41 — Triggers & Matrix Builds

## Workflows Created

### pr-check.yml — PR Trigger
```yaml
on:
  pull_request:
    branches: [main]
```
- Fires on PR open/update against main
- Prints branch name: `${{ github.head_ref }}`

### manual.yml — Manual Trigger
```yaml
on:
  workflow_dispatch:
    inputs:
      environment:
        description: "Deploy environment"
        required: true
        default: "staging"
```
- Manually triggered from Actions tab
- Prints the input value

### matrix.yml — Matrix Build
```yaml
strategy:
  matrix:
    python-version: ["3.10", "3.11", "3.12"]
```
- Runs same job across 3 Python versions in parallel
- Extended to include `os: [ubuntu-latest, windows-latest]` → 6 total jobs

## Cron Expressions
- Every Monday at 9 AM: `0 9 * * 1`
- Daily at midnight UTC: `0 0 * * *`

## fail-fast
- `true` (default): one failure cancels all remaining jobs
- `false`: all jobs continue even if one fails — useful for collecting full results
