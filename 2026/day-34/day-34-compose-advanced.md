# Day 34 — Docker Compose: Real-World Multi-Container Apps

## 3-Service Stack: Flask App + Postgres + Redis
- **web**: Python Flask app built from Dockerfile, exposes port 5000
- **db**: PostgreSQL 15 Alpine with named volume and healthcheck
- **redis**: Redis 7 Alpine for caching

## depends_on & Healthchecks
- `depends_on: db: condition: service_healthy` — app waits for Postgres to be ready
- Without healthcheck, the app may start before DB is ready to accept connections
- `docker compose up -d` shows the dependency chain

## Restart Policies
- `restart: always` — container restarts regardless of exit code (crashes, kills)
- `restart: on-failure` — only restarts if exit code is non-zero
- `restart: unless-stopped` — always unless manually stopped

## Custom Networks & Volumes
- Defined `frontend` (web accessible) and `backend` (db + redis) networks explicitly
- Named volume `db-data` for Postgres persistence

## Scaling (Bonus)
- `docker compose up --scale web=3` fails because port 5000 can only map once
- For scaling, use a load balancer (nginx reverse proxy) or swarm/Kubernetes

## Build from Compose
- `build: ./app` in compose file builds the Dockerfile
- `docker compose up --build` rebuilds when code changes
