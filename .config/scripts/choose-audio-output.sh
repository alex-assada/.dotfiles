#!/bin/bash

# Dynamically get the sinks by name
HEADPHONES=$(pactl list short sinks | grep -i "HyperX_Cloud_II" | awk '{print $2}')
SPEAKERS=$(pactl list short sinks | grep -i "G2000" | awk '{print $2}')
AIRPODS=$(pactl list short sinks | grep -i "B8_21_1C_5F_29_E8" | awk '{print $2}')

# Get current sink to highlight it in the list
currentsink=$(pactl get-default-sink)

# Helper function to append '*' if current sink
append_star() {
    if [ "$1" == "$currentsink" ]; then
        echo "*"
    else
        echo " "
    fi
}

# List all sinks and store in an array
sinks=($(pactl list short sinks | awk '{print $2}'))

# Check if there are any sinks available
if [ ${#sinks[@]} -eq 0 ]; then
    echo "No audio sinks available."
    exit 1
fi

# Display available sinks with friendly names and "*" for the current one
echo "Choose a sink:"
echo "1) Headphones $(append_star "$HEADPHONES")"
echo "2) Speakers $(append_star "$SPEAKERS")"
echo "3) Airpods $(append_star "$AIRPODS")"

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
    3)
        selected_sink="$AIRPODS"
        ;;
    *)
        echo "Invalid choice. Please run the script again."
        exit 1
        ;;
esac

# Set selected sink as default
pactl set-default-sink "$selected_sink"
echo "Set default sink to: ${selected_sink#alsa_output.}"

