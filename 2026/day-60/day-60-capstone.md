# Day 60 — Capstone: WordPress + MySQL on Kubernetes

## Architecture
```
Namespace: capstone

MySQL StatefulSet (1 replica)
  → Headless Service (port 3306)
  → Secret (mysql-credentials)
  → volumeClaimTemplate (1Gi)

WordPress Deployment (2 replicas)
  → ConfigMap (DB_HOST, DB_NAME)
  → Secret ref (DB_USER, DB_PASSWORD)
  → Liveness/Readiness probes on /wp-login.php
  → HPA (CPU 50%, min 2, max 10)
  → NodePort Service (port 30080)
```

## 12 K8s Concepts Used
1. Namespace (Day 52)
2. Secret (Day 54)
3. ConfigMap (Day 54)
4. Headless Service (Day 56)
5. StatefulSet (Day 56)
6. volumeClaimTemplates (Day 55)
7. Deployment (Day 52)
8. Resource requests/limits (Day 57)
9. Liveness Probe (Day 57)
10. Readiness Probe (Day 57)
11. NodePort Service (Day 53)
12. HPA (Day 58)

## Self-Healing & Persistence
- Deleted WordPress pod → Deployment recreated it immediately
- Deleted MySQL pod → StatefulSet recreated with same PVC → data preserved
- Blog post written before pod deletion was still there after recreation

## Deploy
```bash
kubectl apply -f capstone-namespace.yaml
kubectl apply -f mysql-secret.yaml
kubectl apply -f mysql-service.yaml
kubectl apply -f mysql-statefulset.yaml
kubectl apply -f wordpress-configmap.yaml
kubectl apply -f wordpress-deployment.yaml
kubectl apply -f wordpress-service.yaml
kubectl apply -f wordpress-hpa.yaml
kubectl get all -n capstone
minikube service wordpress-service -n capstone
```
