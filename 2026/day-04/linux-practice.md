# Linux Practice — Processes and Services

## Process Checks

### 1. List all running processes
```bash
$ ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.4 167936 11972 ?        Ss   10:15   0:03 /sbin/init
...
```
Observed: systemd (PID 1) is the parent of all processes.

### 2. Top CPU-consuming processes
```bash
$ ps aux --sort=-%cpu | head -5
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
kirito      2345  2.3  1.2 987654 32100 ?        Sl   10:20   1:23 /usr/bin/gnome-shell
...
```

## Service Checks

### 3. Check SSH service status
```bash
$ systemctl status ssh
● ssh.service - OpenSSH Daemon
     Loaded: loaded /usr/lib/systemd/system/ssh.service
     Active: active (running) since ...
```
SSH is active and enabled on boot.

### 4. List all running services
```bash
$ systemctl list-units --type=service --state=running
  UNIT                  LOAD   ACTIVE SUB     DESCRIPTION
  ssh.service           loaded active running OpenSSH Daemon
  cron.service          loaded active running Cron job scheduler
  docker.service        loaded active running Docker Application Container Engine
```

## Log Checks

### 5. View last 50 lines of SSH logs
```bash
$ journalctl -u ssh -n 50
May 16 10:15:01 host sshd[1234]: Accepted publickey for kirito from 192.168.1.10 ...
```
No failed login attempts observed.

### 6. Tail system auth log
```bash
$ sudo tail -n 20 /var/log/auth.log
May 16 10:20:15 host sudo: kirito : TTY=pts/0 ; USER=root ; COMMAND=/bin/bash
```

## Mini Troubleshooting Flow
1. Check service status (`systemctl status ssh`)
2. If inactive, start it (`sudo systemctl start ssh`)
3. Check logs for errors (`journalctl -u ssh -n 50`)
4. Verify port is listening (`ss -tulpn | grep :22`)
5. Test connectivity (`ssh localhost`)
