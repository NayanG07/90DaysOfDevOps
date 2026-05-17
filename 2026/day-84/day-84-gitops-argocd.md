# Day 84 — GitOps with ArgoCD

## What is GitOps?
Git as the single source of truth for infrastructure. ArgoCD continuously syncs the cluster state to match the Git repo state — drift is automatically corrected.

## ArgoCD UI
- Accessible via LoadBalancer or `kubectl port-forward svc/argocd-server -n argocd 8080:443`
- Default login: `admin` with auto-generated password
- Application dashboard shows sync status, health, and deployment history

## ArgoCD Application
- `argocd/application.yml` defines: source (Git repo + path), destination (namespace), sync policy (auto, prune, self-heal)
- Synced bankapp namespace with all manifests from `AI-BankApp-DevOps/k8s/`
- ArgoCD detected and corrected manual changes (self-healing)

## Key Concepts
- **Sync**: Compares desired (Git) vs actual (cluster) state
- **Prune**: Deletes resources removed from Git
- **Self-Heal**: Reverts manual cluster changes to match Git
- **App of Apps**: One ArgoCD app that manages other ArgoCD apps
