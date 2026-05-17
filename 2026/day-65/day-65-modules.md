# Day 65 — Terraform Modules

## Module Structure
```
modules/
  ec2-instance/    (variables.tf, main.tf, outputs.tf)
  security-group/  (variables.tf, main.tf, outputs.tf)
```

## Custom EC2 Module
- Inputs: `ami_id`, `instance_type`, `subnet_id`, `security_group_ids`, `instance_name`, `tags`
- Outputs: `instance_id`, `public_ip`, `private_ip`

## Custom Security Group Module
- Inputs: `vpc_id`, `sg_name`, `ingress_ports`, `tags`
- Uses `dynamic "ingress"` block to loop over port list
- Outputs: `sg_id`

## Registry VPC Module
- `source = "terraform-aws-modules/vpc/aws"` with `version = "~> 5.0"`
- Created VPC + subnets + NAT gateway in ~15 lines vs 50 lines hand-written
- Downloaded modules stored in `.terraform/modules/`

## Module Best Practices
1. Pin registry module versions explicitly
2. One concern per module (VPC, SG, EC2)
3. Use variables for everything, hardcode nothing
4. Always define outputs for caller consumption
5. Add README.md to every custom module
