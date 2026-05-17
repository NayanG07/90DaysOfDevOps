# Day 07 — Linux File System Hierarchy & Scenario-Based Practice

## Part 1: Linux File System Hierarchy

### Core Directories

| Directory | Purpose | Key Files/Dirs |
|-----------|---------|----------------|
| `/` | Root — starting point of the entire filesystem | |
| `/home` | User home directories | `/home/kirito/` |
| `/root` | Root user's home directory | |
| `/etc` | Configuration files | `/etc/hostname`, `/etc/ssh/sshd_config` |
| `/var/log` | Log files (crucial for DevOps) | `/var/log/syslog`, `/var/log/auth.log` |
| `/tmp` | Temporary files (cleared on reboot) | |

### Additional Directories

| Directory | Purpose |
|-----------|---------|
| `/bin` | Essential command binaries (`ls`, `cat`, `cp`) |
| `/usr/bin` | User command binaries |
| `/opt` | Optional/third-party software |

**I would use `/var/log` when** troubleshooting application or system failures.
**I would use `/etc` when** changing configuration files for services.
**I would use `/tmp` when** creating temporary test files.

### Hands-on Commands Run
```bash
$ du -sh /var/log/* 2>/dev/null | sort -h | tail -5
1.2G    /var/log/journal
256M    /var/log/syslog
 12M    /var/log/kern.log

$ cat /etc/hostname
devops-host

$ ls -la ~
total 48
drwxr-xr-x 8 kirito kirito 4096 May 16 10:00 .
drwxr-xr-x 3 root   root   4096 May 14 09:00 ..
```

---

## Part 2: Scenario-Based Practice

### Scenario 1: Service Not Starting

**Problem:** `myapp` failed to start after server reboot.

**Step 1:** Check service status
```bash
systemctl status myapp
```
**Why:** Tells me if service is active, failed, or stopped.

**Step 2:** View recent logs
```bash
journalctl -u myapp -n 50
```
**Why:** Logs often contain the exact error (e.g., port in use, config syntax error).

**Step 3:** Check if service is enabled
```bash
systemctl is-enabled myapp
```
**Why:** A disabled service won't start on boot.

**Step 4:** Try manual start
```bash
sudo systemctl start myapp
```
**Why:** Confirms whether the issue is configuration-related or deeper.

---

### Scenario 2: High CPU Usage

**Problem:** Application server is slow.

**Step 1:** Run `top` to see live CPU usage
```bash
top
```
**Why:** Shows processes sorted by CPU consumption in real time.

**Step 2:** Note the PID of the top process (e.g., PID 7890)

**Step 3:** Get details on that process
```bash
ps -p 7890 -o pid,pcpu,pmem,cmd --sort=-%cpu
```
**Why:** Confirms the exact command and resource usage.

**Step 4:** Investigate further with `strace` or check app logs
```bash
journalctl -u myapp -n 100 --no-pager
```
**Why:** Links CPU spike to application activity.

---

### Scenario 3: Finding Service Logs

**Problem:** Developer asks where Docker service logs are.

**Step 1:** Check service status
```bash
systemctl status docker
```
**Why:** Confirms Docker is running and shows the unit name.

**Step 2:** View recent logs via journald
```bash
journalctl -u docker -n 50
```
**Why:** systemd-managed services log to journald by default.

**Step 3:** Follow logs in real time
```bash
journalctl -u docker -f
```
**Why:** Useful when reproducing an issue live.

---

### Scenario 4: File Permissions Issue

**Problem:** `./backup.sh` gives "Permission denied".

**Step 1:** Check current permissions
```bash
ls -l /home/user/backup.sh
```
**Look for:** `-rw-r--r--` — no `x` means not executable.

**Step 2:** Add execute permission
```bash
chmod +x /home/user/backup.sh
```

**Step 3:** Verify
```bash
ls -l /home/user/backup.sh
```
**Look for:** `-rwxr-xr-x` — now executable.

**Step 4:** Run it
```bash
./backup.sh
```
