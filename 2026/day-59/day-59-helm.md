# Day 59 — Helm: Kubernetes Package Manager

## Commands
```bash
helm version
helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo nginx
helm install my-nginx bitnami/nginx
helm list
helm status my-nginx
helm get manifest my-nginx
helm show values bitnami/nginx
helm upgrade my-nginx bitnami/nginx --set replicaCount=3
helm history my-nginx
helm rollback my-nginx 1
```

## Custom Chart (`my-app/`)
- `Chart.yaml` — metadata (name, version, apiVersion)
- `values.yaml` — default configuration values
- `templates/deployment.yaml` — Go template with `{{ .Values.replicaCount }}`
- `templates/service.yaml` — Service with configurable type/port

## Installation
```bash
helm lint my-app/
helm template my-release ./my-app  # preview without installing
helm install my-release ./my-app --values custom-values.yaml
```

## Cleanup
- `helm uninstall my-nginx` — removes all resources
- `--keep-history` — keeps release history for rollback tracking
