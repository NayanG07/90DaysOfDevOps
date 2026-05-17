#!/bin/bash
demo_local() {
    local msg="Inside function"
    echo "$msg"
}
demo_no_local() {
    msg="Leaked outside"
    echo "$msg"
}

demo_local
echo "After local call: $msg"  # empty — local didn't leak

demo_no_local
echo "After no-local call: $msg"  # prints — leaked
