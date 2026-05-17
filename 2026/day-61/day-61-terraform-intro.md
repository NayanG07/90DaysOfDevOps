# Day 61 — Introduction to Terraform

## Infrastructure as Code
IaC is managing infrastructure (servers, networks, databases) through machine-readable definition files, not manual processes. It enables version control, repeatability, and automation.

## Terraform vs Other Tools
- **CloudFormation:** AWS-only; Terraform is cloud-agnostic
- **Ansible:** Config management (procedural), not provisioning (declarative)
- **Pulumi:** Uses real programming languages; Terraform uses HCL

## Commands
| Command | Purpose |
|---------|---------|
| `terraform init` | Download providers and modules |
| `terraform plan` | Preview changes |
| `terraform apply` | Create/update resources |
| `terraform destroy` | Delete all managed resources |
| `terraform show` | Human-readable state |
| `terraform state list` | List all managed resources |

## State File (`terraform.tfstate`)
- JSON file mapping config to real-world resources
- Contains resource IDs, attributes, metadata
- Never edit manually; never commit to Git

## Experience
- Created S3 bucket and EC2 instance with `main.tf`
- Changed instance tag → `terraform plan` showed `~` update (in-place)
- `terraform destroy` removed both resources cleanly
