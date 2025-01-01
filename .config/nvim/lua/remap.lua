-- Exit from file to explorer
vim.keymap.set('n', "<leader>pv", vim.cmd.Ex)

-- Copy to clipboard
vim.keymap.set({'n', 'v'}, "<C-c>", [["+y]])

-- Paste from clipboard
vim.keymap.set({'n', 'v'}, "<C-v>", [["+p]])
vim.keymap.set({'i'}, "<C-v>", [[<Esc>"+pa]])
  
