# Day 26 — GitHub CLI

## Task 1: Install and Authenticate
```bash
# Install (Ubuntu)
sudo apt install gh -y

# Authenticate
gh auth login
# Supports: HTTPS (personal access token), SSH, GitHub App

# Verify
gh auth status
```

## Task 2: Working with Repositories
```bash
gh repo create test-repo --public --add-readme  # create
gh repo clone owner/repo                         # clone with gh
gh repo view owner/repo                          # view details
gh repo list                                     # list repos
gh repo view --web                               # open in browser
gh repo delete test-repo                         # delete
```

## Task 3: Issues
```bash
gh issue create --title "Fix login bug" --body "Error on submit" --label "bug"
gh issue list                                    # list open issues
gh issue view 1                                  # view specific issue
gh issue close 1                                 # close issue
```
**Automation with `gh issue`:** Script daily issue triage, auto-close stale issues, create issues from monitoring alerts.

## Task 4: Pull Requests
```bash
git checkout -b fix-login
echo "fix" > login-fix.txt && git add . && git commit -m "Fix login bug"
git push -u origin fix-login
gh pr create --title "Fix login" --body "Closes #1" --fill
gh pr list                                       # list PRs
gh pr view 2                                     # view PR details
gh pr merge 2 --merge                            # merge PR
```
**Merge methods:** `--merge` (merge commit), `--squash` (squash), `--rebase` (rebase).
**Review PR:** `gh pr checkout 2` then `gh pr review --approve`.

## Task 5: Workflows
```bash
gh run list --repo owner/repo                    # list workflow runs
gh run view <run-id>                             # view run details
```
Useful for CI/CD: check status, re-run failed jobs, cancel runs from terminal.

## Task 6: Useful `gh` Tricks
```bash
gh api repos/owner/repo                          # raw API call
gh gist create file.txt                          # create gist
gh release create v1.0.0 --notes "Release notes" # create release
gh alias set prs "pr list --limit 10"            # create alias
gh search repos "topic:devops"                   # search repos
```
