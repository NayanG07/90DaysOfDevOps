# Day 44 — Secrets, Artifacts & Running Real Tests in CI

## Secrets
- Created `MY_SECRET_MESSAGE` in repo Settings → Secrets
- Workflow reads it: `${{ secrets.MY_SECRET_MESSAGE }}`
- **Never print secrets:** GitHub masks the value in logs — shows `***`
- Pass secrets as env variables: `env: SECRET_MSG: ${{ secrets.MY_SECRET_MESSAGE }}`

## Artifacts
```yaml
- name: Generate report
  run: echo "Test report content" > test-report.txt
- uses: actions/upload-artifact@v4
  with:
    name: test-results
    path: test-report.txt
```
- Downloaded from Actions tab → Summary section
- **Cross-job artifacts:** Job 1 generates + uploads, Job 2 downloads with `actions/download-artifact@v4`

**Real-world use:** Save test reports, build binaries, screenshots, logs for debugging.

## Real Tests in CI
- Added `check_files.sh` to repo
- Workflow: checkout → `chmod +x` → run script
- Script exits 1 on failure → pipeline goes red
- Fixed the script → pipeline goes green

## Caching
```yaml
- uses: actions/cache@v4
  with:
    path: ~/.cache/pip
    key: ${{ runner.os }}-pip-${{ hashFiles('**/requirements.txt') }}
```
- First run: cache miss (installs deps, saves cache)
- Second run: cache hit (skips install, saves minutes)
- Cache stored by GitHub per branch, per key
