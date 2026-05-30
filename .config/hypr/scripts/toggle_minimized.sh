#!/bin/bash

# Get the active workspace name
active_ws=$(hyprctl activewindow -j | jq -r '.workspace.name')

if [[ "$active_ws" == "special:minimized" ]]; then
  # If we are in the special workspace, move window back to the previous workspace
  hyprctl dispatch movetoworkspace m+0
else
  # If we are in a normal workspace, send active window to minimized
  hyprctl dispatch movetoworkspacesilent special:minimized
fi
