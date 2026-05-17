# Day 40 — First GitHub Actions Workflow

## Workflow YAML (`.github/workflows/hello.yml`)
```yaml
name: Hello Workflow
on: [push]
jobs:
  greet:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Hello from GitHub Actions!"
      - run: echo "Date: $(date)"
      - run: echo "Branch: ${{ github.ref_name }}"
      - run: ls -la
      - run: echo "OS: ${{ runner.os }}"
```

## Anatomy
- `on:` — trigger event (push, pull_request, etc.)
- `jobs:` — collection of jobs that run in parallel by default
- `runs-on:` — runner OS (ubuntu-latest, windows-latest, macos-latest)
- `steps:` — sequential commands inside a job
- `uses:` — reference an action (shared or local)
- `run:` — shell command to execute
- `name:` — human-readable step name

## Observations
- First run was green (passed all steps)
- Added a failing step (`exit 1`) → run went red, step showed error
- GitHub masks secrets in logs automatically
