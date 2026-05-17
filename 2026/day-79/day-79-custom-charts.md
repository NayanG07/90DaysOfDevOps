# Day 79 — Custom Helm Charts for AI-BankApp

## Chart Templates Created
- `configmap.yaml` — app config
- `secrets.yaml` — DB credentials (stringData)
- `storage.yaml` — PV + PVC for MySQL and Ollama
- `bankapp-deployment.yaml` — main app with envFrom
- `mysql-deployment.yaml` — StatefulSet with volumeClaimTemplates
- `ollama-deployment.yaml` — Ollama LLM server
- `services.yaml` — ClusterIP + NodePort services
- `hpa.yaml` — HorizontalPodAutoscaler
- `_helpers.tpl` — reusable name/selector templates
- `NOTES.txt` — install instructions

## Key Features
- Template expressions: `{{ .Values.replicaCount }}`, `{{ .Release.Name }}`
- Piped functions: `quote`, `default`, `upper`
- Conditional blocks: `{{ if .Values.hpa.enabled }}`
- Range loops: `{{ range .Values.ingress.hosts }}`

## Installation
```bash
helm install bankapp ./helm-chart/bankapp --namespace bankapp --create-namespace
```
