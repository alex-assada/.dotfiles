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

# -------------------------MOUSE & HEADSET BATTERY-----------------------------
 #show mouse and headset battery %
allbat() {
  # Capture the output of the cli_app command
  headset_output=$(/opt/HyperXCloudIIWireless/target/release/cli_app)
  
  # Extract the battery percentage for the headset
  headset_battery=$(echo "$headset_output" | grep 'Battery level:' | awk '{print $3}')
  
  # Get the battery percentage for the mouse
  mouse_battery=$(solaar show | grep 'Battery:' | awk '{print $2}' | cut -d ',' -f 1 | head -n 1)
  
  # Print the battery percentages with the desired format
  echo "Headset: ${headset_battery}"
  echo "Mouse: ${mouse_battery}"
}

mbat() {
  mouse_battery=$(solaar show | grep 'Battery:' | awk '{print $2}' | cut -d ',' -f 1 | head -n 1)
  echo "Mouse: ${mouse_battery}"
}

hbat() {
  # Capture the output of the cli_app command
  headset_output=$(/opt/HyperXCloudIIWireless/target/release/cli_app)
  
  # Extract the battery percentage for the headset
  headset_battery=$(echo "$headset_output" | grep 'Battery level:' | awk '{print $3}')
  echo "Headset: ${headset_battery}"
}
# ----------------------------------------------------------------------------

#turn monitors off without putting system to sleep (same as letting pc idle for 5mins)
scroff() {
  xset dpms force off
}

