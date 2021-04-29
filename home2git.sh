#!/bin/bash

# Config for awesomewm
rsync -avu --delete ~/.config/awesome/ ./Awesome

# Wallpapers
rsync -avu --delete ~/Pictures/Papes/ ./Papes

# Push changes to git
git add .
git commit -m "Synchronised home -> git - $(date +%d/%m/%Y\ @\ %H:%M)"
git push
