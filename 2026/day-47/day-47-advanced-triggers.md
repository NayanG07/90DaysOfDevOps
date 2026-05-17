# Day 47 — Advanced Triggers

## PR Lifecycle Workflow
- Triggers on `pull_request` types: `opened`, `synchronize`, `reopened`, `closed`
- `${{ github.event.action }}` prints the event type
- `${{ github.event.pull_request.merged }}` — conditional step for merged PRs

## PR Validation (pr-checks.yml)
- **File size check:** Fails if any file > 1MB
- **Branch name check:** Must match `feature/*`, `fix/*`, `docs/*`
- **PR body check:** Warns (doesn't fail) if body is empty

## Cron Expressions
- Every weekday at 9 AM IST (UTC+5:30): `30 3 * * 1-5` (3:30 UTC = 9:00 IST)
- First day of month at midnight UTC: `0 0 1 * *`
- Scheduled workflows may be delayed on inactive repos — GitHub prioritizes active ones

## Path & Branch Filters
- `paths: ['src/**', 'app/**']` — only triggers when files in src/ or app/ change
- `paths-ignore: ['*.md', 'docs/**']` — skip runs for doc-only changes
- `branches: [main, release/*]` — restrict to specific branches

## workflow_run — Chain Workflows
```yaml
on:
  workflow_run:
    workflows: ["Run Tests"]
    types: [completed]
```
- `workflow_run` triggers AFTER another workflow completes
- Check conclusion: `${{ github.event.workflow_run.conclusion == 'success' }}`
- Different from `workflow_call`: `workflow_call` is synchronous (caller waits); `workflow_run` is async (event-driven)

## repository_dispatch
- External trigger via API: `gh api repos/owner/repo/dispatches -f event_type=deploy-request`
- Use case: Slack bot or monitoring tool triggers a deploy pipeline
- `${{ github.event.client_payload.environment }}` reads payload
