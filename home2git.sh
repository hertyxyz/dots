#!/bin/bash

rsync -avu --delete ~/.config/awesome/ ./Awesome

git add .
git commit -m "Synchronised home -> git - $(date +%d/%m/%Y\ @\ %H:%M)"
git push
