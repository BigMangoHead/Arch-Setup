
local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

menu_constructor = {}

function menu_constructor.getmainmenu()
   local menu = {}
   -- Create a launcher widget and a main menu
   menu.myawesomemenu = {
      { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
      { "manual", vars.terminal .. " -e man awesome" },
      { "edit config", vars.editor_cmd .. " " .. awesome.conffile },
      { "restart", awesome.restart },
      { "quit", function() awesome.quit() end },
   }
   
   menu.mymainmenu = awful.menu({ items = { { "Awesome", menu.myawesomemenu, beautiful.awesome_icon },
				     { "Open Terminal", vars.terminal },
				     { "Sleep", vars.sleep_cmd },
				     { "Reboot", vars.reboot_cmd }
   }, theme = {width = 250}
			       })
   
   menu.mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
					menu = menu.mymainmenu })
   
   -- Menubar configuration
   menubar.utils.terminal = vars.terminal -- Set the terminal for applications that require it

   return menu
end

return menu_constructor
