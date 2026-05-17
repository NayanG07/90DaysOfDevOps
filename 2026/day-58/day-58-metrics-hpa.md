# Day 58 — Metrics Server and HPA

## Metrics Server
```bash
minikube addons enable metrics-server
kubectl top nodes
kubectl top pods -A
kubectl top pods --sort-by=cpu
```
- Aggregates resource usage from kubelets via Summary API
- Enables `kubectl top` and HPA autoscaling

## HPA Calculation
```
desiredReplicas = ceil(currentReplicas x (currentUsage / targetUsage))
```
- Example: 2 pods at 75% CPU, target 50% → `2 x (75/50) = 3` replicas

## Load Test
```bash
kubectl run load-generator --image=busybox -- /bin/sh -c "while true; do wget -qO- http://php-apache; done"
kubectl get hpa -w  # watch replicas increase
kubectl delete pod load-generator  # traffic stops, replicas scale down
```

## autoscaling/v1 vs v2
| | v1 | v2 |
|---|---|---|
| Metrics | CPU only | CPU, memory, custom, external |
| Behavior | No control | Scale-up/down stabilization windows |
