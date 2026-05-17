#!/bin/bash
set -euo pipefail

host_info() { echo "Hostname: $(hostname), OS: $(uname -s)"; }
uptime_info() { echo "Uptime: $(uptime -p)"; }
disk_info() { echo "=== Top 5 by Disk ==="; du -sh /* 2>/dev/null | sort -rh | head -5; }
mem_info() { echo "=== Memory ==="; free -h; }
cpu_info() { echo "=== Top 5 CPU ==="; ps aux --sort=-%cpu | head -6; }

main() {
    host_info; echo
    uptime_info; echo
    disk_info; echo
    mem_info; echo
    cpu_info
}
main
