#!/usr/bin/env bash

############################################
# KMonad Multi-Keyboard Launcher
# Starts one KMonad instance per keyboard
############################################

# Exit immediately if a command fails
set -e

############################################
# 1. Check arguments
############################################

if [ -z "$1" ]; then
    echo "Usage: $0 <kmonad-config-file>"
    exit 1
fi

KBD_CONFIG="$1"

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

KEYBOARD_DEVICES=()

# USB keyboards (external)
for dev in /dev/input/by-id/*-event-kbd; do
    if [ -e "$dev" ]; then
        KEYBOARD_DEVICES+=("$dev")
    fi
done

# Built-in keyboards (laptops, etc.)
for dev in /dev/input/by-path/*-event-kbd; do
    if [ -e "$dev" ]; then
        KEYBOARD_DEVICES+=("$dev")
    fi
done

############################################
# 4. Check if we found any keyboards
############################################

if [ ${#KEYBOARD_DEVICES[@]} -eq 0 ]; then
    echo "No keyboards found."
    exit 1
fi

echo "Found ${#KEYBOARD_DEVICES[@]} keyboard(s)."

############################################
# 5. Start KMonad for each keyboard
############################################

for keyboard in "${KEYBOARD_DEVICES[@]}"; do
    echo "Starting KMonad for: $keyboard"

    kmonad -w 0 \
        --input "device-file \"$keyboard\"" \
        "$KBD_CONFIG" &

    sleep 0.2
done

############################################
# 6. Done
############################################

echo "All KMonad instances started."
