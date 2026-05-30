#!/bin/bash
player=$(playerctl -l 2>/dev/null | head -n 1)
[ -z "$player" ] && exit 0
status=$(playerctl -p "$player" status 2>/dev/null)
[ "$status" = "Playing" ] && echo "󰐊" || echo "󰏤"