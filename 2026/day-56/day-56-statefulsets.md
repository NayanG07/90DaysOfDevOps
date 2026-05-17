# Day 56 — Kubernetes StatefulSets

## Deployment vs StatefulSet

| | Deployment | StatefulSet |
|---|---|---|
| Pod names | Random (e.g., `app-7d9f8c6b4-abc12`) | Stable ordinal (e.g., `web-0`, `web-1`, `web-2`) |
| Pod creation | All at once | Ordered (web-0, web-1, web-2) |
| Pod termination | Random | Reverse ordered (web-2, web-1, web-0) |
| Storage | One PVC for all replicas | Per-pod PVC via `volumeClaimTemplates` |
| Network identity | Random IP, no stable DNS | Stable DNS: `<pod>.<svc>.<ns>.svc.cluster.local` |

## Headless Service (`clusterIP: None`)
- Required by StatefulSets for stable DNS identities
- No load balancing — DNS returns individual pod IPs
- `nslookup web-headless` returns all three pod IPs

## volumeClaimTemplates
- Defines PVC template — each replica gets its own PVC
- Naming: `<template>-<sts-name>-<ordinal>` (e.g., `www-web-0`, `www-web-1`)
- PVCs persist when StatefulSet is scaled down (manual cleanup needed)

## Scaling
- Scale up: `kubectl scale sts web --replicas=5` — creates web-3, web-4 in order
- Scale down: `kubectl scale sts web --replicas=2` — removes web-4, web-3 in reverse order
- PVCs remain after scale-down — data preserved
