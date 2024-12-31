

-- Load packages
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Snippet package
Plug('L3MON4D3/LuaSnip')

-- LaTeX helper package
Plug('lervag/vimtex')

vim.call('plug#end')


-- Configure snippet keybinds
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


-- Fix filetype issue
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.tex",
  callback = function()
    vim.bo.filetype = "tex"
  end,
})

-- Set <leader> to Space
vim.g.mapleader = " "

-- Set <localleader> to Space
vim.g.maplocalleader = " "


-- Set pdf viewer
vim.g.vimtex_view_method = "mupdf"

-- Configure text wrapping
vim.opt.textwidth = 0
vim.opt.wrapmargin = 1
vim.opt.formatoptions:append("t")
vim.opt.formatoptions:remove("l")


-- Keybinds
-- Compile command
vim.keymap.set({'n', 's', 'v', 'o'}, "<Leader>c", "<Cmd>write<CR><Cmd>VimtexCompile<CR>")

-- Autocompile command
vim.keymap.set({'n', 's', 'v', 'o'}, "<Leader>C", "<Cmd>ToggleAutosave<CR><Cmd>VimtexCompile<CR>")

-- Change environment keybind (default)
vim.keymap.set({'n'}, "cs$", "<Plug>(vimtex-env-change-math)")

-- Change to align* environment
vim.keymap.set({'n'}, "csa", "<Plug>(vimtex-env-change-math)align*<CR>")

