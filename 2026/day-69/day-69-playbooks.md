# Day 69 — Ansible Playbooks and Modules

## Playbook Structure
```yaml
- name: description
  hosts: group
  become: true
  tasks:
    - name: task description
      module_name:
        key: value
```

## Modules Used
| Module | Purpose |
|--------|---------|
| `apt` | Install/remove packages (Debian) |
| `yum` | Install/remove packages (RHEL) |
| `service` | Manage systemd services |
| `copy` | Copy file/content to remote |
| `file` | Manage files/dirs (create, delete, permissions) |
| `template` | Jinja2 template rendering |
| `debug` | Print variables and messages |
| `command` / `shell` | Run arbitrary commands |

## Handlers
- Special tasks triggered by `notify` from other tasks
- Run once at the end of the playbook, even if notified multiple times
- Used for service restarts after config changes

## Idempotency
Ansible modules are idempotent — running a playbook multiple times produces the same result. Nginx is installed only if missing, configs are copied only if they differ.
