#!/bin/bash
#
# Joins external monitors and restarts polybar and bspwm
#
###########################################################


[ "$1" == "home" ] &&  xrandr --output DVI-I-2-2 --auto --right-of eDP-1 --output DVI-I-1-1 --auto --right-of DVI-I-2-2
[ "$1" == "sva" ] && xrandr --output HDMI-1 --auto --right-of eDP-1


bspc wm -r 

