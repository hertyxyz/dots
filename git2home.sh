#!/bin/bash

# Pull changes from git
git pull

# Config for awesomewm
rsync -avu --delete ./Awesome/ ~/.config/awesome

# Wallpapers
rsync -avu --delete ./Papes/ ~/Pictures/Papes
