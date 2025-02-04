-- Exit from file to explorer
vim.keymap.set('n', "<leader>pv", vim.cmd.Ex)

-- Copy to clipboard
vim.keymap.set({'n', 'v'}, "<C-c>", [["+y]])

-- Paste from clipboard
vim.keymap.set({'n', 'v'}, "<C-v>", [["+p]])
vim.keymap.set({'i'}, "<C-v>", [[<Esc>"+pa]])

-- Switch to moving by editor line rather than actual line
vim.keymap.set({'n', 'v'}, "j", [[gj]])
vim.keymap.set({'n', 'v'}, "k", [[gk]])

-- Reload LuaSnips
vim.keymap.set('n', '<Leader>rl', '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>')
