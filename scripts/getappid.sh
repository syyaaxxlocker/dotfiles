#!/bin/bash

if [[ -z "$1" ]]; then
    echo "You must enter the program whose app_id you want to get"
    exit 1
fi

WAYLAND_DEBUG=1 "$@" 2>&1 | grep 'set_app_id'
