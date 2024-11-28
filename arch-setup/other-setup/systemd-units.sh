#!/bin/bash

systemctl --user enable --now ssh-agent # Authentification for github
sudo systemctl enable --now udevmon # Remaps caps lock

# Enable audio
systemctl --user enable pipewire 
systemctl --user enable pipewire-pulse
