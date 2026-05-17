# Day 24 — Advanced Git: Merge, Rebase, Stash & Cherry Pick

## Task 1: Merge
- **Fast-forward merge:** Git simply moves the branch pointer forward — no new commit. Happens when the target branch hasn't diverged.
- **Merge commit:** Created when branches have diverged — Git combines the histories with a new commit.
- **Merge conflict:** Occurs when the same line of the same file was modified differently on both branches.

```bash
git checkout -b feature-login && touch login.txt && git add . && git commit -m "Add login"
git checkout main && git merge feature-login  # fast-forward
git checkout -b feature-signup && touch signup.txt && git add . && git commit -m "Add signup"
git checkout main && echo "main change" > shared.txt && git add . && git commit -m "Main change"
git merge feature-signup  # merge commit (diverged)
```

## Task 2: Rebase
- **What rebase does:** Rewrites commits from your branch and replays them on top of another branch's tip.
- **History difference:** Rebase creates a linear history; merge preserves the actual divergence.
- **Never rebase shared commits:** Rebasing rewrites history — others' clones will have divergent histories.
- **When to use:** Rebase for local/feature branches before merging; merge for shared branches/pull requests.

```bash
git checkout -b feature-dashboard
echo "dashboard" > dash.txt && git add . && git commit -m "Dashboard WIP"
git checkout main && echo "main update" >> shared.txt && git add . && git commit -m "Update main"
git checkout feature-dashboard && git rebase main
git log --oneline --graph --all
```

## Task 3: Squash Merge
- **Squash merge** collapses all feature branch commits into a single commit on main.
- **Trade-off:** Cleaner history (one commit per feature) but loses granular per-commit context.
- **When to use:** For small features where individual commits aren't meaningful.

```bash
git checkout -b feature-profile
echo "profile" > profile.txt && git add . && git commit -m "WIP"
echo "fix" >> profile.txt && git add . && git commit -m "Fix typo"
git checkout main && git merge --squash feature-profile && git commit -m "Add profile feature"
```

## Task 4: Stash
```bash
echo "uncommitted work" >> existing.txt
git stash push -m "WIP before hotfix"
git switch main && git switch - && git stash pop
git stash list  # shows all stashes
git stash apply stash@{2}  # apply specific stash
```
- **`pop` vs `apply`:** `pop` applies and removes from stash list; `apply` applies but keeps it.
- **When to use stash:** Context-switching — need to switch branches without committing half-done work.

## Task 5: Cherry Pick
```bash
git checkout -b feature-hotfix
echo "fix1" >> fix.txt && git add . && git commit -m "Fix 1"
echo "fix2" >> fix.txt && git add . && git commit -m "Fix 2"  # <-- pick this one
echo "fix3" >> fix.txt && git add . && git commit -m "Fix 3"
git checkout main
git cherry-pick <hash-of-fix2-commit>
```
- **Cherry-pick** applies a specific commit from one branch onto another.
- **When to use:** Hotfix that needs to go to production without merging the whole feature branch.
- **Risks:** Can create duplicate commits; may cause conflicts; doesn't preserve dependency order.
