#!/bin/bash
#
# Joins external monitors and restarts polybar and bspwm
#
###########################################################


xrandr --output DVI-I-2-2 --auto --right-of eDP-1 --output DVI-I-1-1 --auto --right-of DVI-I-2-2
bspc wm -r 

