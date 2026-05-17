# Day 67 — TerraWeek Capstone: Multi-Environment Infrastructure

## Project Structure
```
terraweek-capstone/
  main.tf, variables.tf, outputs.tf, providers.tf, locals.tf
  dev.tfvars, staging.tfvars, prod.tfvars
  modules/  (vpc/, security-group/, ec2-instance/)
```

## Workspaces
```bash
terraform workspace new dev
terraform workspace new staging
terraform workspace new prod
terraform workspace select dev
```
Each workspace has its own state file. `terraform.workspace` drives environment-specific behavior.

## Environment Differences

| | dev | staging | prod |
|---|---|---|---|
| VPC CIDR | 10.0.0.0/16 | 10.1.0.0/16 | 10.2.0.0/16 |
| Instance | t2.micro | t2.small | t3.small |
| Ingress | 22, 80 | 22, 80, 443 | 80, 443 |

## Tagging
Every resource tagged with `Project`, `Environment`, `ManagedBy`, `Workspace`.

## Destroy
```bash
terraform workspace select prod && terraform destroy -var-file="prod.tfvars"
terraform workspace select staging && terraform destroy -var-file="staging.tfvars"
terraform workspace select dev && terraform destroy -var-file="dev.tfvars"
terraform workspace select default
terraform workspace delete dev staging prod
```

## Best Practices (Top 10)
1. Separate files for providers, variables, outputs, main, locals
2. Always use remote backend with locking
3. Never hardcode — use variables + tfvars per environment
4. One concern per module with defined inputs/outputs
5. Workspaces for environment isolation
6. .gitignore for state and tfvars
7. Always plan before apply, fmt + validate before commit
8. Tag every resource
9. Consistent naming: `<project>-<environment>-<resource>`
10. Always destroy non-prod when not in use
