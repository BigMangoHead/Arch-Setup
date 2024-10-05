local awful = require("awful")

local config = {}

function config:runconfig()
   local vars = {}

   -- This is used later as the default terminal, browser, and editor to run.
   vars.terminal = "alacritty --working-directory " .. os.getenv("HOME")
   vars.editor = os.getenv("EDITOR") or "nano"
   vars.browser = "thorium-browser"
   vars.editor_cmd = vars.terminal .. " -e " .. vars.editor

   -- Additional commands
   vars.sleep_cmd = "systemctl sleep"
   vars.reboot_cmd = "reboot"
      
   
   -- Default modkey.
   -- Usually, Mod4 is the key with a logo between Control and Alt.
   -- If you do not like this or do not have such a key,
   -- I suggest you to remap Mod4 to another key using xmodmap or other tools.
   -- However, you can use another modifier like Mod1, but it may interact with others.
   vars.modkey = "Mod4"
   
   
   
   -- Table of layouts to cover with awful.layout.inc, order matters.
   awful.layout.layouts = {
      awful.layout.suit.floating,
      awful.layout.suit.tile,
      awful.layout.suit.tile.left,
      awful.layout.suit.tile.bottom,
      awful.layout.suit.tile.top,
      awful.layout.suit.fair,
      awful.layout.suit.fair.horizontal,
      awful.layout.suit.spiral,
      awful.layout.suit.spiral.dwindle,
      awful.layout.suit.max,
      awful.layout.suit.max.fullscreen,
      awful.layout.suit.magnifier,
      awful.layout.suit.corner.nw,
      -- awful.layout.suit.corner.ne,
      -- awful.layout.suit.corner.sw,
      -- awful.layout.suit.corner.se,
   }

   -- Keyboard map indicator and switcher
   vars.mykeyboardlayout = awful.widget.keyboardlayout()
   
   return vars
end

return config
