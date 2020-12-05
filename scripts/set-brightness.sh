#!bin/bash

# Looking for device
# xrandr -q | grep "conncted"

xrandr --output eDP-1 --brightness $1
