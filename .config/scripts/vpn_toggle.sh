#!/bin/bash

VPN_PROFILE="ovpn-UDP4-1997-manager-config (2)"  # Replace with your VPN profile name

# Check if qBittorrent is running
if pgrep -x "qbittorrent" > /dev/null; then
    notify-send "VPN not started" "qBittorrent is running"
    echo "VPN: not started, qBittorrent is running"
    exit 1
fi

# Check if the VPN is already active
if nmcli connection show --active | grep -q "$VPN_PROFILE"; then
    # Disconnect the VPN
    nmcli connection down id "$VPN_PROFILE"
    notify-send "VPN disconnected"
    echo "VPN: off"
else
    # Connect the VPN
    nmcli connection up id "$VPN_PROFILE"
    notify-send "VPN connected"
    echo "VPN: on"
fi

