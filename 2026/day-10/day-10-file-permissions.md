# Day 10 — File Permissions & File Operations Challenge

## Files Created
| File | Creation Method |
|------|----------------|
| `devops.txt` | `touch devops.txt` |
| `notes.txt` | `echo "Learning DevOps" > notes.txt` |
| `script.sh` | `vim script.sh` → `echo "Hello DevOps"` |
| `project/` (directory) | `mkdir project/` |

## Permission Changes

### Before
```
-rw-r--r-- 1 kirito kirito    0 May 16 10:00 devops.txt
-rw-r--r-- 1 kirito kirito   16 May 16 10:01 notes.txt
-rw-r--r-- 1 kirito kirito   20 May 16 10:02 script.sh
drwxr-xr-x 2 kirito kirito 4096 May 16 10:05 project/
```

### After Changes
```bash
# Make script executable
chmod +x script.sh
-rwxr-xr-x 1 kirito kirito   20 May 16 10:02 script.sh

# Remove write for all on devops.txt
chmod -w devops.txt
-r--r--r-- 1 kirito kirito    0 May 16 10:00 devops.txt

# Set notes.txt to 640 (owner: rw, group: r, others: none)
chmod 640 notes.txt
-rw-r----- 1 kirito kirito   16 May 16 10:01 notes.txt

# Set project/ directory to 755
chmod 755 project/
drwxr-xr-x 2 kirito kirito 4096 May 16 10:05 project/
```

### Testing Permissions
```bash
# Try writing to read-only file
$ echo "test" >> devops.txt
-bash: devops.txt: Permission denied

# Try executing without +x
$ chmod -x script.sh && ./script.sh
-bash: ./script.sh: Permission denied

# Script runs after adding execute
$ chmod +x script.sh && ./script.sh
Hello DevOps
```

## Commands Used
- `touch`, `echo`, `cat`, `vim` — file creation
- `ls -l` — view permissions
- `chmod +x`, `chmod -w`, `chmod 640`, `chmod 755` — modify permissions
- `head -n`, `tail -n` — partial file reading
- `./script.sh` — execute script

## What I Learned
- Permissions are `rwx` for owner/group/others; numeric mode `chmod 640` is faster
- Removing write (`-w`) produces "Permission denied" on write attempt
- Execute permission (`+x`) is required to run scripts with `./`
- Directories need `x` to be traversable (`cd` into them)
