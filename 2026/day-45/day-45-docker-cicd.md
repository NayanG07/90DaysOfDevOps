# Day 45 — Docker Build & Push in GitHub Actions

## Workflow (`.github/workflows/docker-publish.yml`)
```yaml
name: Docker Build & Push
on:
  push:
    branches: [main]
jobs:
  build-and-push:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_TOKEN }}
      - name: Build and tag
        run: |
          docker build -t kirito/myapp:latest .
          docker tag kirito/myapp:latest kirito/myapp:sha-${{ github.sha }}
      - name: Push
        run: |
          docker push kirito/myapp:latest
          docker push kirito/myapp:sha-${{ github.sha }}
```

## Key Points
- Docker Hub credentials stored as secrets (never hardcoded)
- Pushes only on `main` branch — feature branches build but don't push
- Two tags: `latest` and `sha-<commit-hash>` for version traceability

## Full Journey
```
git push main
  → GitHub detects push to main
  → Runner spins up Ubuntu VM
  → Check out code → Login to Docker Hub
  → docker build → docker tag → docker push
  → Image live on Docker Hub
```

## Status Badge
```
![Docker Build](https://github.com/kirito/github-actions-practice/actions/workflows/docker-publish.yml/badge.svg)
```
Added to README.md — shows green when pipeline passes.
