#!/bin/bash
MAX_LEN=20
player=$(playerctl -l 2>/dev/null | head -n 1)
[ -z "$player" ] && exit 0
title=$(playerctl -p "$player" metadata title 2>/dev/null)
artist=$(playerctl -p "$player" metadata artist 2>/dev/null)
full="$title - $artist"
if [ ${#full} -gt $MAX_LEN ]; then
    echo "${full:0:$MAX_LEN}.."
else
    echo "$full"
fi