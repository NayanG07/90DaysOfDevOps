# Day 70 — Variables, Facts, Conditionals and Loops

## Variable Sources
1. **Playbook vars** — `vars:` block in playbook
2. **Inventory vars** — per-host or per-group in inventory
3. **Facts** — auto-collected system info (`ansible_os_family`, `ansible_hostname`, etc.)
4. **Registered vars** — capture task output with `register: result`
5. **Vault** — encrypted variables for secrets

## Facts
- `ansible_facts` contains system info: OS, IPs, memory, CPU, disks
- `gather_facts: true` (default) collects facts before running tasks
- `setup` module shows all available facts

## Conditionals
- `when:` controls task execution based on conditions
- Examples: `when: ansible_os_family == "Debian"`, `when: inventory_hostname in groups['web']`

## Loops
- `loop:` iterates over a list
- `loop: "{{ list_variable }}"` for dynamic lists
- `{{ item }}` references the current iteration value

## Variable Precedence (low → high)
role defaults → inventory vars → playbook vars → vars_prompt → block vars → task vars → extra vars (`-e`)
