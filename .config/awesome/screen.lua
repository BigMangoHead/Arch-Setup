
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local battery_widget = require("libs/battery-widget")

local screen_handler = {}

function screen_handler.init(window_manager, mymenu, wallpaper_handler, wibar_handler)
   -- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
   screen.connect_signal("property::geometry", wallpaper_handler.set_wallpaper)

   mywibar = wibar_handler.getwibar()
   
   awful.screen.connect_for_each_screen(function(s)
	 -- Wallpaper
	 wallpaper_handler.set_wallpaper(s)

	 -- Create tags for each window
	 window_manager:create_tags()

	 -- Create a promptbox for each screen
	 s.mypromptbox = awful.widget.prompt()
	 -- Create an imagebox widget which will contain an icon indicating which layout we're using.
	 -- We need one layoutbox per screen.
	 s.mylayoutbox = awful.widget.layoutbox(s)
	 s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

	 -- Create window list widget
	 s.mywindowlist = wibox.widget {
	    text = window_manager.selected_window.window_name,
	    halign = "center",
	    valign = "center",
	    widget = wibox.widget.textbox,
	    buttons = gears.table.join(awful.button({}, 1, function () window_manager.menu:toggle() end))
	 }
	 
	 -- Create a taglist widget
	 -- TODO: Update window instances to reflect tag when one is selected
	 s.mytaglist = awful.widget.taglist {
	    screen  = s,
	    filter  = window_manager.taglist_filter,
	    buttons = mywibar.taglist_buttons
	 }
	 
	 -- Create a tasklist widget
	 s.mytasklist = awful.widget.tasklist {
	    screen  = s,
	    filter  = awful.widget.tasklist.filter.currenttags,
	    buttons = mywibar.tasklist_buttons
	 }

	 -- Create the wibox
	 s.mywibox = awful.wibar({ position = "top", screen = s, opacity = 0.8 })
	 
	 -- Add widgets to the wibox
	 s.mywibox:setup {
	    layout = wibox.layout.align.horizontal,
	    { -- Left widgets
	       layout = wibox.layout.fixed.horizontal,
	       mymenu.mylauncher,
	       s.mywindowlist,
	       s.mytaglist,
	       s.mypromptbox,
	    },
	    s.mytasklist, -- Middle widget
	    { -- Right widgets
	       layout = wibox.layout.fixed.horizontal,
	       battery_widget {},
	       wibox.widget.systray(),
	       mywibar.mytextclock,
	       s.mylayoutbox,
	    },
	 }
	
	 -- Make sure correct selected window is fully loaded
	 window_manager:change_selected_window(window_manager.selected_window)
   end)
end

return screen_handler
   
