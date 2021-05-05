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

# Config for kitty
rsync -avu --delete ./Kitty/ ~/.config/kitty

# Config for rofi
rsync -avu --delete ./Rofi/ ~/.config/rofi

# Wallpapers
rsync -avu --delete ./Papes/ ~/Pictures/Papes

# Picom (compton) config
cp ./picom.conf ~/.config/picom.conf

# Xresources
#cp ./Xresources/$THEME.xresources ~/.Xresources

# Emacs (DOOM) config
#rsync -avu --delete ./Emacs/emacsd/ ~/.emacs.d
#rsync -avu --delete ./Emacs/doomd/ ~/.doom.d
