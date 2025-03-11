-- Leave if not in competitive coding mode
if not vim.g.compcodingmode then return end

-- Load code templates location
local TEMPLATE_LOC = vim.g.compcodetemplatedir or "/home/bigma/coding/comp/templates"

-- Leave if not in template location
local cur_file = vim.fn.expand('%:p')
if not cur_file:find("^" .. TEMPLATE_LOC) then return end

vim.keymap.set('n', '<localleader>b', function()
    local temp_buf = vim.api.nvim_get_current_buf()
    vim.cmd("buffer " .. vim.g.compcodingbuffer)
    vim.cmd("bd " .. temp_buf)
end)
