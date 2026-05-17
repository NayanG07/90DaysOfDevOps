# Linux Troubleshooting Runbook

## Target Service: `ssh`

### Environment Basics
```bash
$ uname -a
Linux host 6.5.0-28-generic #29-Ubuntu SMP PREEMPT_DYNAMIC x86_64 GNU/Linux

$ cat /etc/os-release
PRETTY_NAME="Ubuntu 24.04 LTS"
```

### Filesystem Sanity
```bash
$ mkdir /tmp/runbook-demo && cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo
-rw-r--r-- 1 kirito kirito 250 May 16 10:30 hosts-copy
```
Filesystem writable and working.

### CPU & Memory
```bash
$ ps -o pid,pcpu,pmem,comm -p 1
  PID %CPU %MEM COMMAND
    1  0.0  0.4 systemd

$ free -h
              total        used        free      shared  buff/cache   available
Mem:           15Gi       4.2Gi       8.5Gi       0.2Gi       2.3Gi      10.3Gi
```
Low CPU usage; plenty of available memory.

### Disk & IO
```bash
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1       200G   45G  155G  23% /

$ du -sh /var/log
1.2G    /var/log
```
Disk usage at 23%, logs consuming 1.2G — acceptable.

### Network
```bash
$ ss -tulpn | grep :22
tcp   LISTEN 0      128    0.0.0.0:22   0.0.0.0:*   users:(("sshd",pid=1234,fd=3))

$ curl -I http://localhost:22
curl: (7) Failed to connect — expected for SSH port
```
SSH listening on port 22, bound to all interfaces.

### Logs Reviewed
```bash
$ journalctl -u ssh -n 50
May 16 10:15:01 host sshd[1234]: Accepted publickey for kirito from 192.168.1.10 port 54321

$ sudo tail -n 50 /var/log/auth.log
May 16 10:20:15 host sudo: kirito : TTY=pts/0 ; USER=root ; COMMAND=/bin/bash
```
No failed login attempts; no errors in recent logs.

## Quick Findings
- SSH running normally, no resource pressure
- Auth logs show only legitimate access
- All filesystem checks pass

## If This Worsens
1. **Restart the service**: `sudo systemctl restart ssh`
2. **Increase log verbosity**: Edit `/etc/ssh/sshd_config` → set `LogLevel VERBOSE`, then reload
3. **Collect strace on PID**: `sudo strace -p <sshd-pid> -o /tmp/ssh-strace.log`
