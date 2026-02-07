local window = require("windows.window")
local awful = require("awful")

gaming_window = window:new({}, "Gaming", 3, awful.layout.suit.tile)

return gaming_window
