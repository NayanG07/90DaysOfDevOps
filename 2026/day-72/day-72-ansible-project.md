# Day 72 — Ansible Project: Automate Docker + Nginx

## Project Structure
```
ansible-docker-project/
  ansible.cfg, inventory.ini, site.yml
  group_vars/
  roles/
    docker/   (tasks: install Docker, run Nginx container on port 8080)
    nginx/    (tasks: install Nginx, reverse proxy to container)
```

## Flow
1. `ansible-playbook site.yml` runs both roles
2. Docker installed on `docker-hosts`, Nginx container started on port 8080
3. Nginx installed on `nginx-hosts`, configured as reverse proxy → container

## Verification
```bash
curl http://web-01  # → Nginx welcome page via reverse proxy
curl http://app-01:8080  # → Nginx container directly
```
Both URLs serve the Nginx welcome page — the containerized app behind the reverse proxy.

## Key Concepts Used
- Roles (docker, nginx)
- Templates (Jinja2 for nginx config)
- Handlers (restart nginx on config change)
- Variables (docker_host)
- Vault (for Docker Hub credentials if private images)
