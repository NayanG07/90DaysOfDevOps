# Day 43 — Jobs, Steps, Env Vars & Conditionals

## Multi-Job Workflow
```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps: [run: echo "Building"]
  test:
    needs: [build]
    steps: [run: echo "Running tests"]
  deploy:
    needs: [test]
    steps: [run: echo "Deploying"]
```
**Verify:** Actions tab shows dependency chain graph (build → test → deploy).

## Environment Variables (3 levels)
```yaml
env:
  APP_NAME: myapp             # workflow level
jobs:
  build:
    env:
      ENVIRONMENT: staging     # job level
    steps:
      - env:
          VERSION: 1.0.0       # step level
        run: echo "$APP_NAME $ENVIRONMENT $VERSION"
```
**Context variables:** `${{ github.sha }}`, `${{ github.actor }}`

## Job Outputs
```yaml
jobs:
  generate:
    outputs:
      today: ${{ steps.date.outputs.today }}
    steps:
      - id: date
        run: echo "today=$(date)" >> $GITHUB_OUTPUT
  consume:
    needs: [generate]
    steps:
      - run: echo "Date from previous job: ${{ needs.generate.outputs.today }}"
```
**Why use outputs?** Pass computed values (version strings, artifact paths) between jobs.

## Conditionals
- `if: github.ref == 'refs/heads/main'` — only on main branch
- `if: failure()` — only if previous step failed
- `if: github.event_name == 'push'` — job only on push, not PR
- `continue-on-error: true` — don't fail pipeline if this step fails

## Smart Pipeline
- `lint` and `test` run in parallel
- `summary` runs after both, prints branch context and commit message
