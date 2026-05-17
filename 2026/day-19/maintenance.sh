#!/bin/bash
set -euo pipefail

LOG_FILE="/var/log/maintenance.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$DATE] Starting maintenance" >> "$LOG_FILE"

./log_rotate.sh "/var/log/myapp" >> "$LOG_FILE" 2>&1
./backup.sh "/etc" "/backups" >> "$LOG_FILE" 2>&1

echo "[$DATE] Maintenance complete" >> "$LOG_FILE"
