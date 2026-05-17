# Day 37 — Docker Revision

## Self-Assessment
- [x] Run container from Docker Hub (interactive + detached)
- [x] List, stop, remove containers and images
- [x] Explain image layers and caching
- [x] Write Dockerfile (FROM, RUN, COPY, WORKDIR, CMD)
- [x] Explain CMD vs ENTRYPOINT
- [x] Build and tag custom image
- [x] Named volumes
- [x] Bind mounts
- [x] Custom networks and container communication
- [x] Write docker-compose.yml for multi-container app
- [x] Environment variables and .env in Compose
- [x] Multi-stage Dockerfile
- [x] Push image to Docker Hub
- [x] Healthchecks and depends_on

## Quick-Fire Answers
1. **Image vs Container:** Image is a read-only template; container is a running instance of an image.
2. **Data on container remove:** Lost — containers are ephemeral unless using volumes.
3. **Custom network communication:** By container name (built-in DNS resolution).
4. **`docker compose down -v`:** Also removes named volumes (data loss).
5. **Multi-stage builds:** Smaller images by separating build deps from runtime.
6. **COPY vs ADD:** Both copy files; ADD additionally supports URLs and tar auto-extraction.
7. **`-p 8080:80`:** Host port 8080 → container port 80.
8. **Docker disk usage:** `docker system df`.

## Weak Spots Revisited
1. **Multi-stage builds** — re-ran Go example, confirmed size drop from 950MB to 12MB.
2. **Healthchecks in Compose** — re-added `pg_isready` check with proper intervals.
