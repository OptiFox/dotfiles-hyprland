#!/bin/bash

killall -9 waybar
swaync-client --reload-css

waybar &
# swaync &
