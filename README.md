#Owen's Dotfiles
---

These are my dotfiles. Whenever I update a rice, I ensure that frameworks are in place, making it easy to switch between "themes" without messing around with branches etc.

Running the `git2home.sh` script will copy everything to it's correct place, but will also delete anything that is already there.

To cut down on bloat, there are only basic instructions in this readme file. For more specific instructions, check the readme files in each of the individual subdirectories.

If you want to take my dotfiles and adapt them for your own setup, you can fork this repo, and synchronise your home config by changing the rsynced directories in the 2 `.sh` files in the repo root. I personally keep my dotfiles synchronised between 2 PCs, and use cron jobs to automatically run these scripts.
