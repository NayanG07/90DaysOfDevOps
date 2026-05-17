# Day 73 — Observability: Prometheus

## What is Observability?
Three pillars: Metrics (Prometheus), Logs (Loki), Traces (OpenTelemetry). Prometheus is the standard for metrics — pulls data from targets at configured intervals, stores in time-series DB.

## Setup
- Prometheus configured via `prometheus.yml` (scrape interval, targets)
- Running alongside notes-app in Docker Compose
- Prometheus web UI accessible on port 9090
- Target endpoints in `/targets` page show UP/DOWN status

## Key Concepts
- **Pull model** — Prometheus scrapes targets, targets don't push
- **Metric types:** Counter (cumulative), Gauge (up/down), Histogram (distribution), Summary
- **PromQL** — query language for metrics (`rate(http_requests_total[5m])`)
- **Exporters** — expose metrics from systems that don't natively support Prometheus
