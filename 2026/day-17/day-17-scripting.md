# Day 17 — Shell Scripting: Loops, Arguments & Error Handling

## Scripts

### for_loop.sh — Iterate over list
```bash
for fruit in Apple Banana Cherry Date Elderberry; do echo "$fruit"; done
```

### count.sh — Numeric for loop
```bash
for i in {1..10}; do echo "$i"; done
```

### countdown.sh — While loop
```bash
read -p "Enter a number: " num
while [ "$num" -ge 0 ]; do echo "$num"; ((num--)); done
echo "Done!"
```

### greet.sh — CLI arguments
```bash
if [ -z "$1" ]; then echo "Usage: ./greet.sh <name>"
else echo "Hello, $1!"; fi
```

### args_demo.sh — Argument introspection
- `$#` = arg count, `$@` = all args, `$0` = script name

### install_packages.sh — Package management loop
- Checks root with `$EUID`
- Loops package list, installs missing ones with `dpkg -s`/`apt install`

### safe_script.sh — Error handling
- `set -e` at top makes script exit on any command failure
- `||` handles expected failures gracefully

## What I Learned
- `$@` and `$#` are essential for argument-driven scripts
- `set -e` prevents silent failures in long scripts
- `dpkg -s` reliably checks if a Debian package is installed
