pcall(require, "luarocks.loader")

-- Libraries used by awesome by default
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
require("awful.hotkeys_popup.keys")

-- {{{ Default awesome error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}


-- Some custom libraries that do not immediately run anything
local config = require("config")
local menu_handler = require("ui.menu")
local wallpaper_handler = require("ui.wallpaper")
local wibar_handler = require("ui.wibar")
local binding_handler = require("ui.keybinds")
local screen_handler = require("screen")


-- Get custom variables from the config file
vars = config.runconfig()

-- Configure beautiful
beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME")))

-- Create menu
main_menu = menu_handler.getmainmenu()

-- Grab window manager
local window_manager = require("windows.window-manager")

-- Create screen
screen_handler.init(window_manager, main_menu, wallpaper_handler, wibar_handler)

-- Create keybinds
binding_handler.bind_keys(window_manager, main_menu.mymainmenu)

-- Establish rules
require("rules")

-- Establish client signals
require("client")

-- Post init for all windows
window_manager:post_init()

-- Automatically start certain programs in the background
awful.spawn.with_shell(string.format("%s/.config/awesome/scripts/autorun.sh", os.getenv("HOME")))
