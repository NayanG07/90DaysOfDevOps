# Day 66 — Provision EKS Cluster with Terraform

## Project Structure
```
terraform-eks/
  providers.tf    # AWS + Kubernetes providers
  vpc.tf          # VPC module with EKS subnet tags
  eks.tf          # EKS module with managed node group
  variables.tf    # Input vars
  outputs.tf      # Cluster outputs
```

## Key Config
- VPC with public + private subnets across 2 AZs
- NAT gateway for private subnet internet access
- EKS with `terraform-aws-modules/eks/aws ~> 20.0`
- Node group: `t3.medium`, min 1 / max 3 / desired 2
- `cluster_endpoint_public_access = true`

## Deploy & Connect
```bash
terraform apply  # ~15 min
aws eks update-kubeconfig --name terraweek-eks --region ap-south-1
kubectl get nodes  # 2 nodes Ready
```

## Deployed Workload
```bash
kubectl apply -f k8s/nginx-deployment.yaml
kubectl get svc nginx-service  # LoadBalancer external IP
```
Nginx welcome page accessible via LoadBalancer URL.

## Destroy
```bash
kubectl delete -f k8s/nginx-deployment.yaml  # delete LB first
terraform destroy  # ~15 min, all resources cleaned
```
Without deleting the LB service first, VPC deletion fails.

## Reflection
- 30+ resources created with one command vs manual cluster setup on Day 50
- IAM roles, security groups, auto-scaling groups all managed automatically
