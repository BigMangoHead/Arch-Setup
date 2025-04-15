To get neovim running, run
```:PlugUpdates```
within neovim

To setup rclone for data syncing, start by running
```rclone config```
Make sure to copy config over to /root/ so that the system
can use access keys to sync things like phone files

To disable discord startup updates, add the line
```"SKIP_HOST_UPDATE": true```
to ~/.config/discord/settings.json
