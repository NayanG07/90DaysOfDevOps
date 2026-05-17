# Day 50 — Kubernetes Architecture and Cluster Setup

## History
Kubernetes (Greek for "helmsman") was created by Google based on Borg/Omega, open-sourced in 2014. Now maintained by CNCF.

## Architecture
- **Control Plane:** API Server (entry point), etcd (cluster state), Scheduler (pod placement), Controller Manager (reconciliation loops)
- **Worker Nodes:** kubelet (pod lifecycle), kube-proxy (networking), Container Runtime (Docker/containerd)

## Tool Choice — kind
Installed kind (Kubernetes in Docker) for local cluster:
```bash
kind create cluster --name devops-cluster
kubectl cluster-info
kubectl get nodes
kubectl get pods -A
kubectl describe node devops-cluster-control-plane
```
- `kubectl get namespaces` → default, kube-system, kube-public, kube-node-lease
- `kubectl get pods -A` → CoreDNS, kube-proxy, kindnet in kube-system
