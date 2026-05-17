# Day 22 — Git: Your First Repository

## Answers

1. **What is the difference between `git add` and `git commit`?**
   `git add` moves changes from the working directory to the staging area (index). `git commit` takes what's in the staging area and creates a permanent snapshot (commit) in the repository history.

2. **What does the staging area do? Why doesn't Git just commit directly?**
   The staging area lets you selectively choose which changes to include in a commit. You might have multiple files changed but only want to commit one logical group first. It acts as a checkpoint between edit and save.

3. **What information does `git log` show you?**
   Commit hash (SHA), author, date, and commit message for each commit. `--oneline` shows a compact hash + message view. `--graph` shows branch history visually.

4. **What is the `.git/` folder and what happens if you delete it?**
   `.git/` IS the repository — it stores all commits, branches, refs, and config. Deleting it removes all version history; the working directory becomes a plain folder with no Git tracking.

5. **What is the difference between working directory, staging area, and repository?**
   - **Working directory**: the actual files on disk you edit
   - **Staging area (index)**: a pre-commit holding area (`git add` puts files here)
   - **Repository**: the `.git/` database of committed snapshots

## Commands Used
```bash
git config --global user.name "Kirito"
git config --global user.email "kirito@example.com"
git init
git status
git add git-commands.md
git commit -m "Add git commands reference"
git log --oneline
```
