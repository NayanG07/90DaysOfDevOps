# Day 83 — EKS Project: Full Deployment

## Components Deployed
1. **AI-BankApp** — bankapp, mysql, ollama deployments with ConfigMap, Secrets, PV/PVC
2. **Gateway API** — Envoy Gateway routing to bankapp
3. **cert-manager** — TLS certificate provisioning
4. **kube-prometheus-stack** — Prometheus + Grafana for monitoring
5. **ServiceMonitor** — Prometheus scraping of bankapp metrics

## Verification
```bash
kubectl get all -n bankapp
kubectl get gateway -n bankapp
kubectl get certificaterequest
kubectl get servicemonitor -n bankapp
curl https://bankapp.example.com  # returns app UI
```
All components healthy, bankapp accessible via HTTPS, metrics being scraped.

## Complete Flow
Terraform provisions EKS + ArgoCD + VPC → ArgoCD syncs bankapp manifests → Gateway routes traffic → cert-manager provisions TLS → Prometheus scrapes metrics
