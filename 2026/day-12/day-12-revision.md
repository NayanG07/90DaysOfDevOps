# Day 12 — Revision (Days 01–11)

## Command Reruns
```bash
# Process check
ps aux --sort=-%cpu | head -5
# → systemd (PID 1) at 0%, gnome-shell at ~2% CPU

# Service check
systemctl status ssh
# → active (running), enabled on boot

# File permission change
touch /tmp/revision-test.txt && chmod 644 /tmp/revision-test.txt && ls -l /tmp/revision-test.txt
# → -rw-r--r-- 1 kirito kirito ...
```

## Self-Check Answers
1. **3 most time-saving commands:** `systemctl status` (instant health check), `journalctl -u -n` (quick log scan), `ps aux --sort=-%cpu` (find resource hogs).
2. **Service health check:** `systemctl status <svc>`, then `journalctl -u <svc> -n 30`, then `curl http://localhost:<port>` if it's a web service.
3. **Safe ownership change:** `sudo chown user:group file` — always verify with `ls -l`. Never `chmod -R 777`; use group-based access instead.
4. **Focus next 3 days:** Shell scripting — functions, loops, and error handling patterns.

## Plan Tweaks
- No major changes to Day 01 plan; pacing feels right.
- Will add more hands-on reruns during future revision days.
