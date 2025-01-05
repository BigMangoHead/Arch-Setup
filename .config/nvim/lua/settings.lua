-- Set <leader> to Space
vim.g.mapleader = " "

-- Line numbers and relative line numbers enabled
-- This is disabled for some specific buffers, like the one used by VimTex
vim.opt.nu = true
vim.opt.rnu = true

-- Four space idents
-- NOTE: This is changed for some filetypes in the corresponding ftplugin files
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Not exactly sure what this does
vim.opt.smartindent = true

-- Disables keeping search highlighted, enables incremental searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Make searching case insensitive
vim.opt.ic = true

-- Terminal colors
vim.opt.termguicolors = true

-- Always keep 8 more lines above and below the buffer when scrolling
-- unless at the end or start of the file
vim.opt.scrolloff = 8

-- Not sure what these really do. First may need to be changed
-- for some sort of line functionality, might do that based on filetype
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")

-- Faster vim updates
vim.opt.updatetime = 50
