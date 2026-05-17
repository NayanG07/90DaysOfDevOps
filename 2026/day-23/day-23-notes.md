# Day 23 — Git Branching & Working with GitHub

## Task 1: Understanding Branches
1. **What is a branch?** A movable pointer to a specific commit. It lets you diverge from the main line of development.
2. **Why branches?** Isolate features, fixes, and experiments so `main` stays stable.
3. **What is `HEAD`?** A pointer to the currently checked-out branch/commit.
4. **What happens when you switch branches?** Git updates the working directory to match the target branch's snapshot. Uncommitted changes may carry over or cause conflicts.

## Task 2: Branching Commands
```bash
git branch -a                  # list all branches
git branch feature-1           # create branch
git switch feature-1           # switch to it
git switch -c feature-2        # create + switch
git commit -m "Feature 1 work" # commit on feature-1
git switch main                # back to main (commit not visible)
git branch -d feature-2        # delete branch
```

## Task 3: Push to GitHub
```bash
git remote add origin https://github.com/kirito/devops-git-practice.git
git branch -M main
git push -u origin main
git push -u origin feature-1
```
**origin vs upstream:** `origin` is your fork/remote; `upstream` is the original repo you forked from. You push/pull from `origin`, and sync from `upstream`.

## Task 4: Pull from GitHub
```bash
# Change made on GitHub via editor
git pull origin main
```
**`git fetch` vs `git pull`:** `fetch` downloads remote refs without merging; `pull` = `fetch` + `merge`.

## Task 5: Clone vs Fork
- **Clone:** Local copy of a remote repo (you can only push if you have write access).
- **Fork:** Server-side copy of someone else's repo on GitHub (you own it, can push changes).
- **When to clone:** You have write access or just need to read.
- **When to fork:** You want to contribute without direct write access.
- **Sync fork:** `git remote add upstream <original-url>` then `git pull upstream main`.
