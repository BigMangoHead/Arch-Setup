local window = require("windows.window")
local awful = require("awful")

comp_programming_window = window:new({}, "Comp Programming", 3, awful.layout.suit.tile)

return comp_programming_window
