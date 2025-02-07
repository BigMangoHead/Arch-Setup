
local awful = require("awful")
local wibox = require("wibox")

local keybind_scripts = {}

function keybind_scripts.math_screenshot()
    awful.prompt.run {
        prompt  = "Filename: ",
        textbox = mouse.screen.mypromptbox.widget,
        exe_callback = function (input) awful.spawn(string.format("%s/.config/awesome/scripts/math-screenshot.sh \"" .. input .. "\"", os.getenv("HOME")) ) end
    }
end


return keybind_scripts
