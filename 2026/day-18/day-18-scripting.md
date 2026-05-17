# Day 18 — Shell Scripting: Functions & Intermediate Concepts

## Scripts

### functions.sh — Basic functions
- `greet()` takes arg `$1`, prints greeting
- `add()` prints sum of two args

### disk_check.sh — Functions with commands
- `check_disk()` runs `df -h /`
- `check_memory()` runs `free -h`

### strict_demo.sh — set -euo pipefail
| Flag | Behavior |
|------|----------|
| `set -e` | Exit on first command failure |
| `set -u` | Treat unset variables as error |
| `set -o pipefail` | Pipeline fails if any stage fails |

### local_demo.sh — Local vs global variables
- `local` variables stay inside the function scope
- Without `local`, variables leak to the global scope

### system_info.sh — System info reporter
- Uses functions for hostname, uptime, disk, memory, CPU
- `set -euo pipefail` for safety
- Clean sectioned output

## What I Learned
- `local` prevents variable leakage — critical for reusable functions
- `set -euo pipefail` is the standard safety header for production scripts
- Functions keep scripts modular and testable
