# Day 75 — Loki + Promtail

## Stack Components
- **Loki**: Log aggregation system (like Prometheus but for logs) — push-based, multi-tenant
- **Promtail**: Log agent — discovers targets, tail logs, pushes to Loki
- **Grafana**: Query logs with LogQL

## Config
- `loki/loki-config.yml` — filesystem storage, ingester WAL, schema v11
- `promtail/promtail-config.yml` — scrapes `/var/log/*log` and Docker container logs
- Updated Grafana datasources with Loki URL

## LogQL Queries
```logql
{job="docker"} |= "error"
sum(count_over_time({job="varlogs"}[5m])) by (level)
{job="varlogs"} |= "CRITICAL"
```
- LogQL is PromQL-inspired but for logs
- Label matchers filter streams, line filters narrow results
- Logs from notes-app container visible in Grafana Explore
