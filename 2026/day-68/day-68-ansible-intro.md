# Day 68 — Ansible Introduction and Inventory

## What is Ansible?
Configuration management tool — agentless, uses SSH, YAML-based. Idempotent: playbooks can be run multiple times with the same result.

## Architecture
- **Control Node** — where Ansible runs (local machine)
- **Managed Nodes** — target servers (EC2 instances)
- **Inventory** — list of managed nodes (INI or YAML)
- **Modules** — reusable units of work (package, service, copy, etc.)

## Ansible vs Others
- Agentless (SSH only) vs Puppet/Chef (agents required)
- Push-based vs Pull-based (Salt, Puppet)
- YAML simplicity vs Ruby DSL (Chef)

## Inventory Created
Grouped EC2 instances into `[web]`, `[db]`, `[app]` with per-group connection variables.

## Ad-hoc Commands
```bash
ansible all -i inventory.ini -m ping
ansible web -i inventory.ini -m command -a "uptime"
ansible all -i inventory.ini -m shell -a "df -h"
ansible web -i inventory.ini -m setup | less  # gather facts
```
- `-m` = module, `-a` = arguments
- `ansible-inventory --graph` shows inventory tree
- `ansible-config list` shows all config options
