#!/bin/sh
swaymsg 'border pixel 0' 
wofi --show=drun -I -i --conf="/home/Bee/.config/wofi/style.css" 
sleep 1
swaymsg 'border pixel 3'
exit 0
