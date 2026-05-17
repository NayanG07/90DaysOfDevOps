# Docker Cheat Sheet

## Container Commands
| Command | Description |
|---------|-------------|
| `docker run -d -p 80:80 nginx` | Run container detached with port mapping |
| `docker run -it ubuntu bash` | Run interactively |
| `docker ps` | List running containers |
| `docker ps -a` | List all containers |
| `docker stop <name>` | Stop gracefully |
| `docker kill <name>` | Force stop (SIGKILL) |
| `docker rm <name>` | Remove container |
| `docker logs -f <name>` | Follow logs in real time |
| `docker exec -it <name> bash` | Shell into running container |
| `docker exec <name> ls /app` | Run single command inside |

## Image Commands
| Command | Description |
|---------|-------------|
| `docker build -t name:tag .` | Build image from Dockerfile |
| `docker pull nginx` | Pull image from registry |
| `docker push user/repo:tag` | Push image to registry |
| `docker tag src:tag dest:tag` | Tag an image |
| `docker image ls` | List images |
| `docker rmi <name>` | Remove image |
| `docker image history <name>` | Show image layers |
| `docker inspect <name>` | Detailed image/container info |

## Volume Commands
| Command | Description |
|---------|-------------|
| `docker volume create <name>` | Create named volume |
| `docker volume ls` | List volumes |
| `docker volume inspect <name>` | Volume details |
| `docker volume rm <name>` | Remove volume |
| `docker run -v vol:/path ...` | Mount named volume |
| `docker run -v /host:/container ...` | Bind mount |

## Network Commands
| Command | Description |
|---------|-------------|
| `docker network ls` | List networks |
| `docker network create <name>` | Create bridge network |
| `docker network inspect <name>` | Network details |
| `docker network rm <name>` | Remove network |
| `docker run --net <name> ...` | Attach container to network |

## Compose Commands
| Command | Description |
|---------|-------------|
| `docker compose up -d` | Start services in background |
| `docker compose down` | Stop and remove containers/networks |
| `docker compose down -v` | Also remove volumes |
| `docker compose ps` | List service statuses |
| `docker compose logs -f` | Follow logs from all services |
| `docker compose logs <svc>` | Logs from specific service |
| `docker compose build` | Build (or rebuild) images |
| `docker compose up --build` | Build + start |
| `docker compose up --scale web=3` | Scale service replicas |

## Cleanup Commands
| Command | Description |
|---------|-------------|
| `docker container prune` | Remove all stopped containers |
| `docker image prune` | Remove dangling images |
| `docker volume prune` | Remove unused volumes |
| `docker network prune` | Remove unused networks |
| `docker system prune -a` | Remove everything unused |
| `docker system df` | Show disk usage |

## Dockerfile Instructions
| Instruction | Purpose |
|-------------|---------|
| `FROM image:tag` | Base image |
| `RUN command` | Execute during build |
| `COPY src dest` | Copy files from host to image |
| `WORKDIR /path` | Set working directory |
| `EXPOSE port` | Document listening port |
| `CMD ["exec", "args"]` | Default command (overridable) |
| `ENTRYPOINT ["exec"]` | Fixed executable (args appended) |
| `ENV KEY=value` | Set environment variable |
| `USER username` | Run as non-root user |
| `HEALTHCHECK ...` | Container health check |
