#!/usr/bin/env bash

############################################
# KMonad Multi-Keyboard Launcher
# Starts one KMonad instance per keyboard
############################################

# Exit immediately if a command fails
set -e

############################################
# 1. Determine script directory
############################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Default config file (same directory as script)
KBD_CONFIG="$SCRIPT_DIR/keymap.kbd"

# Keyboard list file
KEYBOARD_LIST="$SCRIPT_DIR/keyboard.list"

############################################
# 2. Verify config file exists
############################################

if [ ! -f "$KBD_CONFIG" ]; then
  echo "Error: Config file '$KBD_CONFIG' does not exist."
  exit 1
fi

############################################
# 3. Find all keyboard devices
############################################

echo "Searching for keyboard devices..."

# Clear existing keyboard list
>"$KEYBOARD_LIST"

# USB keyboards (external)
for dev in /dev/input/by-id/*-event-kbd; do
  if [ -e "$dev" ]; then
    echo "$dev" >>"$KEYBOARD_LIST"
  fi
done

# Built-in keyboards (laptops, etc.)
for dev in /dev/input/by-path/*-event-kbd; do
  if [ -e "$dev" ]; then
    echo "$dev" >>"$KEYBOARD_LIST"
  fi
done

# Remove duplicates (if any)
sort -u "$KEYBOARD_LIST" -o "$KEYBOARD_LIST"

############################################
# 4. Check if we found any keyboards
############################################

if [ ! -s "$KEYBOARD_LIST" ]; then
  echo "No keyboards found."
  exit 1
fi

KEYBOARD_COUNT=$(wc -l <"$KEYBOARD_LIST")
echo "Found $KEYBOARD_COUNT keyboard(s)."

############################################
# 5. Start KMonad for each keyboard
############################################

while IFS= read -r keyboard; do
  echo "Starting KMonad for: $keyboard"

  kmonad -w 0 \
    --input "device-file \"$keyboard\"" \
    "$KBD_CONFIG" &

  sleep 0.2
done <"$KEYBOARD_LIST"

############################################
# 6. Done
############################################

echo "All KMonad instances started."
