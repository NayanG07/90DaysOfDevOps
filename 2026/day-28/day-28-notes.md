# Day 28 — Revision (Days 01–27)

## Self-Assessment

### Linux
- [x] Navigate file system, create/move/delete files
- [x] Manage processes — ps, top, kill
- [x] Work with systemd — systemctl, journalctl
- [x] Read/edit files with vim/nano
- [x] Troubleshoot CPU/memory/disk — top, free, df, du
- [x] Linux file system hierarchy
- [x] Create users and groups
- [x] File permissions — chmod (numeric + symbolic)
- [x] File ownership — chown, chgrp
- [x] LVM volumes
- [x] Network connectivity — ping, curl, ss, dig
- [x] DNS, IP, subnets, common ports

### Shell Scripting
- [x] Script with variables, arguments, user input
- [x] if/elif/else and case
- [x] for, while loops
- [x] Functions — args, return, local vars
- [x] grep, awk, sed, sort, uniq
- [x] Error handling — set -euo pipefail, trap
- [x] Crontab scheduling

### Git & GitHub
- [x] Init, stage, commit, history
- [x] Branching
- [x] Push/pull from GitHub
- [x] Clone vs fork
- [x] Merge — fast-forward vs merge commit
- [x] Rebase — when to use vs merge
- [x] Stash / pop
- [x] Cherry-pick
- [x] Squash merge vs regular merge
- [x] Reset (soft/mixed/hard) and revert
- [x] GitFlow, GitHub Flow, Trunk-Based
- [x] GitHub CLI — repos, PRs, issues

## Revisited Topics
1. **LVM** — re-ran `pvcreate`, `vgcreate`, `lvcreate`, `lvextend` + `resize2fs`
2. **Rebase** — created a branch, diverged, rebased, confirmed linear history with `git log --graph`
3. **set -euo pipefail** — wrote test scripts to verify each flag's behavior

## Quick-Fire Answers
1. `chmod 755 script.sh` → owner: rwx, group: rx, others: rx
2. Process = running program; service = long-running background process managed by init/systemd
3. `ss -tulpn | grep :8080` or `lsof -i :8080`
4. Exit on error (`-e`), error on unset var (`-u`), fail if any pipe stage fails (`-o pipefail`)
5. `reset --hard` removes commits and discards changes; `revert` creates a new commit that undoes changes
6. GitHub Flow — simple, PR-based, works with CI/CD
7. `git stash` temporarily saves uncommitted changes; use when you need to context-switch
8. `0 3 * * * /path/to/script.sh` in crontab
9. `fetch` downloads refs only; `pull` = fetch + merge
10. LVM provides flexible storage (resize without downtime, snapshots, volume groups across disks)

## Teach It Back: Git Branching
"A branch in Git is like a separate workspace where you can try new ideas without affecting the main workspace. You start from the main workspace (`main`), create a branch (`git branch feature-x`), switch to it (`git switch feature-x`), make your changes, and commit. When you're done, you merge your branch back (`git merge feature-x`). If you don't like it, just delete the branch — main stays clean."
