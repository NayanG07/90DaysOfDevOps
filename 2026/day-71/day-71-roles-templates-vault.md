# Day 71 — Roles, Templates, Galaxy and Vault

## Role Structure
```
nginx-role/
  tasks/main.yml    # Main tasks
  handlers/main.yml # Notification handlers
  templates/        # Jinja2 templates (.j2)
  vars/main.yml     # Role variables
  defaults/         # Default variables (lowest priority)
  meta/main.yml     # Dependencies
```

## Jinja2 Templates
- Dynamic config files using `{{ variables }}` and `{% for %}`
- `ansible_hostname`, facts, and role vars available inside templates
- Filters: `default()`, `upper()`, `join()`

## Ansible Galaxy
```bash
ansible-galaxy role install geerlingguy.nginx
ansible-galaxy role init my-role  # scaffold new role
```

## Ansible Vault
```bash
ansible-vault create secrets.yml      # create encrypted file
ansible-vault view secrets.yml        # view decrypted
ansible-vault encrypt existing.yml    # encrypt existing
ansible-vault decrypt secrets.yml     # decrypt (use carefully)
ansible-playbook playbook.yml --ask-vault-pass
```
Vault encrypts values with AES-256. Password can be passed via file or `ANSIBLE_VAULT_PASSWORD_FILE`.
