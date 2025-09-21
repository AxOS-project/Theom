#!/bin/bash
use_bar=$(theom-config bar.use_bar | tr -d '[:space:]')

if [ "$use_bar" = "ewwii" ]; then
    ~/.config/ewwii/launch.sh
elif [ "$use_bar" = "polybar" ]; then
    ~/.config/polybar/launch.sh
fi
