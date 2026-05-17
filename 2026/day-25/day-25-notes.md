# Day 25 — Git Reset vs Revert & Branching Strategies

## Task 1: Git Reset
```bash
# Setup
echo "A" > file.txt && git add . && git commit -m "A"
echo "B" >> file.txt && git add . && git commit -m "B"
echo "C" >> file.txt && git add . && git commit -m "C"

# --soft: HEAD moves back, changes stay staged
git reset --soft HEAD~1  # HEAD now at B, changes from C are staged

# --mixed (default): HEAD moves back, changes unstaged
git reset --mixed HEAD~1  # HEAD now at A, changes from B-C unstaged

# --hard: HEAD moves back, changes discarded
git reset --hard HEAD~1   # HEAD now at A, changes from B-C gone
```

| Mode | HEAD | Staging | Working Dir |
|------|------|---------|-------------|
| `--soft` | Moved | Kept | Kept |
| `--mixed` | Moved | Reset | Kept |
| `--hard` | Moved | Reset | Reset |

- **Destructive:** `--hard` — changes are lost (unless in reflog).
- **Pushed commits:** Never use `--hard` on shared branches; use `revert` instead.

## Task 2: Git Revert
```bash
echo "X" > x.txt && git add . && git commit -m "X"
echo "Y" > y.txt && git add . && git commit -m "Y"
echo "Z" > z.txt && git add . && git commit -m "Z"
git revert <hash-of-Y>
git log --oneline  # Y still visible, new commit "Revert Y" added
```

## Task 3: Reset vs Revert

| | `git reset` | `git revert` |
|---|---|---|
| What it does | Moves branch pointer backward | Creates new commit that undoes changes |
| Removes commit from history? | Yes (soft/mixed/hard) | No — history is preserved |
| Safe for shared branches? | No (rewrites history) | Yes (adds forward commit) |
| When to use | Local/private branches only | Any branch, especially shared |

## Task 4: Branching Strategies

### GitFlow
```
main ──┬── hotfix
       └── develop ──┬── feature/*
                     └── release/*
```
- **Pros:** Strict isolation for releases, hotfixes, features.
- **Cons:** Heavy overhead; complex for fast-moving teams.
- **When used:** Large teams with scheduled releases.

### GitHub Flow
```
main ── feature-branch → PR → merge to main → deploy
```
- **Pros:** Simple, PR-based, continuous deployment.
- **Cons:** No release branches; riskier for complex releases.
- **When used:** Startups, SaaS, CI/CD-driven teams.

### Trunk-Based Development
```
main ── short-lived branches (hours → days)
```
- **Pros:** Fastest integration; no merge hell.
- **Cons:** Requires feature flags; discipline for small commits.
- **When used:** High-velocity teams, feature flag infrastructure.

**Startup shipping fast:** GitHub Flow.
**Large team, scheduled releases:** GitFlow.
**Kubernetes:** Trunk-Based Development.
