#!/bin/bash

sudo pacman -Syu
for filename in ~/arch-setup/packages/*; do
    if [[ $filename == *.pac ]]; then
        ~/arch-setup/install-scripts/install-packages.sh "$filename"
    fi
    if [[ $filename == *.aurpac ]]; then
        ~/arch-setup/install-scripts/install-aur-packages.sh "$filename"
    fi
done
