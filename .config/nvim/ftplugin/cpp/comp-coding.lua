
local COMPILE_DELAY = 5000 -- Time in milliseconds between compiling + running
local RUN_TIMEOUT = 1.5 -- Time in seconds before closing program

-- Leave if not in competitive coding mode
if not vim.g.compcodingmode then return end

-- Check if buffer has already been processed
if vim.b.processedcompcode then return end
vim.b.processedcompcode = true

-- Load code templates location
local TEMPLATE_LOC = vim.g.compcodetemplatedir or "/home/bigma/coding/comp/templates/"

-- Leave if in template location
local cur_file = vim.fn.expand('%:p')
if cur_file:find("^" .. TEMPLATE_LOC) then return end

-- Load size for input/output buffer
local data_buf_size = vim.g.compcodehorizsize or 60

-- Grab telescope library functions
local telescope = require('telescope.builtin')


-- Ignore input and output files with telescope
require('telescope').setup{ 
  defaults = { 
    file_ignore_patterns = { 
      "%.in", "%.out", "%.want"
    }
  }
}

-- Enable autosaving
vim.g.autosave_default = true


-- Store code buffer
local code_buf = vim.api.nvim_get_current_buf()
local out_buf = ''

-- Open input and output buffers
local base_dir = vim.fn.fnamemodify(cur_file, ':h')
local base_file = vim.fn.fnamemodify(cur_file, ':r')
local input, output, want = base_file .. '.in', base_file .. '.out', base_file .. '.want'

if vim.fn.filereadable(output) then
    vim.cmd(data_buf_size .. 'vsplit ' .. input)
    vim.cmd.wincmd('r')
    vim.cmd('split ' .. output)
    out_buf = vim.api.nvim_get_current_buf()
    vim.cmd('split ' .. want)
end

-- Compile function
local compile_function = function ()
    local on_exit = function()
        vim.schedule(function() vim.cmd('checktime ' .. out_buf) end)
    end
    vim.system({'autocompcode', cur_file, RUN_TIMEOUT}, {cwd = base_dir}, on_exit)
    -- vim.system({'.runtime/exec'}, {cwd = base_dir, timeout = RUN_TIMEOUT}, on_exit)
end

-- Timer for compiling and running code periodically
local compile_timer = vim.uv.new_timer()
compile_timer:start(0, COMPILE_DELAY, vim.schedule_wrap(compile_function))

-- Autocmd for compiling and running code on save
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = {"*.cpp", "*.want", "*.in"},
    callback = compile_function
})

-- Add keybind to switch to a different problem
vim.keymap.set('n', '<localleader>s', function()
    vim.b.processedcompcode = false
    compile_timer:stop()
    pcall(function () 
        vim.cmd('bd ' .. code_buf)
        vim.cmd('close')
        vim.cmd('close')
    end)
    telescope.find_files()
end)

-- Add keybind to view templates
vim.keymap.set('n', 'T', function()
    vim.g.compcodingbuffer = code_buf
    telescope.find_files({
        cwd = TEMPLATE_LOC
    })
end)
