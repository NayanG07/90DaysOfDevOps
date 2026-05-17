# Linux Commands Cheat Sheet

## Process Management
| Command | Description |
|---------|-------------|
| `ps aux` | List all running processes with full details |
| `top` | Display real-time process activity |
| `htop` | Interactive process viewer (if installed) |
| `kill <PID>` | Terminate a process by PID |
| `kill -9 <PID>` | Force kill a process |
| `pgrep <name>` | Find process IDs by name |
| `pkill <name>` | Kill processes by name |
| `nice -n <val> <cmd>` | Run a command with adjusted priority |
| `renice <val> -p <PID>` | Change priority of a running process |
| `nohup <cmd> &` | Run a command immune to hangups |

## File System
| Command | Description |
|---------|-------------|
| `ls -la` | List all files with permissions and details |
| `cd <dir>` | Change directory |
| `pwd` | Print working directory |
| `mkdir -p <dir>` | Create directory (and parents) |
| `cp -r <src> <dst>` | Copy files/directories recursively |
| `mv <src> <dst>` | Move or rename files |
| `rm -rf <dir>` | Remove directory and contents forcefully |
| `find <dir> -name <pattern>` | Search for files by name |
| `chmod 755 <file>` | Set file permissions |
| `chown <user>:<group> <file>` | Change file owner and group |
| `df -h` | Show disk usage in human-readable format |
| `du -sh <dir>` | Show directory size |
| `ln -s <target> <link>` | Create a symbolic link |
| `tar -czf <archive> <files>` | Compress files into tar.gz |
| `tar -xzf <archive>` | Extract tar.gz archive |

## Networking
| Command | Description |
|---------|-------------|
| `ping <host>` | Test reachability to a host |
| `ip addr` | Show IP addresses and network interfaces |
| `dig <domain>` | Query DNS records for a domain |
| `curl <url>` | Transfer data from/to a server |
| `ss -tuln` | List listening TCP/UDP ports |
| `traceroute <host>` | Trace the route packets take to a host |
| `netstat -tulpn` | Show network connections and listening ports |
| `nslookup <domain>` | Query DNS name servers |
