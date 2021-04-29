#!/bin/bash

# Choose the theme by changing the variable below
THEME="amora"

# Available themes:
#  - amora
#  - rouge

# Config for awesomewm
rsync -avu --delete ~/.config/awesome/ ./Awesome

# Wallpapers
rsync -avu --delete ~/Pictures/Papes/ ./Papes

# Xresources
#cp ~/.Xresources ./Xresources/$THEME.xresources

# Emacs (DOOM) config
#rsync -avu --delete ~/.emacs.d/ ./Emacs/emacsd
#rsync -avu --delete ~/.doom.d/ ./Emacs/doomd

# Push changes to git
git add .
git commit -m "Synchronised home -> git - $(date +%d/%m/%Y\ @\ %H:%M)"
git push
