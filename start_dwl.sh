#!/bin/bash

export XDG_CURRENT_DESKTOP=dwl
export XDG_SESSION_DESKTOP=dwl
export XDG_SESSION_TYPE=wayland
export XCURSOR_SIZE=32

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax)"
fi

systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE

dbus-run-session /usr/local/bin/slstatus -s | /usr/local/bin/dwl -s '${HOME}/.config/scripts/dwl/autostart.sh <&-' | tee .dwl.txt
