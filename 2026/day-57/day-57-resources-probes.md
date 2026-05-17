# Day 57 — Resource Requests, Limits, and Probes

## QoS Classes
| Class | Condition | Behavior |
|-------|-----------|----------|
| Guaranteed | requests == limits | Most priority, least likely to be evicted |
| Burstable | requests < limits | Middle priority, may be throttled/evicted |
| BestEffort | no requests/limits | Lowest priority, first to be evicted |

## OOMKilled
- Exceed memory limit → container killed with exit code 137 (128 + SIGKILL)
- `kubectl describe pod stress-pod` shows `State: OOMKilled`
- `kubectl get events --watch` shows `OOMKilling` event

## Pending Pod
- Requesting more resources than available (e.g., `memory: 128Gi`) → pod stays `Pending`
- Events show `Insufficient memory` or `0/1 nodes are available`

## Probes

| Probe | Purpose | On Failure |
|-------|---------|------------|
| Liveness | Is container alive? | Container restart |
| Readiness | Is container ready to serve traffic? | Remove from Service endpoints |
| Startup | Give slow starters extra time | Disables liveness/readiness until done |

- Probe types: `httpGet`, `exec` (command), `tcpSocket`
- `initialDelaySeconds` prevents premature failure during startup
