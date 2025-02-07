local window = require("windows.window")
local awful = require("awful")

classes_window = window:new({}, "Math and Classes", 3, awful.layout.suit.tile.left)

return classes_window
