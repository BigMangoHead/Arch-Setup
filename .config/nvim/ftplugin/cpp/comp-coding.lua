
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
      ".in", ".out", ".want"
    }
  }
}

-- Enable autosaving
vim.g.autosave_default = true


-- Store code buffer
local code_buf = vim.api.nvim_get_current_buf()
local out_buf = ''

-- Open input and output buffers
local cur_file = vim.fn.expand('%:p')
local base_dir = vim.fn.fnamemodify(cur_file, ':h')
local base_file = vim.fn.fnamemodify(cur_file, ':r')
local input, output, want = base_file .. '.in', base_file .. '.out', base_file .. '.want'

if vim.fn.filereadable(output) then
    vim.cmd(data_buf_size .. 'vsplit ' .. input)
    vim.cmd.wincmd('r')
    vim.cmd('split ' .. output)
    out_buf = vim.api.nvim_get_current_buf()
end

-- Compile function
local compile_function = function ()
    local on_exit = function()
        vim.schedule(function() vim.cmd('checktime ' .. out_buf) end)
    end
    vim.system({'autocompcode', cur_file}, {cwd = base_dir}, on_exit)
end

-- Timer for compiling and running code periodically
local compile_timer = vim.uv.new_timer()
compile_timer:start(0, COMPILE_DELAY, vim.schedule_wrap(compile_function))

-- Autocmd for compiling and running code on save
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.cpp",
    callback = compile_function
})

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
