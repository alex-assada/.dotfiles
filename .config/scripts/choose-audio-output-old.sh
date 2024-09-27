#!/bin/bash

# List available sinks and store in an array
sinks=($(pactl list short sinks | awk '{print $2}'))

# Display available sinks with formatting
echo "Choose a sink:"
for i in "${!sinks[@]}"; do
    # Clean up the sink name for better readability
    readable_sink="${sinks[i]#alsa_output.}"       # Remove the alsa_output. prefix
    readable_sink="${readable_sink#usb-}"          # Remove the usb- prefix if present
    readable_sink="${readable_sink#pci-}"          # Remove the pci- prefix if present

    # Only keep the part after the last slash if necessary
    readable_sink="${readable_sink##*/}"

    # Further clean the name
    if [[ "$readable_sink" == *".analog-stereo" ]]; then
        readable_sink="${readable_sink%.analog-stereo}"  # Remove .analog-stereo suffix
    fi

    echo "$((i + 1))) $readable_sink"
done

# Prompt user for choice
read -p "Enter the number of your choice: " choice

# Validate input
if [[ "$choice" -ge 1 && "$choice" -le "${#sinks[@]}" ]]; then
    # Get selected sink
    selected_sink=${sinks[$((choice - 1))]}
    # Set selected sink as default
    pactl set-default-sink "$selected_sink"
    echo "Set default sink to: ${selected_sink#alsa_output.}"
else
    echo "Invalid choice. Please run the script again."
fi

