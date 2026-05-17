# Day 14 — Networking Fundamentals & Hands-on

## OSI vs TCP/IP
- OSI: 7 layers (Physical → Application). TCP/IP: 4 layers (Link → Application).
- IP sits at Internet layer, TCP/UDP at Transport layer, HTTP/HTTPS/DNS at Application layer.
- `curl https://example.com` = DNS (App) → TCP (Transport) → IP (Internet) → Ethernet (Link).

## Hands-on Checks (target: google.com)
```bash
# Identity
$ hostname -I
192.168.1.100

# Reachability
$ ping -c 3 google.com
64 bytes from 142.250.80.14: icmp_seq=1 ttl=118 time=12.5ms
# → 0% packet loss, ~12ms latency

# Path
$ tracepath -n google.com
 1  192.168.1.1  1.2ms
 2  10.0.0.1     3.5ms
 3  172.16.1.2   8.1ms
# → Some public hops hidden for privacy

# Ports
$ ss -tulpn
tcp   LISTEN 0 128  0.0.0.0:22  0.0.0.0:*  users:(("sshd",pid=1234))
# → SSH listening on port 22

# Name resolution
$ dig google.com
google.com. 108 IN A 142.250.80.14
# → TTL: 108 seconds

# HTTP check
$ curl -I https://google.com
HTTP/2 200
# → Service is healthy

# Connections snapshot
$ netstat -an | head
# → ~15 ESTABLISHED, ~10 LISTEN
```

## Port Probe
- Port 22 (SSH) on localhost: `nc -zv localhost 22` → `Connection succeeded`
- Reachable. Next check if it failed: `systemctl status ssh`, check firewall rules.

## Reflection
- `ping` gives the fastest broken-signal — if it fails, check physical/L2 connectivity.
- DNS fails → inspect `/etc/resolv.conf` and `dig` at the Transport layer.
- HTTP 500 → switch to Application layer: check app logs, service status.
- Follow-up checks in incident: `journalctl -u <svc> -n 50`, `df -h`, `free -h`.
