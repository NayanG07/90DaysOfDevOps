# Day 36 — Docker Project: Dockerize a Full Application

## App Chosen
Python Flask app (Notes API) with PostgreSQL — a simple REST API for managing notes.

## Project Structure
```
docker-project/
├── app/
│   ├── Dockerfile
│   ├── requirements.txt
│   ├── app.py
│   └── .dockerignore
├── docker-compose.yml
├── .env
└── README.md
```

## Dockerfile
- Base: `python:3.11-slim`
- Multi-stage not needed (Python apps don't compile)
- Non-root user via `USER 1000`
- `.dockerignore` excludes `__pycache__`, `.git`, `*.pyc`

## Docker Compose
- **app** service built from Dockerfile, port 5000
- **db** service: postgres:15-alpine with named volume
- Healthcheck on db, `depends_on` with condition
- Explicit `backend` network
- Environment variables from `.env` file

## Image Size
- Final image: ~150MB (slim base + pip packages)
- Pushed to `kirito/notes-api:v1`

## Challenges & Solutions
- **DB connection timing:** Flask app crashed on startup because Postgres wasn't ready. Fixed with healthcheck + `depends_on: condition: service_healthy`.
- **Hot reload:** Added `--reload` flag to Flask during development via bind mount.

## Docker Hub
- Image: `kirito/notes-api:v1`
- Repo description added with usage instructions
