# Day 63 — Variables, Outputs, Data Sources and Expressions

## Variable Types
- `string`, `number`, `bool`, `list(type)`, `map(type)`

## Precedence (low → high)
1. Default value in `variable` block
2. `terraform.tfvars` (auto-loaded)
3. `*.auto.tfvars` (auto-loaded alphabetically)
4. `-var-file` flag
5. `-var` CLI flag
6. `TF_VAR_*` environment variables

## Data Sources
- `data` sources are read-only — they fetch information from providers
- `resource` blocks create/manage infrastructure
- Used `data.aws_ami.amazon_linux.id` to dynamically fetch the latest AMI

## Locals
- `locals` compute reusable values (name prefixes, merged tags)
- Evaluated lazily; accessible anywhere in the module

## Functions (top 5)
- `upper()` — convert string to uppercase
- `join(delim, list)` — join list into string
- `merge(map1, map2)` — combine maps
- `cidrsubnet(prefix, bits, num)` — calculate subnet CIDR
- `lookup(map, key, default)` — safe map access

## Conditional Expressions
`instance_type = var.environment == "prod" ? "t3.small" : "t2.micro"`
