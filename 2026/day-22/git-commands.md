# Git Commands Reference

## Setup & Config
| Command | Description | Example |
|---------|-------------|---------|
| `git config --global user.name` | Set name for commits | `git config --global user.name "Kirito"` |
| `git config --global user.email` | Set email for commits | `git config --global user.email "kirito@example.com"` |
| `git config --list` | View all config | `git config --list` |

## Basic Workflow
| Command | Description | Example |
|---------|-------------|---------|
| `git init` | Initialize new repo | `git init` |
| `git status` | Show working tree status | `git status` |
| `git add <file>` | Stage file(s) | `git add git-commands.md` |
| `git add .` | Stage all changes | `git add .` |
| `git commit -m "msg"` | Commit staged changes | `git commit -m "Initial commit"` |
| `git log` | View commit history | `git log --oneline --graph --all` |
| `git diff` | Show unstaged changes | `git diff` |
| `git diff --staged` | Show staged changes | `git diff --staged` |

## Branching
| Command | Description | Example |
|---------|-------------|---------|
| `git branch` | List branches | `git branch` |
| `git branch <name>` | Create branch | `git branch feature-1` |
| `git checkout <branch>` | Switch branch | `git checkout feature-1` |
| `git switch <branch>` | Switch branch (modern) | `git switch feature-1` |
| `git checkout -b <name>` | Create + switch | `git checkout -b feature-2` |
| `git switch -c <name>` | Create + switch (modern) | `git switch -c feature-2` |
| `git branch -d <name>` | Delete branch | `git branch -d feature-2` |

## Remote
| Command | Description | Example |
|---------|-------------|---------|
| `git remote add origin <url>` | Add remote | `git remote add origin https://github.com/user/repo.git` |
| `git push -u origin <branch>` | Push branch to remote | `git push -u origin main` |
| `git pull` | Fetch + merge from remote | `git pull origin main` |
| `git fetch` | Download remote refs only | `git fetch origin` |
| `git clone <url>` | Clone remote repo | `git clone https://github.com/user/repo.git` |

## Merging & Rebasing
| Command | Description | Example |
|---------|-------------|---------|
| `git merge <branch>` | Merge branch into current | `git merge feature-login` |
| `git rebase <branch>` | Reapply commits on top | `git rebase main` |
| `git merge --squash <branch>` | Squash-merge commits | `git merge --squash feature-profile` |

## Stash & Cherry Pick
| Command | Description | Example |
|---------|-------------|---------|
| `git stash` | Stash working changes | `git stash` |
| `git stash pop` | Apply + drop latest stash | `git stash pop` |
| `git stash apply` | Apply stash without dropping | `git stash apply stash@{0}` |
| `git stash list` | List all stashes | `git stash list` |
| `git cherry-pick <hash>` | Apply specific commit | `git cherry-pick abc123` |

## Reset & Revert
| Command | Description | Example |
|---------|-------------|---------|
| `git reset --soft <ref>` | Move HEAD, keep changes staged | `git reset --soft HEAD~1` |
| `git reset --mixed <ref>` | Move HEAD, unstage changes | `git reset --mixed HEAD~1` |
| `git reset --hard <ref>` | Move HEAD, discard changes | `git reset --hard HEAD~1` |
| `git revert <hash>` | Create new commit undoing changes | `git revert abc123` |
| `git reflog` | Show all reference changes | `git reflog` |

## GitHub CLI
| Command | Description | Example |
|---------|-------------|---------|
| `gh auth login` | Authenticate with GitHub | `gh auth login` |
| `gh repo create` | Create a new repo | `gh repo create my-repo --public` |
| `gh repo clone <repo>` | Clone with gh | `gh repo clone owner/repo` |
| `gh issue create` | Create an issue | `gh issue create --title "Bug" --body "desc"` |
| `gh pr create` | Create a pull request | `gh pr create --fill` |
| `gh pr merge` | Merge a PR | `gh pr merge 123 --merge` |
| `gh run list` | List workflow runs | `gh run list --repo owner/repo` |
| `gh workflow list` | List workflows | `gh workflow list` |
