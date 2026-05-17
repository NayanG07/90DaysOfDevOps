# Day 29 — Docker Basics

## What is Docker?
- **Container**: A lightweight, standalone, executable package that includes everything needed to run software (code, runtime, libs, config).
- **Container vs VM**: Containers share the host OS kernel (lightweight, fast startup). VMs have a full guest OS per instance (heavy, isolated).
- **Architecture**: Docker Client → Docker Daemon (dockerd) → Images (read-only templates) → Containers (running instances) → Registry (Docker Hub).

## Commands Run
```bash
# Install & verify
docker --version
docker run hello-world

# Run Nginx
docker run -d -p 80:80 --name my-nginx nginx

# Run Ubuntu interactively
docker run -it ubuntu bash

# List containers
docker ps          # running
docker ps -a       # all

# Stop & remove
docker stop my-nginx
docker rm my-nginx

# Explore
docker run -d --name web -p 8080:80 nginx
docker logs web
docker exec -it web bash
```

## Observations
- `hello-world` output explained the Docker workflow step-by-step.
- Nginx served the default welcome page on localhost:80.
- Ubuntu container in interactive mode felt like a fresh server — minimal packages, no installed tools.
- Detached mode (`-d`) runs in background; without it, the terminal is attached.
