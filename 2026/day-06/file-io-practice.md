# File I/O Practice

## Commands Used

### 1. Create empty file
```bash
touch notes.txt
```

### 2. Write first line (overwrite)
```bash
echo "Line 1: DevOps is a culture of collaboration and automation." > notes.txt
```

### 3. Append second line
```bash
echo "Line 2: Linux fundamentals are the foundation of every DevOps skill." >> notes.txt
```

### 4. Write and display with tee
```bash
echo "Line 3: Consistency matters more than perfection — show up every day." | tee -a notes.txt
```

### 5. Read full file
```bash
$ cat notes.txt
Line 1: DevOps is a culture of collaboration and automation.
Line 2: Linux fundamentals are the foundation of every DevOps skill.
Line 3: Consistency matters more than perfection — show up every day.
```

### 6. Read first 2 lines
```bash
$ head -n 2 notes.txt
Line 1: DevOps is a culture of collaboration and automation.
Line 2: Linux fundamentals are the foundation of every DevOps skill.
```

### 7. Read last 2 lines
```bash
$ tail -n 2 notes.txt
Line 2: Linux fundamentals are the foundation of every DevOps skill.
Line 3: Consistency matters more than perfection — show up every day.
```

## What I Learned
- `>` overwrites a file, `>>` appends
- `tee` writes to file and stdout simultaneously
- `head`/`tail` let you read specific portions of a file
- These commands are the building blocks of log inspection and config management
