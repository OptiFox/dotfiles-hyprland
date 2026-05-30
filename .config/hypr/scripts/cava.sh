#!/bin/bash

# Configuration
VIS_BARS=4              # Number of bars (compact)
MAX_HEIGHT=7            # Max height (match your icons array)
COLOR_ACTIVE="#cba6f7"  # Catppuccin Mauve
icons=(" " "·" "–" "=" "≡" "≡" "≡")

# 1. Player check
player=$(playerctl -l 2>/dev/null | head -n 1)
[ -z "$player" ] && exit 0

status=$(playerctl -p "$player" status 2>/dev/null)
# If paused, show flat bars
if [[ "$status" != "Playing" ]]; then
    echo "····"
    exit 0
fi

# 2. Math-based Animation (Triangle Wave)
# Uses milliseconds to ensure it moves every time hyprlock polls it
CURRENT_TIME_MS=$(date +%s%3N)
MASTER_PHASE=$(( CURRENT_TIME_MS / 120 ))

output=""
for ((i=0; i<VIS_BARS; i++)); do
    # Calculate height phase
    h=$(( (i * 3 + MASTER_PHASE) % (MAX_HEIGHT * 2) ))
    
    # Fold the wave back down
    if (( h > MAX_HEIGHT )); then
        h=$(( MAX_HEIGHT * 2 - h ))
    fi
    
    # Map height to your icon array
    output+="${icons[$h]}"
done

# 3. Output with Pango Color
echo "<span foreground='$COLOR_ACTIVE'>$output</span>"