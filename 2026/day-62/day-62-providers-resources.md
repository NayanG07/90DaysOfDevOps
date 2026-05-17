# Day 62 — Providers, Resources and Dependencies

## Full Networking Stack
Created VPC → Subnet → Internet Gateway → Route Table → Association → Security Group → EC2 Instance → S3 Bucket.

## Implicit Dependencies
Terraform automatically detects when one resource references another's attribute (e.g., `aws_subnet.public` references `aws_vpc.main.id`). It builds a dependency graph and creates resources in the correct order.

## Explicit Dependencies (`depends_on`)
Used `depends_on = [aws_instance.main]` on S3 bucket to ensure the instance is created first — even though there's no direct reference.

## Lifecycle Rules
- `create_before_destroy = true` — creates new resource before destroying old one (zero-downtime updates)
- `prevent_destroy` — prevents accidental deletion
- `ignore_changes` — ignores specific attribute changes (e.g., tags)

## Dependency Graph
`terraform graph | dot -Tpng` showed all resources and their connections visually.
