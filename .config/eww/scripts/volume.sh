#!/bin/bash

get_vol() {
    pamixer --get-volume
}

set_vol() {
    pamixer --set-volume "$1"
}

get_bright() {
    brightnessctl i | grep -oP '\(\K[^%]+'
}

set_bright() {
    brightnessctl set "$1"%
}

"$1" "$2"