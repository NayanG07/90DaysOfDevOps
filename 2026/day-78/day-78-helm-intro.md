# Day 78 — Helm Introduction

## Why Helm?
Raw Kubernetes manifests are repetitive and not parameterized. Helm packages all K8s resources into a chart — single command to install, upgrade, rollback.

## Charts Deployed
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install mysql bitnami/mysql --values mysql-values.yaml
helm install nginx bitnami/nginx --set service.type=NodePort
```

## Chart Structure
```
bankapp/
  Chart.yaml          # Metadata (name, version, apiVersion)
  values.yaml         # Default configuration
  templates/          # Go template YAML files
  charts/             # Sub-chart dependencies
  _helpers.tpl        # Reusable template helpers
  NOTES.txt           # Usage notes printed after install
```

## Key Commands
```bash
helm repo add
helm search repo
helm install
helm upgrade
helm rollback
helm list
helm uninstall
helm get manifest
helm get values
```
