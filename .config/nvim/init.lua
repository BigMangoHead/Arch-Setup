

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
--Plug('nvim-neo-tree/neo-tree.nvim', { ['branch'] = 'v3.x'})

-- Maximize a buffer
Plug('markstory/vim-zoomwin')

-- LSP Packages
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/nvim-cmp')


vim.call('plug#end')

-- Fix filetype issue
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.tex",
  callback = function()
    vim.bo.filetype = "tex"
  end,
})

-- Add filetypes
vim.filetype.add({extension = {out = 'codeout'}, pattern = { ['*.in'] = 'codein' }})

-- Reload buffers when refocusing vim or entering new buffer
vim.api.nvim_create_autocmd("FocusGained", {
  desc = "Reload files from disk when we focus vim",
  pattern = "*",
  command = "if getcmdwintype() == '' | checktime | endif",
  group = aug,
})
vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Every time we enter an unmodified buffer, check if it changed on disk",
  pattern = "*",
  command = "if &buftype == '' && !&modified && expand('%') != '' | exec 'checktime ' . expand('<abuf>') | endif",
  group = aug,
})

-- Call other configs
require("settings")
require("remap")
require("lsp")
