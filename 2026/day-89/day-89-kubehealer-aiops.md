# Day 89 — KubeHealer: AIOps on Kubernetes

## What is KubeHealer?
An AI-driven system using Temporal workflows to automatically detect and heal broken Kubernetes applications. Combines LLM reasoning with K8s diagnostic tools in a fault-tolerant workflow engine.

## Components
- **Temporal Server**: Durable workflow execution engine
- **Worker** (`worker.py`): Runs the KubeHealer agent workflow
- **Starter** (`starter.py`): Triggers a healing run
- **Anthropic Claude**: LLM for diagnostic reasoning

## Broken Apps Healed
1. **web-app**: Image typo (`nginx` → `nginix`) — agent detected ImagePullBackOff, determined the typo
2. **memory-app**: OOM crash — agent found OOMKilled in pod status, identified need for memory limits
3. **config-app**: Missing ConfigMap — agent found ConfigMap error, created the missing resource

## Healing Workflow
1. Temporal triggers healing run
2. Agent gathers pod status, logs, events
3. LLM analyzes symptoms and suggests fix
4. Agent applies the fix (update image, add resources, create ConfigMap)
5. Verifies pod becomes healthy
