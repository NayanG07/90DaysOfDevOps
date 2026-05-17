# Day 74 — Exporters and Grafana

## Stack
- **node-exporter**: Host-level metrics (CPU, memory, disk, network)
- **cAdvisor**: Container-level metrics (per-container CPU, memory, network, filesystem)
- **Grafana**: Visualization with Prometheus data source

## Auto-Provisioning
- Grafana datasources configured via `grafana/provisioning/datasources/datasources.yml`
- Dashboards can be provisioned similarly from JSON files

## Dashboards
- Pre-built dashboards imported: Node Exporter Full (1860), Docker Monitoring (11600)
- Prometheus web UI: `/targets` shows all 3 targets UP
- Grafana accessible on port 3000 (admin/admin)

## Key Insight
Node-exporter showed base OS metrics, cAdvisor showed Docker-specific container metrics — different scopes for different use cases.
