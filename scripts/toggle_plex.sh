#!/bin/bash

# Check the status of plexmediaserver.service
status=$(systemctl is-active plexmediaserver.service)

if [ "$status" = "active" ]; then
    echo "Stopping Plex Media Server..."
    sudo systemctl stop plexmediaserver.service
    
    # Verify if the service was stopped successfully
    if [ "$(systemctl is-active plexmediaserver.service)" = "inactive" ]; then
        echo "Plex Media Server successfully stopped."
    else
        echo "Failed to stop Plex Media Server."
    fi
else
    echo "Starting Plex Media Server..."
    sudo systemctl start plexmediaserver.service
    
    # Verify if the service was started successfully
    if [ "$(systemctl is-active plexmediaserver.service)" = "active" ]; then
        echo "Plex Media Server successfully started."
    else
        echo "Failed to start Plex Media Server."
    fi
fi
