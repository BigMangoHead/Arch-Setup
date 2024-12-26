#!/bin/bash

xrdb ~/.Xresources

xset r rate 200 30 # Decreases key delay for holding down keys (now 200 ms and 30 presses per second)
exec awesome --config "/home/bigma/.config/awesome/rc.lua"
