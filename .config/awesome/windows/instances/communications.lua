local window = require("windows.window")
local awful = require("awful")

communications_window = window:new({}, "Communications", 2, awful.layout.suit.floating)

function communications_window:post_init()
   --awful.spawn.easy_async_with_shell("alacritty &", function()
--					local clients = client.get()
--					print(clients)
--					print(#clients)
--					clients[#clients]:move_to_tag(self.taglist[2])
--   end)
   
end

return communications_window
