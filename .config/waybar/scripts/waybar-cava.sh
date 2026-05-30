#!/bin/bash

# Define the bar icons (same ones in your config)
icons=(" " "·" "–" "=" "≡" "≡" "≡")

killall -q cava
# We read the numbers from CAVA and swap them for icons
cava -p ~/.config/waybar/scripts/cava_config | while read -r line; do
  output=""
  # Loop through each digit in the output (e.g., '0', '1', '7')
  for ((i = 0; i < ${#line}; i++)); do
    digit="${line:$i:1}"
    # If it's a number, pick the icon. Otherwise, keep it.
    if [[ $digit =~ [0-7] ]]; then
      output+="${icons[$digit]}"
    # If it's a semicolon or anything else, just skip it
    else
      continue
    fi
  done
  echo "$output"
done
