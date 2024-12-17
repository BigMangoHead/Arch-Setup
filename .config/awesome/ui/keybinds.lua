
local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")

binding_handler = {}

function binding_handler.bind_keys(window_manager, main_menu)
   -- {{{ Mouse bindings
   root.buttons(gears.table.join(
		   awful.button({ }, 1, function ()
			 main_menu:hide()
			 window_manager.menu:hide()
		   end),
		   awful.button({ }, 3, function () main_menu:toggle() end),
		   awful.button({ }, 4, function () window_manager.selected_window:step_to_other_tag(1) end),
		   awful.button({ }, 5, function () window_manager.selected_window:step_to_other_tag(-1) end)
   ))
   -- }}}

   -- {{{ Key bindings
   globalkeys = gears.table.join(
      awful.key({ vars.modkey,           }, "s",      hotkeys_popup.show_help,
	 {description="show help", group="awesome"}),
      awful.key({ vars.modkey,           }, "Left",
	 function () window_manager.selected_window:step_to_other_tag(-1) end,
	 {description = "view previous", group = "tag"}),
      awful.key({ vars.modkey,           }, "Right",
	 function () window_manager.selected_window:step_to_other_tag(1) end,
	 {description = "view next", group = "tag"}),
      awful.key({ vars.modkey,           }, "Escape", awful.tag.history.restore,
	 {description = "go back", group = "tag"}),
      
      awful.key({ vars.modkey,           }, "j",
	 function ()
            awful.client.focus.byidx( 1)
	 end,
	 {description = "focus next by index", group = "client"}
      ),
      awful.key({ vars.modkey,           }, "k",
	 function ()
            awful.client.focus.byidx(-1)
	 end,
	 {description = "focus previous by index", group = "client"}
      ),
      awful.key({ vars.modkey,           }, "w", function () main_menu:show() end,
	 {description = "show main menu", group = "awesome"}),
      
      -- Client manipulation
      awful.key({ vars.modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
	 {description = "swap with next client by index", group = "client"}),
      awful.key({ vars.modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
	 {description = "swap with previous client by index", group = "client"}),
      awful.key({ vars.modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
	 {description = "focus the next screen", group = "screen"}),
      awful.key({ vars.modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
	 {description = "focus the previous screen", group = "screen"}),
      awful.key({ vars.modkey,           }, "u", awful.client.urgent.jumpto,
	 {description = "jump to urgent client", group = "client"}),
      awful.key({ vars.modkey,           }, "Tab",
	 function ()
            awful.client.focus.history.previous()
            if client.focus then
	       client.focus:raise()
            end
	 end,
	 {description = "go back", group = "client"}),
      
      -- Program hotkeys
      awful.key({ vars.modkey,           }, "Return", function () awful.spawn(vars.terminal) end,
	 {description = "open a terminal", group = "launcher"}),
      awful.key({ vars.modkey, "Control" }, "r", awesome.restart,
	 {description = "reload awesome", group = "awesome"}),
      awful.key({ vars.modkey, "Shift"   }, "q", awesome.quit,
	 {description = "quit awesome", group = "awesome"}),
      awful.key({ vars.modkey,           }, "/", function () awful.spawn(vars.browser) end,
	 {description = "open a browser", group = "launcher"}),
      
      -- Layout manipulation
      awful.key({ vars.modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
	 {description = "increase master width factor", group = "layout"}),
      awful.key({ vars.modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
	 {description = "decrease master width factor", group = "layout"}),
      awful.key({ vars.modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
	 {description = "increase the number of master clients", group = "layout"}),
      awful.key({ vars.modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
	 {description = "decrease the number of master clients", group = "layout"}),
      awful.key({ vars.modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
	 {description = "increase the number of columns", group = "layout"}),
      awful.key({ vars.modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
	 {description = "decrease the number of columns", group = "layout"}),
      awful.key({ vars.modkey,           }, "space", function () awful.layout.inc( 1)                end,
	 {description = "select next", group = "layout"}),
      awful.key({ vars.modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
	 {description = "select previous", group = "layout"}),
      
      awful.key({ vars.modkey, "Control" }, "n",
	 function ()
	    local c = awful.client.restore()
	    -- Focus restored client
	    if c then
	       c:emit_signal(
		  "request::activate", "key.unminimize", {raise = true}
	       )
	    end
	 end,
	 {description = "restore minimized", group = "client"}),
      
      -- Prompt
      awful.key({ vars.modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
	 {description = "run prompt", group = "launcher"}),
      
      awful.key({ vars.modkey }, "x",
	 function ()
	    awful.prompt.run {
	       prompt       = "Run Lua code: ",
	       textbox      = awful.screen.focused().mypromptbox.widget,
	       exe_callback = awful.util.eval,
	       history_path = awful.util.get_cache_dir() .. "/history_eval"
	    }
	 end,
	 {description = "lua execute prompt", group = "awesome"}),
      -- Menubar
      awful.key({ vars.modkey }, "p", function() menubar.show() end,
	 {description = "show the menubar", group = "launcher"}),

      -- More tag commands
      awful.key({ vars.modkey }, "a", function()
	    local new_tag = window_manager.selected_window:add_tag()
	    new_tag:view_only()
      end,
	 {description = "adds a tag to the selected window and moves to it", group = "tag"}),
      awful.key({ vars.modkey, "Shift" }, "d", function()
	    local window = window_manager.selected_window
	    local tag = awful.screen.focused().selected_tag
	    if not window then return end
	    if not tag then return end
	    window:remove_tag(tag)
      end,
	 {description = "Removes the selected tag", group = "tag"})
   )
   
   clientkeys = gears.table.join(
      awful.key({ vars.modkey,           }, "f",
	 function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
	 end,
	 {description = "toggle fullscreen", group = "client"}),
      awful.key({ vars.modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
	 {description = "close", group = "client"}),
      awful.key({ vars.modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
	 {description = "toggle floating", group = "client"}),
      awful.key({ vars.modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
	 {description = "move to master", group = "client"}),
      awful.key({ vars.modkey,           }, "o",      function (c) c:move_to_screen()               end,
	 {description = "move to screen", group = "client"}),
      awful.key({ vars.modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
	 {description = "toggle keep on top", group = "client"}),
      awful.key({ vars.modkey,           }, "n",
	 function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
	 end ,
	 {description = "minimize", group = "client"}),
      awful.key({ vars.modkey,           }, "m",
	 function (c)
            c.maximized = not c.maximized
            c:raise()
	 end ,
	 {description = "(un)maximize", group = "client"}),
      awful.key({ vars.modkey, "Control" }, "m",
	 function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
	 end ,
	 {description = "(un)maximize vertically", group = "client"}),
      awful.key({ vars.modkey, "Shift"   }, "m",
	 function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
	 end ,
	 {description = "(un)maximize horizontally", group = "client"})
   )
   
   -- Bind all key numbers to tags.
   -- Be careful: we use keycodes to make it work on any keyboard layout.
   -- This should map on the top row of your keyboard, usually 1 to 9.

   globalkeys = gears.table.join(globalkeys,
				    -- View tag only.
				    awful.key({ vars.modkey }, "#" .. 10,
				       function ()
					  window_manager.selected_window:switch_tag_by_index(1)
				       end,
				       {description = "view tag #"..1, group = "tag"}),
				    -- Toggle tag display.
				    awful.key({ vars.modkey, "Control" }, "#" .. 10,
				       function ()
					  window_manager.selected_window:toggle_tag_by_index(1)
				       end,
				       {description = "toggle tag #" .. 1, group = "tag"}
				       ),
				    -- Move client to tag.
				    awful.key({ vars.modkey, "Shift" }, "#" .. 10,
				       function ()
					  if client.focus then
					     local tag = window_manager.selected_window.taglist[1]
					     if tag then
						client.focus:move_to_tag(tag)
					     end
					  end
				       end,
				       {description = "move focused client to tag #"..1, group = "tag"}),
				    -- Toggle tag on focused client.
				    awful.key({ vars.modkey, "Control", "Shift" }, "#" .. 10,
				       function ()
					  if client.focus then
					     local tag = window_manager.selected_window.taglist[1]
					     if tag then
						client.focus:toggle_tag(tag)
					     end
					  end
				       end,
				       {description = "toggle focused client on tag #" .. 1, group = "tag"}),
                                    -- Move client to window.
				    awful.key({vars.modkey, "Alt"}, "#" .. 10, 
				       function ()
					  if client.focus then
				             local tag = window_manager.get_windows[10].taglist[1]
					     if tag then
						client.focus:move_to_tag(tag)
					     end
					  end
				       end,
				       {description = "move focused client to window #"..1, group = "tag"})
				    )

   for i = 2, 9 do
      globalkeys = gears.table.join(globalkeys,
				    -- View tag only.
				    awful.key({ vars.modkey }, "#" .. i + 9,
				       function ()
					  window_manager.selected_window:switch_tag_by_index(i)
				       end),
				    -- Toggle tag display.
				    awful.key({ vars.modkey, "Control" }, "#" .. i + 9,
				       function ()
					  window_manager.selected_window:toggle_tag_by_index(i)
				       end),
				    -- Move client to tag.
				    awful.key({ vars.modkey, "Shift" }, "#" .. i + 9,
				       function ()
					  if client.focus then
					     local tag = window_manager.selected_window.taglist[i]
					     if tag then
						client.focus:move_to_tag(tag)
					     end
					  end
				       end),
				    -- Toggle tag on focused client.
				    awful.key({ vars.modkey, "Control", "Shift" }, "#" .. i + 9,
				       function ()
					  if client.focus then
					     local tag = window_manager.selected_window.taglist[i]
					     if tag then
						client.focus:toggle_tag(tag)
					     end
					  end
				       end),
				    -- Move client to window.
				    awful.key({vars.modkey, "Alt"}, "#" .. i + 9, 
				       function ()
					  if client.focus then
				             local tag = window_manager.get_windows[i].taglist[1]
					     if tag then
						client.focus:move_to_tag(tag)
					     end
					  end
				       end)
				    )
   end

   -- Bind window keys
   for i = 1, 9 do
      globalkeys = gears.table.join(globalkeys,
				    -- Switch to window
				    awful.key({ vars.modkey }, "#" .. i + 66,
				       function()
					  window_manager:change_selected_window_by_index(i)
				       end,
				       {description = "swap to window #"..i, group = "window"})
      )
   end
   
      
   
   clientbuttons = gears.table.join(
      awful.button({ }, 1, function (c)
	    c:emit_signal("request::activate", "mouse_click", {raise = true})
      end),
      awful.button({ vars.modkey }, 1, function (c)
	    c:emit_signal("request::activate", "mouse_click", {raise = true})
	    awful.mouse.client.move(c)
      end),
      awful.button({ vars.modkey }, 3, function (c)
	    c:emit_signal("request::activate", "mouse_click", {raise = true})
	    awful.mouse.client.resize(c)
      end)
   )
   
   -- Set keys
   root.keys(globalkeys)
   -- }}}

end

return binding_handler
