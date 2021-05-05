#!/bin/bash

TMPBG=/tmp/screen.png
RES=3840x1440

ffmpeg -f x11grab \
	   -video_size $RES \
	   -y \
	   -i :0 \
	   -filter_complex "boxblur=5:1:cr=6" \
	   -vframes 1 \
	   $TMPBG

i3lock -i $TMPBG