# Day 32 — Docker Volumes & Networking

## Task 1: The Problem
```bash
docker run --name mydb -e MYSQL_ROOT_PASSWORD=root -d mysql:8
docker exec -it mydb mysql -uroot -proot -e "CREATE DATABASE test;"
docker rm -f mydb
docker run --name mydb2 -e MYSQL_ROOT_PASSWORD=root -d mysql:8
# → test database is GONE. Containers are ephemeral; data is lost on removal.
```

## Task 2: Named Volumes
```bash
docker volume create mysql-data
docker run --name mydb -v mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:8
# Create data, stop, remove, run new container with same volume
# → Data persists across container lifecycles
```

## Task 3: Bind Mounts
```bash
mkdir ~/site && echo "<h1>Bind Mount</h1>" > ~/site/index.html
docker run -d -p 8080:80 -v ~/site:/usr/share/nginx/html nginx
# Edit index.html on host → browser refresh shows new content
```
**Named volume vs bind mount:** Named volumes are managed by Docker (stored in `/var/lib/docker/volumes/`). Bind mounts are direct host paths you control. Named volumes are portable; bind mounts are great for development.

## Task 4: Docker Networking
```bash
docker network ls
docker network inspect bridge
# Default bridge: containers can ping by IP, NOT by name
```

## Task 5: Custom Networks
```bash
docker network create my-app-net
docker run -d --net my-app-net --name web nginx
docker run -it --net my-app-net --name client alpine ping web
# Custom bridge containers CAN ping by name — built-in DNS resolution
```

## Task 6: Putting It Together
```bash
docker network create app-net
docker run -d --net app-net -v db-data:/var/lib/mysql --name db -e MYSQL_ROOT_PASSWORD=root mysql:8
docker run -d --net app-net --name app nginx
docker exec app ping db  # name-based resolution works
```
