# Day 39 — What is CI/CD?

## Task 1: The Problem
1. **What can go wrong?** Different environments (OS, lib versions), manual steps missed, no rollback plan, long delays between code write and deploy.
2. **"It works on my machine"** means the dev environment differs from production. CI/CD catches this by running everything in a consistent environment.
3. **Manual deploy frequency:** Once a day at most for a careful team — but risky and inconsistent.

## Task 2: CI vs CD vs CD
- **Continuous Integration (CI):** Merge code frequently → auto-build + auto-test → catch bugs early. *Example: Every PR triggers tests.*
- **Continuous Delivery (CD):** CI + auto-deploy to staging. Artifact is always release-ready. *Example: Merged code deploys to staging automatically.*
- **Continuous Deployment:** Every change that passes tests goes to production automatically. *Example: GitHub → CI passes → auto-deploy to prod.*

## Task 3: Pipeline Anatomy
- **Trigger** — event that starts the pipeline (push, PR, schedule)
- **Stage** — logical phase (build, test, deploy)
- **Job** — unit of work inside a stage (may run in parallel)
- **Step** — single command or action inside a job
- **Runner** — machine that executes jobs
- **Artifact** — output produced (binary, test report, logs)

## Task 4: Pipeline Diagram (Text)
```
Push to GitHub → Check out code → Install deps → Run tests
                                                   ↓
                                            Build Docker image
                                                   ↓
                                            Push to registry
                                                   ↓
                                            Deploy to staging
```

## Task 5: Explore Open-Source
Looked at FastAPI's `.github/workflows/` — triggers on `push` and `pull_request`, runs multiple jobs (lint, test with matrix across Python versions, deploy docs).
