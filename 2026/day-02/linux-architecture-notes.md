# Linux Architecture, Processes, and systemd

## Core Components
- **Kernel** — Core of the OS; manages hardware, memory, processes, and drivers
- **User Space** — Where applications and utilities run (isolated from kernel)
- **init/systemd** — First process (PID 1); bootstraps and manages all services

## Process States
- **Running** — Actively executing on CPU
- **Sleeping** — Waiting for resource (I/O, timer)
- **Stopped** — Paused by signal (SIGSTOP/SIGTSTP)
- **Zombie** — Terminated but parent hasn't reaped it
- **Dead/Idle** — No longer exists in process table

## 5 Daily Commands
| Command | Purpose |
|---------|---------|
| `ps aux` | List all running processes with resource usage |
| `top` / `htop` | Interactive process viewer |
| `systemctl status <service>` | Check service health |
| `journalctl -u <service>` | View service logs |
| `kill <PID>` / `kill -9 <PID>` | Terminate a process gracefully / forcefully |

## systemd
- Replaces SysV init; handles parallel service startup
- Manages services via unit files (`/etc/systemd/system/`)
- Key commands: `systemctl start/stop/restart/enable/disable/status`
- Logs managed by `journald`; read with `journalctl`

## Process Creation
- `fork()` — duplicates parent process
- `exec()` — replaces process image with new program
- `wait()` — parent waits for child to finish
- Orphaned children get adopted by PID 1 (systemd)
