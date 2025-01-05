

-- Load packages
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Snippet package
Plug('L3MON4D3/LuaSnip')

-- LaTeX helper package
Plug('lervag/vimtex', { ['for'] = 'tex' })

-- Fuzzy finder
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['branch'] = '0.1.x' })

-- Theme
Plug('rebelot/kanagawa.nvim')

-- Highlighting with treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- Git integration
Plug('tpope/vim-fugitive')

-- File tree
Plug('nvim-lua/plenary.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('MunifTanjim/nui.nvim')
Plug('nvim-neo-tree/neo-tree.nvim', { ['branch'] = 'v3.x'})

vim.call('plug#end')

-- Fix filetype issue
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.tex",
  callback = function()
    vim.bo.filetype = "tex"
  end,
})

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
vim.keymap.set({'n', 's', 'v', 'o'}, "<localleader>c", "<Cmd>write<CR><Cmd>VimtexCompile<CR>")

-- Autocompile command
vim.keymap.set({'n', 's', 'v', 'o'}, "<localleader>C", "<Cmd>ToggleAutosave<CR><Cmd>VimtexCompile<CR>")

-- Change environment keybind (default)
vim.keymap.set({'n'}, "cs$", "<Plug>(vimtex-env-change-math)")

-- Change to align* environment
vim.keymap.set({'n'}, "csa", "<Plug>(vimtex-env-change-math)align*<CR>")

-- Call other configs
require("settings")
require("remap")

