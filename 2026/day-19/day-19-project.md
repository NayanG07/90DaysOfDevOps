# Day 19 — Shell Scripting Project

## Scripts

### log_rotate.sh
- Takes log directory as argument
- Compresses `.log` files older than 7 days with `gzip`
- Deletes `.gz` files older than 30 days
- Exits with error if directory missing

### backup.sh
- Takes source directory and backup destination as arguments
- Creates timestamped `.tar.gz` archive
- Prints archive name and size
- Deletes backups older than 14 days
- Exits if source doesn't exist

### maintenance.sh
- Runs both scripts sequentially with logging
- All output appended to `/var/log/maintenance.log` with timestamps

## Crontab Entries
```cron
# Log rotation daily at 2 AM
0 2 * * * /home/kirito/Devops/90DaysOfDevOps/2026/day-19/log_rotate.sh /var/log/myapp

# Backup every Sunday at 3 AM
0 3 * * 0 /home/kirito/Devops/90DaysOfDevOps/2026/day-19/backup.sh /etc /backups

# Health check every 5 minutes
*/5 * * * * /home/kirito/Devops/90DaysOfDevOps/2026/day-19/health_check.sh

# Combined maintenance daily at 1 AM
0 1 * * * /home/kirito/Devops/90DaysOfDevOps/2026/day-19/maintenance.sh
```

## What I Learned
- `find -mtime` is the reliable way to filter files by age
- `tar -czf` with `-C` flag avoids including full parent paths
- Crontab `* * * * *` syntax is universal across Linux distros
