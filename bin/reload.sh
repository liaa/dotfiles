#!/bin/bash
pkill -9 xbindkeys
xbindkeys
# xrdb ~/.Xresources
hidpi

# reload the WIFI module
rmmod brcmfmac && modprobe brcmfmac
