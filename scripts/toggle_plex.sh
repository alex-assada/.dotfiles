#!/bin/bash

# Check the status of plexmediaserver.service
status=$(systemctl is-active plexmediaserver.service)

if [ "$status" = "active" ]; then
    echo "Stopping Plex Media Server..."
    sudo systemctl stop plexmediaserver.service
else
    echo "Starting Plex Media Server..."
    sudo systemctl start plexmediaserver.service
fi
