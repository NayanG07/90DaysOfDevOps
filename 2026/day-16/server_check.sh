#!/bin/bash
SERVICE="sshd"
read -p "Do you want to check the status? (y/n): " response
if [ "$response" = "y" ]; then
    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE is active"
    else
        echo "$SERVICE is not active"
    fi
else
    echo "Skipped."
fi
