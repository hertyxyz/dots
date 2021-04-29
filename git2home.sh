#!/bin/bash

# Choose the theme by changing the variable below
THEME="amora"

# Available themes:
#  - amora
#  - rouge

# Pull changes from git
git pull

# Config for awesomewm
rsync -avu --delete ./Awesome/ ~/.config/awesome

# Wallpapers
rsync -avu --delete ./Papes/ ~/Pictures/Papes

# Xresources
#cp ./Xresources/$THEME.xresources ~/.Xresources

# Emacs (DOOM) config
#rsync -avu --delete ./Emacs/emacsd/ ~/.emacs.d
#rsync -avu --delete ./Emacs/doomd/ ~/.doom.d
