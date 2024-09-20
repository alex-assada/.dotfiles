# Aliases
alias bt='bluetoothctl'
alias :q='exit'
alias bat='batcat'
alias emacs=nvim
alias lvim='nvim -c "normal '\''0"'
alias logout='i3-msg exit'
alias xpl='gh copilot explain'
alias fzf='fzf --preview="batcat --style=numbers --color=always --line-range :500 {}" --color=16'
alias fzn='fzf --preview="batcat --style=numbers --color=always --line-range :500 {}" --color=16 | xargs -r nvim'

# Functions
#combined cd + ls command
function cdls {
  builtin cd "$@" && ls
}

#lock the screen
function lock {
  $HOME/.config/scripts/lock.sh
}

#pipes the result of a command into a temp nvim buffer
W() {
    nvim -c "setlocal buftype=nofile bufhidden=wipe" -c "nnoremap <buffer> q :q!<CR>" -
}

#plex script for toggling on and off the server
toggle_plex() {
  ~/.config/scripts/toggle_plex.sh
}

# -------------------------MOUSE & HEADSET BATTERY-----------------------------
 #show mouse and headset battery %
allbat() {
  # Capture the output of the cli_app command
  headset_output=$(/opt/hyper_x_Linux/cli_app)
  
  # Extract the battery percentage for the headset
  headset_battery=$(echo "$headset_output" | grep 'Battery level:' | awk '{print $3}')
  
  # Get the battery percentage for the mouse
  mouse_battery=$(solaar show | grep 'Battery:' | awk '{print $2}' | cut -d ',' -f 1 | head -n 1)
  
  # Print the battery percentages with the desired format
  echo "Headset: ${headset_battery}"
  echo "Mouse: ${mouse_battery}"
  dossbat
}

mbat() {
  mouse_battery=$(solaar show | grep 'Battery:' | awk '{print $2}' | cut -d ',' -f 1 | head -n 1)
  echo "Mouse: ${mouse_battery}"
}

hbat() {
  # Capture the output of the cli_app command
  headset_output=$(/opt/hyper_x_Linux/cli_app)
  
  # Extract the battery percentage for the headset
  headset_battery=$(echo "$headset_output" | grep 'Battery level:' | awk '{print $3}')
  echo "Headset: ${headset_battery}"
}

dossbat() {
  # Capture the output of the cli_app command
  doss_output=$(upower -i /org/freedesktop/UPower/devices/headset_dev_FC_58_FA_E9_3D_BC)
  # Extract the battery percentage for the speaker
  doss_battery=$(echo "$doss_output" | grep 'percentage:' | awk '{print $2}')
  echo "DOSS: ${doss_battery}"
}


# ----------------------------------------------------------------------------

#turn monitors off without putting system to sleep (same as letting pc idle for 5mins)
scroff() {
  xset dpms force off
}

