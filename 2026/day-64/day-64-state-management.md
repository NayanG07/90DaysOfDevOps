# Day 64 — Terraform State Management

## Local State Inspection
- `terraform show` — full state in readable format
- `terraform state list` — all tracked resources
- `terraform state show <resource>` — every attribute
- State serial number increments on each write

## S3 Remote Backend
```hcl
terraform {
  backend "s3" {
    bucket         = "terraweek-state-kirito"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraweek-state-lock"
    encrypt        = true
  }
}
```
- `terraform init -migrate-state` copied local state to S3
- Versioning enabled on S3 for recovery

## State Locking
- DynamoDB table with `LockID` as hash key
- Tested: Terminal 2 showed `Error acquiring state lock` while Terminal 1 was applying
- `terraform force-unlock <LOCK_ID>` for stale locks

## Import Existing Resources
```bash
terraform import aws_s3_bucket.imported terraweek-import-test-kirito
```
- Brings existing resources under Terraform management
- Config must match reality — plan should show "No changes"

## State Surgery
- `terraform state mv` — rename resources without destroy
- `terraform state rm` — remove from state (resource stays in AWS)

## State Drift
- Manually changed EC2 tag in AWS console → `terraform plan` showed diff
- Option A: `terraform apply` restored config state
- Option B: Update .tf files to accept the drift
- Prevention: restrict console access, use CI/CD for all changes
