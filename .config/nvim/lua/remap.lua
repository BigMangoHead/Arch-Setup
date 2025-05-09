local telescope = require('telescope.builtin')

-- Exit from file to explorer
vim.keymap.set('n', "<leader>pv", vim.cmd.Ex)

-- Copy to clipboard
vim.keymap.set({'n', 'v'}, "<C-c>", [["+y]])

-- Copy entire file
vim.keymap.set({'n', 'v'}, "<C-y>", "<Cmd>%y<CR>")

-- Copy entire file to clipboard
vim.keymap.set({'n', 'v'}, "<C-S-y>", "<Cmd>%y+<CR>")

-- Paste from clipboard
vim.keymap.set({'n', 'v'}, "<C-v>", [["+p]])
vim.keymap.set({'i'}, "<C-v>", [[<Esc>"+pa]])

-- Switch to moving by editor line rather than actual line
vim.keymap.set({'n', 'v'}, "j", [[gj]])
vim.keymap.set({'n', 'v'}, "k", [[gk]])

-- Reload LuaSnips
vim.keymap.set('n', '<Leader>rl', '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>')

-- Edit LuaSnippets
local openls = function ()
    vim.g.returnbuffer = vim.api.nvim_get_current_buf()
    telescope.find_files({
        cwd = '~/.config/nvim/LuaSnip/'
    })
end
local closels = function ()
    local tmp_buf = vim.api.nvim_get_current_buf()
    vim.cmd("bu " .. vim.g.returnbuffer)
    vim.cmd("bd " .. tmp_buf)
    require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})
end
    
vim.keymap.set('n', '<Leader>cls', openls)
vim.keymap.set('n', '<Leader>bb', closels)

-- Switch theme
vim.keymap.set('n', '<Leader>tl', '<Cmd>let g:CURTHEME="kanagawa-lotus"<CR><Cmd>colorscheme kanagawa-lotus<CR>')
vim.keymap.set('n', '<Leader>td', '<Cmd>let g:CURTHEME="kanagawa-wave"<CR><Cmd>colorscheme kanagawa-wave<CR>')
