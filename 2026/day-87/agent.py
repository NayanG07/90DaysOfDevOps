import subprocess
import json
from ollama import chat

tools = [
    {
        "type": "function",
        "function": {
            "name": "list_containers",
            "description": "List all Docker containers",
        },
    },
    {
        "type": "function",
        "function": {
            "name": "get_logs",
            "description": "Get logs from a container",
            "parameters": {
                "type": "object",
                "properties": {"name": {"type": "string"}},
                "required": ["name"],
            },
        },
    },
    {
        "type": "function",
        "function": {
            "name": "inspect_container",
            "description": "Inspect a container",
            "parameters": {
                "type": "object",
                "properties": {"name": {"type": "string"}},
                "required": ["name"],
            },
        },
    },
]


def list_containers():
    result = subprocess.run(["docker", "ps", "-a"], capture_output=True, text=True)
    return result.stdout


def get_logs(name):
    result = subprocess.run(["docker", "logs", name], capture_output=True, text=True)
    return result.stdout


def inspect_container(name):
    result = subprocess.run(
        ["docker", "inspect", name], capture_output=True, text=True
    )
    return result.stdout


functions = {
    "list_containers": list_containers,
    "get_logs": get_logs,
    "inspect_container": inspect_container,
}

messages = [
    {
        "role": "system",
        "content": "You are a Docker Troubleshooter. Use tools to diagnose container issues.",
    },
    {"role": "user", "content": "List all containers and check the logs of any failed ones"},
]

response = chat("gemma:2b", messages=messages, tools=tools)
if response.message.tool_calls:
    for tc in response.message.tool_calls:
        result = functions[tc.function.name](**tc.function.arguments)
        messages.append({"role": "tool", "content": result})
    final = chat("gemma:2b", messages=messages)
    print(final.message.content)
else:
    print(response.message.content)
