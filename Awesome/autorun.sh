#!/bin/bash

# Compositor (Picom/compton)
picom --config ~/.config/picom.conf --experimental-backends

# Set Wallpaper (uncomment to override/dynamically set wallpaper)
#nitrogen --restore

# Set keymap to UK
setxkbmap gb