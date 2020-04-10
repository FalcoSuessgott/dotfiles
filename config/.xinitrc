#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb &HOME/.Xresources

xrandr --output DVI-I-2-2 --auto --right-of eDP-1 \
    --output DVI-I-1-1 --auto --right-of DVI-I-2-2

sxhkd &
exec bspwm

