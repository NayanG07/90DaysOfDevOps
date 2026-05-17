# Day 77 — Observability Project

## Full Stack (8 Services)
1. **notes-app** — Django + React sample application
2. **Prometheus** — Metrics collection
3. **node-exporter** — Host metrics
4. **cAdvisor** — Container metrics
5. **Grafana** — Dashboards
6. **Loki** — Log aggregation
7. **Promtail** — Log collector
8. **OTEL Collector** — Trace + metric pipeline

## Unified Dashboard
Created a Grafana dashboard with panels for:
- CPU/memory/disk from node-exporter
- Container resource usage from cAdvisor
- Application request rate from notes-app metrics
- Log stream from Loki
- Alert status

## Verification
```bash
curl http://localhost:8000  # notes-app works
curl http://localhost:9090  # Prometheus targets UP
curl http://localhost:3000  # Grafana dashboards render
```
All 8 services running, all targets UP, metrics + logs + dashboards all connected.
