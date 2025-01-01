local ls = require("luasnip")

vim.keymap.set({"i"}, "<Tab>", function() ls.expand_or_jump() end, {silent = true})
vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})

-- Load snippets from ~/.config/nvim/LuaSnip/
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})

-- LuaSnip config
require("luasnip").config.set_config({

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab to trigger visual selection
  store_selection_keys = "<Tab>",

  -- Update multi-insertions as they are typed
  update_events = 'TextChanged,TextChangedI',
})
