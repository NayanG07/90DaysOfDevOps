# Day 35 — Multi-Stage Builds & Docker Hub

## Single-Stage Build
```bash
docker build -t myapp:single -f Dockerfile.single .
# Size: ~950MB (includes Go compiler, full OS)
```

## Multi-Stage Build
```bash
docker build -t myapp:multi -f Dockerfile.multistage .
# Size: ~12MB (only compiled binary + alpine + busybox)
```
**Why smaller?** Stage 1 (builder) has Go compiler + full OS. Stage 2 copies only the compiled binary into a minimal Alpine image. Build tools are left behind.

## Push to Docker Hub
```bash
docker login
docker tag myapp:multi kirito/myapp:v1
docker push kirito/myapp:v1
docker pull kirito/myapp:v1
```

## Best Practices Applied
- Minimal base image (`alpine` instead of `ubuntu`)
- Non-root user (`adduser -D appuser` + `USER appuser`)
- Multi-stage to eliminate build dependencies
- Specific tag (`golang:1.21` not `golang:latest`)
- Combined `RUN` commands to reduce layers (single `apt install` line)
