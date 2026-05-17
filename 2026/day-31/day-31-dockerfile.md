# Day 31 — Dockerfile: Build Your Own Images

## Dockerfiles Created

### my-first-image/Dockerfile
- Base: `ubuntu:22.04`
- Installs curl
- CMD: `echo "Hello from my custom image!"`
- Build: `docker build -t my-ubuntu:v1 .`

### Dockerfile.all — All instructions
- `FROM ubuntu:22.04`, `RUN apt update && apt install -y curl`
- `COPY . /app`, `WORKDIR /app`, `EXPOSE 80`, `CMD ["echo", "..."]`

### CMD vs ENTRYPOINT
- `CMD` is overridden by any command passed to `docker run`
- `ENTRYPOINT` always runs, and `docker run` arguments are appended to it
- Use `CMD` for defaults, `ENTRYPOINT` for fixed executable behavior

### my-website (nginx:alpine)
- `Copy index.html → /usr/share/nginx/html/`
- Build: `docker build -t my-website:v1 -f Dockerfile.web .`
- Run: `docker run -d -p 8080:80 my-website:v1`

### .dockerignore
Excludes `node_modules`, `.git`, `*.md`, `.env` from build context.

## Layer Order & Caching
- `docker build` caches each layer. If a layer changes, all subsequent layers are rebuilt.
- Put stable layers first (base image, `apt install`), app code last.
- Changed one line in index.html → cached layers up to COPY step reused → fast rebuild.
