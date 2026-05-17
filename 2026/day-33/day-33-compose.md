# Day 33 — Docker Compose Basics

## Commands
```bash
docker compose version
docker compose up -d           # detached mode
docker compose ps              # list services
docker compose logs -f         # follow all logs
docker compose logs db         # specific service logs
docker compose stop            # stop without removing
docker compose down            # remove containers + networks
docker compose down -v         # also remove volumes
docker compose up --build      # rebuild images
```

## WordPress + MySQL
- Compose creates a default network automatically — services resolve each other by name
- Named volume `db-data` persists MySQL data across restarts
- Environment variables configure the WordPress connection to MySQL
- `docker compose down && docker compose up -d` — WordPress data persisted

## Environment Variables
- Inline in compose file under `environment:`
- Via `.env` file in the same directory — referenced as `${VAR_NAME}` in compose

## What I Learned
- Compose wraps `docker run` flags into a declarative YAML format
- Service names become DNS names automatically on the compose network
- `docker compose down -v` is destructive — removes volumes too
