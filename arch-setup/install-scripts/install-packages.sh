#!/bin/bash

# Takes single input of .pac file to read from


words=""

# Read the file line by line
while IFS= read -r line; do
    # Ignore blank lines or lines starting with a hashtag
    if [[ -z "$line" || "$line" =~ ^# ]]; then
        continue
    fi

    # Remove everything after the first space or # (if any)
    pack=$(echo "$line" | cut -d' ' -f1 | cut -d'#' -f1)
    
    # Collect packages
    packages+="$pack "
done < $1

# Download 
pacman -S --noconfirm --needed $packages
