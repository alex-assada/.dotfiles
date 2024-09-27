#!/bin/bash

# Get the current layout
CURRENT_LAYOUT=$(setxkbmap -query | grep layout | awk '{print $2}')

# Toggle between us and ca layouts
if [ "$CURRENT_LAYOUT" = "us" ]; then
    setxkbmap -layout ca
else
    setxkbmap -layout us
fi
