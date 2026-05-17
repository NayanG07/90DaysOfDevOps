#!/bin/bash
set -euo pipefail

SOURCE="$1"
DEST="$2"
DATE=$(date +%Y-%m-%d)
ARCHIVE="$DEST/backup-$DATE.tar.gz"

if [ ! -d "$SOURCE" ]; then
    echo "Error: Source $SOURCE does not exist"
    exit 1
fi

mkdir -p "$DEST"
tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"
size=$(du -h "$ARCHIVE" | cut -f1)
echo "Created: $ARCHIVE ($size)"

find "$DEST" -name "backup-*.tar.gz" -mtime +14 -exec rm {} \;
echo "Cleaned backups older than 14 days"
