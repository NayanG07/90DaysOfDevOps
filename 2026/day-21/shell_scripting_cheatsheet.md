# Shell Scripting Cheat Sheet

## Quick Reference

| Topic | Key Syntax | Example |
|-------|-----------|---------|
| Variable | `VAR="value"` | `NAME="DevOps"` |
| Argument | `$1`, `$2` | `./script.sh arg1` |
| If | `if [ condition ]; then` | `if [ -f file ]; then` |
| For loop | `for i in list; do` | `for i in 1 2 3; do` |
| Function | `name() { ... }` | `greet() { echo "Hi"; }` |
| Grep | `grep pattern file` | `grep -i "error" log.txt` |
| Awk | `awk '{print $1}' file` | `awk -F: '{print $1}' /etc/passwd` |
| Sed | `sed 's/old/new/g' file` | `sed -i 's/foo/bar/g' config.txt` |

---

## 1. Basics
- **Shebang**: `#!/bin/bash` — tells the kernel which interpreter to use
- **Run**: `chmod +x script.sh && ./script.sh` or `bash script.sh`
- **Comments**: `# This is a comment`
- **Variables**: `NAME="John"` (no spaces around `=`), use `$NAME` or `${NAME}`
- **Quoting**: `"$VAR"` expands, `'$VAR'` is literal
- **Read**: `read -p "Prompt: " var`
- **Args**: `$0` (script), `$1-$9` (positional), `$#` (count), `$@` (all), `$?` (exit code)

## 2. Conditionals
- **String**: `=`, `!=`, `-z` (empty), `-n` (not empty)
- **Integer**: `-eq`, `-ne`, `-lt`, `-le`, `-gt`, `-ge`
- **File tests**: `-f` (file), `-d` (dir), `-e` (exists), `-r`/`-w`/`-x` (perms), `-s` (non-empty)
- **If/elif/else**:
  ```bash
  if [ condition ]; then
    ...
  elif [ condition ]; then
    ...
  else
    ...
  fi
  ```
- **Logical**: `&&` (and), `||` (or), `!` (not)
- **Case**:
  ```bash
  case "$var" in
    pattern1) cmd1 ;;
    pattern2) cmd2 ;;
    *) default ;;
  esac
  ```

## 3. Loops
- **For (list)**: `for i in a b c; do echo "$i"; done`
- **For (C-style)**: `for ((i=0; i<10; i++)); do ...; done`
- **While**: `while [ condition ]; do ...; done`
- **Until**: `until [ condition ]; do ...; done`
- **Control**: `break` (exit loop), `continue` (skip iteration)
- **File loop**: `for f in *.log; do echo "$f"; done`
- **Read lines**: `while read line; do echo "$line"; done < file`

## 4. Functions
- Define: `func_name() { ... }` or `function func_name { ... }`
- Call: `func_name arg1 arg2`
- Args inside: `$1`, `$2`
- Return: `return N` (exit code), `echo "value"` (capture with `$(func)`)
- Local vars: `local VAR="value"`

## 5. Text Processing
- **grep**: `-i` (ignore case), `-r` (recursive), `-c` (count), `-n` (line num), `-v` (invert), `-E` (extended regex)
- **awk**: `'{print $1}'` (column), `-F:` (field sep), `$NF` (last field)
- **sed**: `'s/old/new/g'` (substitute), `'Nd'` (delete N), `-i` (in-place)
- **cut**: `-d: -f1` (delimiter + field)
- **sort**: `-n` (numeric), `-r` (reverse), `-u` (unique), `-k2` (key)
- **uniq**: `-c` (count), needs sorted input
- **tr**: `'a-z' 'A-Z'` (translate), `-d` (delete)
- **wc**: `-l` (lines), `-w` (words), `-c` (chars)
- **head/tail**: `-n N`, `-f` (follow)

## 6. Useful One-Liners
```bash
# Find and delete files older than 30 days
find /var/log -name "*.log" -mtime +30 -delete

# Count lines in all .log files
wc -l *.log

# Replace string across multiple files
sed -i 's/old_url/new_url/g' config/*.yaml

# Check if service is running
systemctl is-active --quiet nginx && echo "Running" || echo "Stopped"

# Monitor disk usage with alert
df -h / | awk 'NR==2 {if ($5+0 > 80) print "ALERT: Disk " $5 " full"}'

# Tail logs filtering errors in real time
tail -f app.log | grep --line-buffered -i "error"

# Parse CSV column
cut -d',' -f2 data.csv

# Find largest files
du -sh /* 2>/dev/null | sort -rh | head -10
```

## 7. Error Handling & Debugging
- **Exit codes**: `$?` (last exit code), `exit 0` (success), `exit 1` (error)
- **set -e**: Exit on error
- **set -u**: Error on unset variables
- **set -o pipefail**: Catch pipeline failures
- **set -x**: Print each command before executing (debug mode)
- **trap**: `trap 'cleanup' EXIT` — run cleanup on script exit
- **Redirect errors**: `cmd 2>&1` (stderr to stdout), `cmd 2>/dev/null` (silence errors)
