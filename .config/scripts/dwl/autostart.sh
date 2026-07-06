#!/bin/bash

pkill mako 2>/dev/null
mako &

sleep 1

systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE

wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
