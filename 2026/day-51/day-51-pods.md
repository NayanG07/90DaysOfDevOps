# Day 51 — Kubernetes Manifests and Your First Pods

## Manifest Anatomy
- `apiVersion: v1` — API version (v1 for core resources)
- `kind: Pod` — resource type
- `metadata:` — name, labels, namespace
- `spec:` — containers (name, image, ports, command)

## Pods Created
```bash
kubectl apply -f nginx-pod.yaml
kubectl apply -f busybox-pod.yaml
kubectl exec nginx-pod -- curl localhost:80  # Nginx welcome page
kubectl exec busybox-pod -- /bin/sh
kubectl exec busybox-pod -- wget -qO- http://nginx-pod:80  # pod-to-pod comm
```

## Imperative vs Declarative
- **Imperative:** `kubectl run redis-pod --image=redis` — quick, not repeatable
- **Declarative:** `kubectl apply -f manifest.yaml` — reproducible, version-controlled
- Extract YAML: `kubectl run nginx --image=nginx --dry-run=client -o yaml > nginx.yaml`

## Labels & Filtering
```bash
kubectl get pods --show-labels
kubectl get pods -l app=nginx
kubectl label pod nginx-pod version=v1
kubectl label pod nginx-pod version-  # remove label
```

## Cleanup
- `kubectl delete pod nginx-pod` — deletes standalone pod
- `kubectl delete -f nginx-pod.yaml` — delete by manifest
- Standalone pods are NOT recreated after deletion (unlike Deployment-managed pods)
