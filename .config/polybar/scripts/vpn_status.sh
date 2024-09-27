#!/bin/bash

VPN_PROFILE="ovpn-UDP4-1997-manager-config (2)"  # Replace with your VPN profile name

# Check if the VPN is active
if nmcli connection show --active | grep -q "$VPN_PROFILE"; then
    echo "on"
else
    echo "off"
fi

