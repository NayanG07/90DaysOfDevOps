# Day 80 — Helm Project: Multi-Environment Charts

## Environment Values
- `values-dev.yaml` — 1 replica, t2.micro, minimal resources
- `values-staging.yaml` — 2 replicas, medium resources
- `values-prod.yaml` — 3 replicas, large resources, HPA enabled

## Helm Hooks
- `pre-install-job.yaml` — runs DB migration before app deployment
- Annotations: `helm.sh/hook: pre-install,pre-upgrade`
- `helm.sh/hook-weight: "-5"` controls execution order

## Helm Test
- `tests/test-connection.yaml` — validates service endpoint after install
- `helm test bankapp` runs all test pods

## Packaging & Distribution
```bash
helm package bankapp/  # creates bankapp-0.1.0.tgz
helm repo index .      # generates index.yaml
helm repo add chart-repo http://example.com/charts
helm repo update
helm install bankapp chart-repo/bankapp
```

## CI/CD Integration
- GitOps CI pipeline builds, tags, and pushes Docker image
- Updates deployment manifest with new image tag
- ArgoCD syncs the change to the cluster
