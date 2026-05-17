# Day 42 — Runners: GitHub-Hosted & Self-Hosted

## GitHub-Hosted Runners
- Managed by GitHub — clean VM per job
- Pre-installed with Docker, Python, Node, Git, etc.
- Free tier: 2000 min/month (public repos: unlimited)

## Self-Hosted Runner Setup
```bash
# Download and configure (from GitHub UI)
mkdir actions-runner && cd actions-runner
curl -O https://github.com/actions/runner/releases/download/v2.316.1/actions-runner-linux-x64-2.316.1.tar.gz
tar xzf actions-runner-linux-x64-2.316.1.tar.gz
./config.sh --url https://github.com/kirito/github-actions-practice --token <TOKEN>
./run.sh
```
- Verified: Runner shows **Idle** with green dot in GitHub
- Created `/tmp/self-hosted-test.txt` via workflow — file persisted on host

## Labels
- Added `my-linux-runner` label
- `runs-on: [self-hosted, my-linux-runner]` targets specific runners
- Useful when you have dedicated runners for specific hardware or environments

## Comparison

| | GitHub-Hosted | Self-Hosted |
|---|---|---|
| Who manages it? | GitHub | You |
| Cost | Free quota + paid beyond | Free (your hardware) |
| Pre-installed tools | Many (Docker, Python, Node, etc.) | Only what you install |
| Good for | Standard builds, cross-OS testing | Custom hardware, cost savings, security |
| Security concern | Code runs on GitHub's VMs | You own the security |
