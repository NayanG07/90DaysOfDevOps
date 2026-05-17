#!/bin/bash
set -euo pipefail

LOG_DIR="$1"
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory $LOG_DIR does not exist"
    exit 1
fi

compressed=$(find "$LOG_DIR" -name "*.log" -mtime +7 -exec gzip {} \; -print | wc -l)
deleted=$(find "$LOG_DIR" -name "*.gz" -mtime +30 -exec rm {} \; -print | wc -l)

echo "Compressed $compressed log files"
echo "Deleted $deleted old archives"
