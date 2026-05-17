# Day 76 — OpenTelemetry and Alerting

## OpenTelemetry
- **OpenTelemetry Collector** receives traces/metrics via OTLP (gRPC + HTTP), processes (batch), exports to Prometheus
- OTLP endpoint on port 4317 (gRPC) and 4318 (HTTP)
- Bridge between instrumented apps and observability backends

## Alerting Rules
- `HighCPUUsage` — avg CPU > 80% for 5 minutes
- `HighMemoryUsage` — memory > 90%
- `ContainerDown` — container not seen in 30 seconds
- `TargetDown` — Prometheus target unreachable
- Alert rules loaded by Prometheus via `rule_files`

## Grafana Alerts
- Alert rules visible in Grafana's Alerting UI
- Can route to Slack, PagerDuty, email, or webhook
- Silences and mute timings available for planned maintenance
