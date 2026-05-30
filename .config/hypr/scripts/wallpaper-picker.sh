#!/bin/bash

# --- CONFIG ---
WALL_DIR="$HOME/Pictures/Wallpaper"

# 1. Build the list with icon metadata
list_items=""
# Using 'find' is safer for filenames with spaces (Linux+ Best Practice)
while IFS= read -r path; do
  file=$(basename "$path")
  list_items+="$file\0icon\x1f$path\n"
done < <(find "$WALL_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \))

# 2. Launch Rofi
selection=$(echo -e "$list_items" | rofi -dmenu \
  -i -p " 󰸉 " \
  -show-icons \
  -theme "~/.config/rofi/wall-switcher.rasi")

# 3. Apply Selection & Notify
if [ -n "$selection" ]; then
  # Set live wallpaper
  awww img "$WALL_DIR/$selection" --transition-type center

  # Update cache for hyprlock
  rm -f "$HOME/.cache/current_wallpaper" && cp "$WALL_DIR/$selection" "$HOME/.cache/current_wallpaper"

  # --- NOTIFICATION ---
  # -h string:x-canonical... ensures the notification REPLACES the previous one
  # -i passes the actual image as the notification icon!
  notify-send -e -u low \
    -h string:x-canonical-private-synchronous:wallpaper-picker \
    -i "$WALL_DIR/$selection" \
    "Wallpaper Updated" \
    "Applied: $selection"
fi
