# Day 54 — ConfigMaps and Secrets

## ConfigMaps
- Non-sensitive config data (key-value pairs)
- Created from literals: `kubectl create configmap app-config --from-literal=APP_ENV=production`
- Created from files: `kubectl create configmap nginx-config --from-file=nginx.conf`
- Consumed as env vars (`envFrom.configMapRef`) or volume mounts

## Secrets
- Similar to ConfigMaps but base64 encoded for binary/sensitive data
- `kubectl create secret generic db-creds --from-literal=DB_USER=admin`
- `echo -n 'admin' | base64` encodes; `echo '<encoded>' | base64 -d` decodes
- Base64 is NOT encryption — it's just encoding. Use external secret stores (Vault, SealedSecrets) for real encryption.
- Consumed as `secretKeyRef.valueFrom` (env) or volume mounts

## Propagation Behavior
- **Env vars:** Set once at pod startup — updating ConfigMap doesn't update running pods
- **Volume mounts:** Updated automatically (symlink swap) — kubelet syncs periodically

## Key Differences
| | ConfigMap | Secret |
|---|---|---|
| Intended for | Non-sensitive config | Sensitive data |
| Encoding | Plain text | Base64 (not encrypted) |
| Size limit | 1 MB (etcd limit) | 1 MB |
| Use case | Env vars, config files | Passwords, API keys, certs |
