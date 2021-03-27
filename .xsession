#!/bin/bash

if [ -d "/snap/bin" ]; then
    PATH="$PATH:/snap/bin"
fi

if [ -d "/home/liang/dotfiles/bin" ]; then
    PATH="$PATH:/home/liang/dotfiles/bin"
fi

# source the bash_profile
# [ -r /home/liang/.bash_profile ] && source /home/liang/.bash_profile

# Make CapsLock behave like Ctrl:
# for mac
# setxkbmap -option ctrl:nocaps,altwin:swap_lalt_lwin
# for external keyboard
hidp &
setxkbmap -option ctrl:nocaps

# Make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'

# Configure monitor resolution
#xrandr --output eDP-1 --mode 1440x900
xrandr --output eDP-1 --mode 1680x1050
#xrandr --output eDP-1 --mode 1920x1200

# Natural scrolling for touchpad and Microsoft mouse(id=19)
# Usefull command
# '$ xinput list'
# '$ xinput --test <device_id>'
# '$ xinput list-props <device_id>'
xinput --set-prop bcm5974 "libinput Natural Scrolling Enabled" 1
xinput --set-prop "Microsoft Microsoft® 2.4GHz Transceiver v9.0 Mouse" "libinput Natural Scrolling Enabled" 1
#xinput --set-prop 19 "libinput Natural Scrolling Enabled" 1


# start xkeybinds, will ready configure of ~/.xbindkeysrc
xbindkeys &

# export TMPDIR="/home/liang/.config/clipmenu"
# clipmenud &

# workrave &

# fonts
# xset +fp /home/liang/.fonts
# xset fp rehash

# dwm
# dwm statusbar - show current date and time
# sh ~/dwm-bar/dwm_bar.sh &

while true;  do  dwm > /dev/null; done;
