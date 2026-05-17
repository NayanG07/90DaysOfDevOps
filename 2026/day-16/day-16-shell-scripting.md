# Day 16 — Shell Scripting Basics

## Scripts Created

### hello.sh
```bash
#!/bin/bash
echo "Hello, DevOps!"
```
**Output:** `Hello, DevOps!`
Without shebang, the system may try to run it with `/bin/sh` instead of `/bin/bash`.

### variables.sh
```bash
NAME="Kirito"
ROLE="DevOps Engineer"
echo "Hello, I am $NAME and I am a $ROLE"
```
**Output:** `Hello, I am Kirito and I am a DevOps Engineer`
Single quotes `'$VAR'` treat `$VAR` as literal; double quotes `"$VAR"` expand it.

### greet.sh
```bash
read -p "Enter your name: " name
read -p "Enter your favourite tool: " tool
echo "Hello $name, your favourite tool is $tool"
```
**Output:**
```
Enter your name: Kirito
Enter your favourite tool: Docker
Hello Kirito, your favourite tool is Docker
```

### check_number.sh
```bash
read -p "Enter a number: " num
if [ "$num" -gt 0 ]; then echo "Positive"
elif [ "$num" -lt 0 ]; then echo "Negative"
else echo "Zero"; fi
```
**Test:** `5` → Positive, `-2` → Negative, `0` → Zero

### file_check.sh
```bash
read -p "Enter filename: " filename
if [ -f "$filename" ]; then echo "File exists"
else echo "File does not exist"; fi
```
**Test:** Existing file → "File exists", missing → "File does not exist"

### server_check.sh
```bash
SERVICE="sshd"
read -p "Do you want to check? (y/n): " resp
if [ "$resp" = "y" ]; then
    systemctl is-active --quiet "$SERVICE" && echo "$SERVICE is active" || echo "$SERVICE is not active"
else echo "Skipped."; fi
```

## What I Learned
- Shebang is required for the script to run with the correct interpreter
- Variable expansion depends on quote type (double vs single)
- `-f` tests for file existence; `-d` for directories
