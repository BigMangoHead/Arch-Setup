To get neovim running, run
``:PlugUpdates``
within neovim

To setup rclone for data syncing, start by running
``rclone config``
Make sure to copy config over to /root/ so that the system
can use access keys to sync things like phone files

To disable discord startup updates, add the line
``"SKIP_HOST_UPDATE": true``
to ~/.config/discord/settings.json

To add precompilation to bits/stdc++.h file, go
to ``/usr/include/c++/15.2.1/x86_64-pc-linux-gnu/bits/stdc++.h``
(should be about right), and just compile the header inside that
directory (likely with sudo). Output should be ``stdc++.h.gch``
