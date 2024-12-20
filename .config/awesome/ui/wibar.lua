-- Wibar stands for window bar

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local wibar_handler = {}

function wibar_handler.getwibar()
   local wibar = {}

   -- Create a textclock widget
   wibar.mytextclock = wibox.widget.textclock()
   
   -- Establish list of tags
   wibar.taglist_buttons = gears.table.join(
      awful.button({ }, 1, function(t) t:view_only() end),
      awful.button({ modkey }, 1, function(t)
	    if client.focus then
	       client.focus:move_to_tag(t)
	    end
      end),
      awful.button({ }, 3, awful.tag.viewtoggle),
      awful.button({ modkey }, 3, function(t)
	    if client.focus then
	       client.focus:toggle_tag(t)
	    end
      end),
      awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
      awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
   )

   -- Establish list of clients
   wibar.tasklist_buttons = gears.table.join(
      awful.button({ }, 1, function (c)
	    if c == client.focus then
	       c.minimized = true
	    else
	       c:emit_signal(
		  "request::activate",
		  "tasklist",
		  {raise = true}
	       )
	    end
      end),
      awful.button({ }, 3, function() awful.menu.client_list({ theme = { width = 500 } }) end),
      awful.button({ }, 4, function() awful.client.focus.byidx(1) end),
      awful.button({ }, 5, function() awful.client.focus.byidx(-1) end))

   return wibar
end

return wibar_handler
