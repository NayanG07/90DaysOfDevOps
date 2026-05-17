# Day 85 — ArgoCD Deep Dive

## Sync Strategies
- **Manual Sync**: Click "Sync" in UI or `argocd app sync bankapp`
- **Automatic Sync**: `syncPolicy.automated` with prune + self-heal
- **Sync Waves**: `argocd.argoproj.io/sync-wave: "1"` annotations for dependency ordering

## Rollback
```bash
argocd app rollback bankapp <revision>
```
ArgoCD retains deployment history (last N revisions) for instant rollback.

## App of Apps Pattern
- `root-app.yaml` is the parent application
- Children: `bankapp.yaml`, `monitoring.yaml`, `envoy-gateway.yaml`
- Single repo with one Application per folder → root syncs all

## Notifications
- ArgoCD Notifications configured via ConfigMap (`argocd-notifications-cm`)
- Supports Slack, email, webhook triggers on sync/health events
- Templates define message format per trigger type
