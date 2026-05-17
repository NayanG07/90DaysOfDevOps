# Day 20 — Log Analyzer Challenge

## Script: `log_analyzer.sh`

### Features
- Validates input (arg required, file must exist)
- Counts ERROR/Failed lines
- Prints CRITICAL events with line numbers
- Shows top 5 ERROR messages sorted by frequency
- Generates timestamped report file
- Archives processed log file

### Sample Run
```bash
$ ./log_analyzer.sh sample_log.log

=== Error Summary ===
Total lines processed: 500
Total errors: 42

=== Critical Events ===
Line 84: 2026-05-16 10:15:23 CRITICAL Disk space below threshold
Line 217: 2026-05-16 14:32:01 CRITICAL Database connection lost

=== Top 5 Error Messages ===
 45  Connection timed out
 32  File not found
 28  Permission denied
 15  Disk I/O error
  9  Out of memory
```

### Tools Used
- `grep` — pattern matching, count, line numbers
- `awk` — strip timestamp columns for error grouping
- `sort` / `uniq` — aggregate and rank error messages
- `wc -l` — total line count
- `date` — timestamped report filename

## What I Learned
- `grep -cE "ERROR|Failed"` counts lines matching either pattern
- `awk '{$1=$2=$3=""; print}'` strips date/time/PID columns to group by message
- Piping `sort | uniq -c | sort -rn` is the standard idiom for frequency analysis
