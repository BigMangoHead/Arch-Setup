local window = require("windows.window")
local awful = require("awful")

programming_window = window:new({}, "Programming", 3, awful.layout.suit.tile)

return programming_window
