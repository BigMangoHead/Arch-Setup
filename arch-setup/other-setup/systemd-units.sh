#!/bin/bash

systemctl --user enable --now ssh-agent # Authentification for github
sudo systemctl enable --now udevmon # Remaps caps lock
sudo systemctl enable --now sync-phone.timer # Enable phone file syncing
systemctl enable --now --user syncthing.service # File syncing through syncthing
sudo systemctl enable --now snapd.service # Downloading other applications
sudo systemctl enable --now ntpd.service # Time synchronization

# Enable audio
systemctl --user enable pipewire 
systemctl --user enable pipewire-pulse
