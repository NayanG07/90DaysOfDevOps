# Day 53 — Kubernetes Services

## Problem
Pods are ephemeral — IPs change on restart. Services provide a stable endpoint.

## Services Created

### ClusterIP
- Internal stable IP for pod-to-pod communication
- Tested: `kubectl run test --image=busybox --rm -it -- wget -qO- http://web-app-clusterip`

### NodePort
- Exposes service on each node's IP at port 30080
- Access: `curl <node-ip>:30080`

### LoadBalancer
- Cloud LB provisioner (shows `<pending>` on local clusters)
- `minikube tunnel` enables it locally

## DNS
- `<service>.<namespace>.svc.cluster.local`
- `nslookup web-app-clusterip.default.svc.cluster.local`

## Comparison

| Type | Scope | Use Case |
|------|-------|----------|
| ClusterIP | Internal | Pod-to-pod, backend services |
| NodePort | External (node IP) | Development, direct access |
| LoadBalancer | External (LB DNS) | Production, cloud-native |
