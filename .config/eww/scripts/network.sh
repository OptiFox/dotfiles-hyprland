#!/bin/bash

# Function to get WiFi status and icon
get_wifi() {
    # Check if actually connected to a network
    if nmcli -t -f DEVICE,STATE dev | grep -q "wlan0:connected"; then
        echo " "  # Icon for connected
    elif [ "$(nmcli radio wifi)" = "enabled" ]; then
        echo " "  # Icon for WiFi ON but not connected
    else
        echo " "  # Icon for WiFi OFF
    fi
}

# Function to get Bluetooth status and icon
get_bt() {
    if bluetoothctl show | grep -q "Powered: yes"; then
        echo "󰂯"  # Bluetooth ON icon
    else
        echo "󰂲"  # Bluetooth OFF icon
    fi
}

# The Logic Switch (This handles the 'get_wifi_icon' arguments)
case $1 in
    "get_wifi_icon")
        get_wifi
        ;;
    "get_bt_icon")
        get_bt
        ;;
    *)
        echo "Invalid Argument"
        ;;
esac