# Day 49 — DevSecOps: Security in CI/CD

## What is DevSecOps?
Adding automated security checks to the CI/CD pipeline so vulnerabilities are caught before they reach production — not as a separate process, but as pipeline steps.

## Security Steps Added

### 1. Docker Image Vulnerability Scan (Trivy)
```yaml
- uses: aquasecurity/trivy-action@master
  with:
    image-ref: 'kirito/myapp:latest'
    format: 'table'
    exit-code: '1'
    severity: 'CRITICAL,HIGH'
```
- Scans image for CVEs after Docker build, before push
- Fails pipeline if CRITICAL or HIGH vulnerabilities found
- Found 2 HIGH CVEs in base image → switched from `ubuntu:22.04` to `python:3.11-slim`

### 2. GitHub Secret Scanning
- Enabled in repo Settings → Code security and analysis
- **Secret scanning:** Detects leaked secrets in code
- **Push protection:** Blocks pushes that contain secrets
- If an AWS key is detected, GitHub alerts the repo admins and revokes the push

### 3. Dependency Vulnerability Check
```yaml
- uses: actions/dependency-review-action@v4
  with:
    fail-on-severity: critical
```
- Runs on PRs only
- Checks new dependencies against vulnerability databases
- Prevents introducing known-vulnerable packages

### 4. Least-Privilege Permissions
```yaml
permissions:
  contents: read
```
- Added to workflow files that don't need write access
- Only workflows that comment on PRs get `pull-requests: write`
- Prevents compromised actions from writing to the repo

## Updated Pipeline Diagram
```
PR opened → build & test → dependency review ← NEW
Merge to main → build & test → Docker build → Trivy scan ← NEW
  → Docker push (only if scan passes) → deploy
Always active → GitHub secret scanning + push protection ← NEW
```

## What I Learned
- DevSecOps isn't a separate tool — it's adding security checks to existing pipelines
- Trivy found real vulnerabilities in my base image that I wouldn't have known about
- Least-privilege permissions are easy to add and prevent supply chain attacks
