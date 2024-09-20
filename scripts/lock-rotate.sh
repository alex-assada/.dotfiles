
#!/bin/sh

font="dedede"
green="9ece6a"
red="db4b4b"

# Lock Screen rotate through themes
state_file="/tmp/i3lock_state"
i3lock="/usr/bin/i3lock"
# Define the themes as an array of functions
themes=(
  "theme_chalet"
  "theme_asterix"
)

# WALLPAPER MAKES SCRIPT LAG IF NOT 1080p

# Blurred Chalet Theme
theme_chalet() {
    i3lock -n --force-clock -F -i ~/Pictures/wallpapers/chalet-blur.png -e \
    --refresh-rate=1 --line-uses-inside --pointer=default --pass-media-keys --pass-volume-keys --pass-screen-keys \
    --inside-color="$green" --ring-color="$green" --insidever-color="$green" --ringver-color="$green" --insidewrong-color="$red" --ringwrong-color="$red" \
    --keyhl-color="$green" --separator-color="$green" --bshl-color="$green" --color=000000 \
    --time-str="%H:%M" --time-size=140 --time-pos="3480:300" --time-font="Roboto mono:style=Bold" --time-color="$font" \
    --date-str="%A, %d %B" --date-size=45 --date-pos="3480:380" --date-font="Roboto mono" --date-color="$font" \
    --verif-text="Verifying" --greeter-text="" --wrong-text="Wrong Password!" --noinput-text="No input" \
    --verif-font="Roboto mono"  --greeter-font="Roboto mono" --wrong-font="Roboto mono" \
    --verif-size=35 --greeter-size=35 --wrong-size=35 \
    --verif-pos="3480:540" --greeter-pos="3480:600" --wrong-pos="3480:540" \
    --verif-color="$green" --greeter-color="$font" --wrong-color="$red" \
    --bar-indicator --bar-direction=0 --bar-step=10 --bar-max-height=10 --bar-base-width=10 --bar-total-width=1920 --bar-color=00000000 --bar-pos="2480:1070"  
}

# Asterix Theme
theme_asterix() {
    i3lock -n --force-clock -F -i ~/Pictures/wallpapers/asterix_obelix_colored1080.jpg -e \
    --refresh-rate=1 --line-uses-inside --pointer=default --pass-media-keys --pass-volume-keys --pass-screen-keys \
    --inside-color="$green" --ring-color="$green" --insidever-color="$green" --ringver-color="$green" --insidewrong-color="$red" --ringwrong-color="$red" \
    --keyhl-color="$green" --separator-color="$green" --bshl-color="$green" --color=000000 \
    --time-str="%H:%M" --time-size=140 --time-pos="2800:500" --time-font="ObelixPro-cyr" --time-color="$font" \
    --date-str="%A, %d %B" --date-size=45 --date-pos="2800:580" --date-font="ObelixPro-cyr" --date-color="$font" \
    --verif-text="Verifying" --greeter-text="" --wrong-text="Wrong Password!" --noinput-text="No input" \
    --verif-font="ObelixPro-cyr"  --greeter-font="ObelixPro-cyr" --wrong-font="ObelixPro-cyr" \
    --verif-size=35 --greeter-size=35 --wrong-size=35 \
    --verif-pos="3480:540" --greeter-pos="3480:600" --wrong-pos="3480:540" \
    --verif-color="$green" --greeter-color="$font" --wrong-color="$red" \
    --bar-indicator --bar-direction=0 --bar-step=10 --bar-max-height=10 --bar-base-width=10 --bar-total-width=1920 --bar-color=00000000 --bar-pos="2480:1070"  
}

# Check if the state file exists, if not, create it and set state to 0
if [ ! -f "$state_file" ]; then
    echo "0" > "$state_file"
fi

# Read the current state
state=$(cat "$state_file")

# Calculate the next state by incrementing the current state and modulo with the number of themes
next_state=$(( (state + 1) % ${#themes[@]} ))

# Execute the function corresponding to the next state
"${themes[next_state]}"

# Save the new state
echo "$next_state" > "$state_file"

