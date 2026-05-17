#!/bin/bash
greet() {
    echo "Hello, $1!"
}
add() {
    echo "$(($1 + $2))"
}
greet "Kirito"
add 5 3
