# Day 48 — GitHub Actions Project: End-to-End CI/CD

## Pipeline Architecture
```
PR opened → build & test → PR checks pass
Merge to main → build & test → Docker build & push → deploy
Every 12 hours → health check
```

## Workflows Created

### reusable-build-test.yml
- `workflow_call` trigger
- Inputs: `python_version`, `run_tests` (boolean)
- Steps: checkout → setup Python → install deps → run tests → output `test_result`

### reusable-docker.yml
- `workflow_call` trigger
- Inputs: `image_name`, `tag`
- Secrets: `docker_username`, `docker_token`
- Steps: login → build → push → output `image_url`

### pr-pipeline.yml
- Trigger: `pull_request` to main
- Calls reusable-build-test (tests only, no Docker push)
- Plus `pr-comment` job printing summary

### main-pipeline.yml
- Trigger: `push` to main
- Job 1: build-test → Job 2: docker-push (depends on Job 1) → Job 3: deploy (depends on Job 2)
- Environment: `production` with manual approval gate

### health-check.yml
- Trigger: `schedule` (every 12 hours) + `workflow_dispatch`
- Steps: pull → run → curl → pass/fail → `$GITHUB_STEP_SUMMARY`

## Status Badges
Added badges for all workflows to README.md

## What I'd Improve Next
- Slack notifications on failure
- Multi-environment (staging → prod promotion)
- Rollback workflow
