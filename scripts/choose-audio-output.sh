#!/bin/bash

# Define your sinks
HEADPHONES="alsa_output.usb-HP__Inc_HyperX_Cloud_II_Wireless_0-00.analog-stereo"
# SPEAKERS="alsa_output.usb-ZhuHai_JieLi_Technology_EDIFIER_G2000_20160823-01.analog-stereo"

# RUN THIS COMMAND TO SWAP LEFT AND RIGHT CHANNELS:
# pactl load-module module-remap-sink sink_name=my-sink channel_map=front-left,front-right master_channel_map=front-right,front-left
SPEAKERS="my-sink"

# List all sinks and store in an array
sinks=($(pactl list short sinks | awk '{print $2}'))

# Check if there are any sinks available
if [ ${#sinks[@]} -eq 0 ]; then
    echo "No audio sinks available."
    exit 1
fi

# Display available sinks with friendly names
echo "Choose a sink:"
echo "1) Headphones"
echo "2) Speakers"

# Prompt user for choice
read -p "Enter the number of your choice: " choice

# Validate input and set the corresponding sink
case $choice in
    1)
        selected_sink="$HEADPHONES"
        ;;
    2)
        selected_sink="$SPEAKERS"
        ;;
    *)
        echo "Invalid choice. Please run the script again."
        exit 1
        ;;
esac

# Set selected sink as default
pactl set-default-sink "$selected_sink"
echo "Set default sink to: ${selected_sink#alsa_output.}"

