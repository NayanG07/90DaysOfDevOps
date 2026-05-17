# Day 52 — Namespaces and Deployments

## Namespaces
```bash
kubectl create namespace dev
kubectl create namespace staging
kubectl get namespaces
```
Namespaces isolate resources within a cluster. Defaults: `default`, `kube-system`, `kube-public`, `kube-node-lease`.

## Deployment
```bash
kubectl apply -f nginx-deployment.yaml
kubectl get deployments -n dev
kubectl get pods -n dev
```

## Self-Healing
- Deleted a pod → Deployment controller immediately created a new one
- `kubectl get events -n dev --watch` showed the recreation

## Scaling
```bash
kubectl scale deployment nginx-deployment --replicas=5 -n dev
kubectl scale deployment nginx-deployment --replicas=2 -n dev
```

## Rolling Update
```bash
kubectl set image deployment/nginx-deployment nginx=nginx:1.25 -n dev
kubectl rollout status deployment/nginx-deployment -n dev
kubectl rollout history deployment/nginx-deployment -n dev
kubectl rollout undo deployment/nginx-deployment -n dev
```
