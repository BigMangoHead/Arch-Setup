#!/bin/sh

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

# Add color shift to screen to make easier on eyes
run redshift -P -O 5500
