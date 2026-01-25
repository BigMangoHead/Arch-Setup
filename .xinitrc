#!/bin/bash

xrdb ~/.Xresources

brightness_command # Allow configuring brightness

sudo modprobe v412loopback # Enable virtual camera

xset r rate 200 30 # Decreases key delay for holding down keys (now 200 ms and 30 presses per second)

touchegg & # Touchscreen gestures

picom & # Window compositor
exec awesome --config "/home/bigma/.config/awesome/rc.lua"
