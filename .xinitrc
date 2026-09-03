#!/bin/bash

xrdb ~/.Xresources

sudo modprobe v412loopback # Enable kernel module for virtual camera

xset r rate 200 30 # Decreases key delay for holding down keys (now 200 ms and 30 presses per second)

touchegg & # Touchscreen gestures

picom & # Window compositor

screentearoff & # Run script to fix screen tearing with NVIDIA

# I don't really understand what these do, but they fixed an issue
# I was having with my file picker for a while. Has something to do
# with xdg-desktop-portal-gtk missing necessary variables to work
systemctl --user import-environment DISPLAY XAUTHORITY
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY

exec awesome --config "/home/bigma/.config/awesome/rc.lua"
