# Day 87 — Agentic AI for DevOps

## Setup
- Installed Ollama with Gemma 4 model
- Python dependencies: `ollama`, `requests`, `pyyaml`

## Docker Error Explainer (Module 1)
- Basic LLM call: pass Docker error message → get explanation
- Simple but powerful — instant error understanding

## Docker Troubleshooter Agent (Module 2)
- ReAct pattern: Reason → Act → Observe
- 3 tools: `list_containers`, `get_logs`, `inspect_container`
- LLM decides which tool to call based on user query
- Result: "Container nginx-pod exited with code 137 (OOMKilled). Logs show memory allocation failure."

## Key Concept
Agentic AI = LLM + Tools + Loop. The LLM reasons, calls tools, observes results, and iterates until the task is complete.
