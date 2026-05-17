# Day 88 — Multi-Tool Agent and MCP

## Multi-Tool Agent (Module 3)
- 3 Docker tools + 3 Kubernetes tools in one agent
- Docker: `list_containers`, `get_logs`, `inspect_container`
- Kubernetes: `get_pods`, `describe_pod`, `get_pod_logs`
- Applied broken pod (`broken-pod.yaml`) → agent diagnosed image pull error

## MCP (Model Context Protocol)
- Standard protocol for LLM ↔ tool communication
- `mcp_server.py`: FastMCP server exposing K8s tools
- `agent_with_mcp.py`: Client connecting via `langchain-mcp-adapters`
- Benefits: Tools can be written in any language, hosted anywhere

## CI/CD Failure Analyzer (Module 6)
- 3 tools: `list_workflow_runs`, `get_failed_logs`, `get_workflow_file`
- Applied broken CI workflow → agent found exit code 1 in test job
- Automatically determines which step failed and why
