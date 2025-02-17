-- Leave if not in competitive coding mode
if not vim.g.compcodingmode then return end

-- Check if buffer has already been processed
if vim.b.processedcompcode then return end
vim.b.processedcompcode = true

-- Grab telescope library functions
local telescope = require('telescope.builtin')

-- Load size for input/output buffer
local data_buf_size = vim.g.compcodehorizsize or 60


-- Ignore input and output files with telescope
require('telescope').setup{ 
  defaults = { 
    file_ignore_patterns = { 
      ".in", ".out"
    }
  }
}

-- Enable autosaving
vim.g.autosave_default = true


-- Store code buffer
local code_buf = vim.api.nvim_get_current_buf()

-- Open input and output buffers
local cur_file = vim.fn.expand('%')
local base_file = vim.fn.fnamemodify(cur_file, ':p:r')
local input, output = base_file .. '.in', base_file .. '.out'

if vim.fn.filereadable(output) then
    vim.cmd(data_buf_size .. 'vsplit ' .. input)
    vim.cmd.wincmd('r')
    vim.cmd('split ' .. output)
end

-- Add keybind to switch to a different problem
vim.keymap.set('n', '<localleader>s', function()
    vim.b.processedcompcode = false
    pcall(function () 
        vim.cmd('bd ' .. code_buf)
        vim.cmd('close')
    end)
    telescope.find_files()
end)
