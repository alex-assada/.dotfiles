#!/bin/bash

VPN_PROFILE="ovpn-UDP4-1997-manager-config (2)"  # Replace with your VPN profile name

# Function to check if check_qbitorrent is running

check_qbitorrent() {
    pgrep -x "qbittorrent" > /dev/null
}

# Check if the VPN is already active
if nmcli connection show --active | grep -q "$VPN_PROFILE"; then
    # Disconnect the VPN
    nmcli connection down id "$VPN_PROFILE"
    notify-send --urgency=critical "VPN disconnected"
    echo "VPN: off"
else
    #Check if qBittorrent is running
    if check_qbitorrent; then
        notify-send "qBittorrent is running, please close it before connecting to VPN"
        exit 1
    fi

    # Connect the VPN
    nmcli connection up id "$VPN_PROFILE"
    notify-send "VPN connected"
    echo "VPN: on"
fi

