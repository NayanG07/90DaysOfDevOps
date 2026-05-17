# Day 46 — Reusable Workflows & Composite Actions

## Reusable Workflow (`.github/workflows/reusable-build.yml`)
```yaml
on:
  workflow_call:
    inputs:
      app_name:
        required: true
        type: string
      environment:
        required: false
        type: string
        default: staging
    secrets:
      docker_token:
        required: true
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Building ${{ inputs.app_name }} for ${{ inputs.environment }}"
      - run: echo "Docker token is set: true"
```

## Caller Workflow (`.github/workflows/call-build.yml`)
```yaml
name: Call Build
on: [push]
jobs:
  call-workflow:
    uses: ./.github/workflows/reusable-build.yml
    with:
      app_name: my-web-app
      environment: production
    secrets:
      docker_token: ${{ secrets.DOCKER_TOKEN }}
```

## Composite Action (`.github/actions/setup-and-greet/action.yml`)
```yaml
name: Setup and Greet
inputs:
  name:
    required: true
    type: string
  language:
    required: false
    default: en
outputs:
  greeted:
    value: "true"
runs:
  using: composite
  steps:
    - run: echo "Hello, ${{ inputs.name }}!"  && echo "OS: $(uname -s)" && echo "Date: $(date)"
      shell: bash
```

## Comparison

| | Reusable Workflow | Composite Action |
|---|---|---|
| Triggered by | `workflow_call` | `uses:` in a step |
| Can contain jobs? | Yes | No (steps only) |
| Can contain multiple steps? | Yes (per job) | Yes |
| Lives where? | `.github/workflows/` | Anywhere (commonly `.github/actions/`) |
| Can accept secrets directly? | Yes | No (must use env) |
| Best for | Multi-job pipeline composition | Reusable step groups |
