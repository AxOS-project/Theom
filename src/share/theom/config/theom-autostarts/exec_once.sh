#!/bin/bash

# First time welcome:
/usr/share/theom/config/i3/other/first-time-welcome.sh &

# Polkit
(/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 || /usr/libexec/polkit-gnome-authentication-agent-1) &

# Start gfsd
/usr/lib/gvfsd &
/usr/lib/gvfsd-trash &

# Theom greeter
/usr/bin/theom-welcome &

# Start autotiling
if [ "$(theom-config functions.autotile)" = "true" ]; then
  autotiling 2>/dev/null &
fi

if [ "$(theom-config functions.kblayout_switch)" = "true" ]; then
  theom-kblayout-switch &
fi

# User scripts
## Battery notify
[ ! -s ~/.config/theom/user_scripts/battery_notify ] && ~/.config/theom/user_scripts/battery_notify & # Only executed if the script exists and is non-empty

## Apply X11 keymap
## TODO: add config or GUI for replace grp:alt_shift_toggle 
(
    layouts=$(localectl status | awk -F: '/X11 Layout/ {gsub(/^[ \t]+/, "", $2); print $2}')
    if [ -n "$layouts" ]; then
        setxkbmap "$layouts" -option 'grp:alt_shift_toggle'
    fi
) &

xfce4-power-manager &
