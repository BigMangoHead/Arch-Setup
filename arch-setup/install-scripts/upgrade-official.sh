#!/bin/bash

sudo pacman -Syu
for filename in ~/arch-setup/packages/*; do
    if [[ $filename == *.pac ]]; then
        ~/arch-setup/install-scripts/install-packages.sh "$filename"
    fi
done
