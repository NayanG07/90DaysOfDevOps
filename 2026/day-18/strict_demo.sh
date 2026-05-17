#!/bin/bash
set -euo pipefail

echo "Strict mode enabled"

# Uncomment to test each flag:
# echo "$UNDEFINED_VAR"   # set -u → unbound variable error
# false | true            # set -o pipefail → catches false failure
# invalid_command         # set -e → exits on error

echo "Script completed"
