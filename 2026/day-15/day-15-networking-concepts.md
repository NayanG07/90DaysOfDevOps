# Day 15 — Networking Concepts: DNS, IP, Subnets & Ports

## Task 1: DNS
1. Typing `google.com` → browser checks cache → queries DNS resolver → root → TLD → authoritative nameserver → returns A record IP → browser connects via TCP.
2. Record types:
   - **A**: Maps hostname to IPv4 address
   - **AAAA**: Maps hostname to IPv6 address
   - **CNAME**: Alias of one name to another (canonical name)
   - **MX**: Mail exchange server for a domain
   - **NS**: Nameserver authoritative for the domain
3. `dig google.com` → A record `142.250.80.14`, TTL 108s.

## Task 2: IP Addressing
1. IPv4: 32-bit, dotted-decimal. Eg `192.168.1.10`.
2. Public IPs are routable on the internet; private IPs are for internal LANs.
3. Private ranges: `10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`.
4. `ip addr show` → `192.168.1.100` is private (in 192.168.0.0/16 range).

## Task 3: CIDR & Subnetting
1. `/24` means the first 24 bits are the network prefix; last 8 bits are for hosts.
2. Usable hosts: `/24` = 254, `/16` = 65534, `/28` = 14.
3. Subnetting splits a large network into smaller segments for efficiency and security.

| CIDR | Subnet Mask | Total IPs | Usable Hosts |
|------|-------------|-----------|--------------|
| /24  | 255.255.255.0 | 256 | 254 |
| /16  | 255.255.0.0 | 65536 | 65534 |
| /28  | 255.255.255.240 | 16 | 14 |

## Task 4: Ports
- A port identifies a specific service on a host (16-bit number 0–65535).

| Port | Service |
|------|---------|
| 22   | SSH |
| 80   | HTTP |
| 443  | HTTPS |
| 53   | DNS |
| 3306 | MySQL/MariaDB |
| 6379 | Redis |
| 27017| MongoDB |

Running `ss -tulpn`:
- Port 22 → sshd
- Port 53 → systemd-resolved

## Task 5: Putting It Together
1. `curl http://myapp.com:8080` involves: DNS resolution (myapp.com → IP), TCP connection to port 8080, HTTP request/response at Application layer.
2. Can't reach `10.0.1.50:3306`: first check connectivity (`ping 10.0.1.50`), then port (`nc -zv 10.0.1.50 3306`), then firewall/security group rules.
