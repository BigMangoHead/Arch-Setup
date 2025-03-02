
local COMPILE_DELAY = 5000 -- Time in milliseconds between compiling + running

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
local cur_file = vim.fn.expand('%:p')
local base_dir = vim.fn.fnamemodify(cur_file, ':h')
local base_file = vim.fn.fnamemodify(cur_file, ':r')
local input, output = base_file .. '.in', base_file .. '.out'

if vim.fn.filereadable(output) then
    vim.cmd(data_buf_size .. 'vsplit ' .. input)
    vim.cmd.wincmd('r')
    vim.cmd('split ' .. output)
end

-- Timer for compiling and running code periodically
local compile_timer = vim.uv.new_timer()
compile_timer:start(0, 5000, vim.schedule_wrap(function ()
    print(base_dir)
    vim.system({'autocompcode', cur_file}) --, {cwd = base_dir})
end))

-- Add keybind to switch to a different problem
vim.keymap.set('n', '<localleader>s', function()
    vim.b.processedcompcode = false
    compile_timer:stop()
    pcall(function () 
        vim.cmd('bd ' .. code_buf)
        vim.cmd('close')
    end)
    telescope.find_files()
end)
