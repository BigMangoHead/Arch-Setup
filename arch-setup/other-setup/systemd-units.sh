#!/bin/bash

systemctl --user enable --now ssh-agent # Authentification for github
sudo systemctl enable --now udevmon # Remaps caps lock
systemctl enable --now --user sync-math.timer # Enable math file syncing
sudo systemctl enable --now sync-phone.timer # Enable phone file syncing

# Enable audio
systemctl --user enable pipewire 
systemctl --user enable pipewire-pulse
