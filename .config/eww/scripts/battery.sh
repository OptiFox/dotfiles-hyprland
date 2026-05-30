#!/bin/bash

# Updated to use your hardware-specific path: BAT1
BAT_PATH="/sys/class/power_supply/BAT1"
AC_PATH="/sys/class/power_supply/ACAD"

percent=$(cat "$BAT_PATH/capacity")
status=$(cat "$BAT_PATH/status")

if [ "$1" = "icon" ]; then
    # Use ACAD path to check if plugged in
    if [ "$(cat $AC_PATH/online)" = "1" ]; then 
        echo "󱐋" # Charging icon
    elif [ "$percent" -gt 80 ]; then echo "󰁹"
    elif [ "$percent" -gt 40 ]; then echo "󰁾"
    else echo "󰁺"; fi
else
    echo "$percent"
fi