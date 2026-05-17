#!/bin/bash
set -e

mkdir /tmp/devops-test 2>/dev/null || echo "Directory already exists"
cd /tmp/devops-test
touch test-file.txt
echo "Script completed successfully"
