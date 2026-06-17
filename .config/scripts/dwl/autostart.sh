#!/bin/bash

pkill mako 2>/dev/null
mako &

export WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-0}"

sleep 1

wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
