# Day 86 — GitOps Project: End-to-End

## Pipeline Flow
```
Git push → GitHub Actions CI
  → Build Docker image
  → Push to Docker Hub with new tag
  → Update k8s deployment manifest with new tag
  → Push to Git repo
  → ArgoCD detects drift
  → Syncs new manifest to cluster
  → Rolling update of bankapp pods
```

## CI Pipeline (`.github/workflows/gitops-ci.yml`)
- Triggers on push to `main`
- Builds and tags Docker image with commit SHA
- Updates `bankapp-deployment.yml` with new image tag
- Commits and pushes the change back to the repo

## ArgoCD Detection
- ArgoCD polls Git every 3 minutes by default
- Webhook can trigger instant sync
- `kubectl get pods -n bankapp -w` shows rolling update

## Verification
- Changed a UI element in `layout.html`
- CI built image, updated manifest, ArgoCD synced
- Browser refresh showed the change — entire cycle automated
