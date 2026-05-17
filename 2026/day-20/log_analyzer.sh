#!/bin/bash
set -euo pipefail

LOG_FILE="${1:-}"
DATE=$(date +%Y-%m-%d)
REPORT="log_report_$DATE.txt"

if [ -z "$LOG_FILE" ]; then
    echo "Usage: $0 <logfile>"
    exit 1
fi
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' not found"
    exit 1
fi

total_lines=$(wc -l < "$LOG_FILE")
error_count=$(grep -cE "ERROR|Failed" "$LOG_FILE" || true)

echo "=== Error Summary ==="
echo "Total lines processed: $total_lines"
echo "Total errors: $error_count"

echo ""
echo "=== Critical Events ==="
grep -n "CRITICAL" "$LOG_FILE" || echo "No critical events found"

echo ""
echo "=== Top 5 Error Messages ==="
grep "ERROR" "$LOG_FILE" | awk '{$1=$2=$3=""; print}' | sort | uniq -c | sort -rn | head -5 || echo "No ERROR entries"

cat > "$REPORT" << EOF
Log Analysis Report
====================
Date: $DATE
Log file: $LOG_FILE

Total lines processed: $total_lines
Total error count: $error_count

Top 5 Error Messages:
$(grep "ERROR" "$LOG_FILE" | awk '{$1=$2=$3=""; print}' | sort | uniq -c | sort -rn | head -5 | sed 's/^/  /')

Critical Events:
$(grep -n "CRITICAL" "$LOG_FILE" || echo "  None")
EOF

echo ""
echo "Report saved to $REPORT"

mkdir -p archive
mv "$LOG_FILE" archive/
echo "Log file archived to archive/"
