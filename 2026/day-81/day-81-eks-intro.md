# Day 81 — EKS with Terraform

## Provisioning
- VPC module with public/private/intra subnets across 2 AZs
- EKS module with managed node group (t3.medium, min 1 / max 3)
- IRSA for service account IAM roles
- ArgoCD installed via Helm as part of Terraform

## Key Terraform Configs
- `terraform/eks.tf` — cluster + node group + IRSA
- `terraform/vpc.tf` — VPC with proper EKS subnet tags
- `terraform/argocd.tf` — ArgoCD Helm release
- `terraform/provider.tf` — AWS + Helm + Kubernetes providers

## Verification
```bash
aws eks update-kubeconfig --name terraweek-eks --region ap-south-1
kubectl get nodes
kubectl get pods -A
kubectl get svc -n argocd
```
ArgoCD server accessible via LoadBalancer or port-forward.

## Key Difference from Day 50/66
- Day 50: local kind cluster
- Day 66: EKS via manual Terraform modules
- Day 81: EKS via Terraform + ArgoCD pre-installed — full GitOps foundation
