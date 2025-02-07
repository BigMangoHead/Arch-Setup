#!/bin/bash

DATA_LOC="/home/bigma/scripts/data"

screenshot-partial

MN_LOC="$(cat "$DATA_LOC"/mn-dir)"
cd "$MN_LOC"
mkdir -p assets
cd assets
cp "/home/bigma/misc-files/screenshots/latest-screenshot.png" "$1".png

latex_info=$(cat "/home/bigma/.config/awesome/scripts/math-screenshot.tex")

xclip -selection clipboard <<< "${latex_info/00000/"$1"}"

