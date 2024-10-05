-- Manager for windows
-- Note: Currently doesn't work for multiple monitors

local awful = require("awful")
local gears = require("gears")

-- Import all windows
local communications_window = require("windows.instances.communications")
local programming_window = require("windows.instances.programming")
local comp_programming_window = require("windows.instances.competitive-programming")
local gaming_window = require("windows.instances.gaming")
local classes_window = require("windows.instances.classes")

local window_manager = {selected_window = programming_window}

-- Check if current selected window is the opened window
function window_manager:is_window_selected(window)
   return self.selected_window == window
end

-- Updates the selected window and runs certain functions on it
function window_manager:change_selected_window(window)
   self.selected_window = window
   -- Update textbox in menu
   window.screen.mywindowlist:set_markup_silently(window.window_name)

   -- Change selected tag to tag in the new selected window.
   -- This also updates the taglist
   window.last_selected_tag:view_only()
end

function window_manager:change_selected_window_by_index(index)
   local window = window_manager:get_windows()[index]
   if window then
      self:change_selected_window(window)
   end
end

-- Returns all windows
function window_manager:get_windows()
   return {communications_window, programming_window, classes_window, gaming_window, comp_programming_window}
end

-- Creates initial tags for each window
function window_manager:create_tags()
   for _, window in pairs(self:get_windows()) do
      window:create_tags()
   end
end

-- Runs
function window_manager:post_init()
   for _, window in pairs(self:get_windows()) do
      window:post_init()
   end
end

-- Defines filter for what tags to show in taglist
-- NOTE: Uses the global window manager
function window_manager.taglist_filter(tag)
   return window_manager.selected_window:taglist_filter(tag)
end

-- Generate menu for when right clicking the window in the wibar
window_manager.menuitems = {}
for _, window in pairs(window_manager:get_windows()) do
   table.insert(window_manager.menuitems, {window.window_name, function() window_manager:change_selected_window(window) end})
end
window_manager.menu = awful.menu({items = window_manager.menuitems, theme = {width = 250}})

return window_manager






   
