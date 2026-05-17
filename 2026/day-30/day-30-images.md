# Day 30 — Docker Images & Container Lifecycle

## Images
```bash
# Pull images
docker pull nginx
docker pull ubuntu
docker pull alpine

# List images with sizes
docker image ls
# nginx: 187MB, ubuntu: 78MB, alpine: 7.05MB
# Alpine is tiny because it uses musl libc + busybox instead of glibc + GNU utils

# Inspect an image
docker image inspect nginx
# Shows layers, architecture, env vars, entrypoint, etc.

# Remove image
docker rmi alpine

# Image history — shows layer chain
docker image history nginx
# Each instruction (FROM, RUN, COPY) creates a layer; 0B layers are metadata changes
```

## Layers & Caching
- Layers are read-only snapshots. Each Dockerfile instruction adds a layer.
- Docker caches layers from previous builds. If a layer hasn't changed, it reuses the cache.
- This is why ordering matters: put stable instructions first, frequently changing ones last.

## Container Lifecycle
```bash
docker create --name test nginx    # Created
docker start test                  # Running
docker pause test                  # Paused
docker unpause test                # Running
docker stop test                   # Exited
docker restart test                # Running
docker kill test                   # Exited (SIGKILL)
docker rm test                     # Removed
```

## Working with Running Containers
```bash
docker run -d --name web -p 80:80 nginx
docker logs web                    # view logs
docker logs -f web                 # follow mode
docker exec -it web bash           # interactive shell inside
docker exec web ls /usr/share/nginx/html  # single command
docker inspect web                 # IP: 172.17.0.2, ports, mounts
```

## Cleanup
```bash
docker stop $(docker ps -q)        # stop all
docker container prune             # remove all stopped
docker image prune                 # remove unused images
docker system df                   # disk usage
```
