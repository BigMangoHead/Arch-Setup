vim.g.custom_autosave_default = true;

vim.g.vimtex_compiler_latexmk = { aux_dir = ".aux", out_dir = "out" }

-- Keybinds
-- Compile command
vim.keymap.set({'n', 's', 'v', 'o'}, "<localleader>c", "<Cmd>write<CR><Cmd>VimtexCompile<CR>")

-- Autocompile command
vim.keymap.set({'n', 's', 'v', 'o'}, "<localleader>C", "<Cmd>ToggleAutosave<CR><Cmd>VimtexCompile<CR>")

-- Change environment keybind (default)
vim.keymap.set({'n'}, "cs$", "<Plug>(vimtex-env-change-math)")

-- Change to align* environment
vim.keymap.set({'n'}, "csa", "<Plug>(vimtex-env-change-math)align*<CR>")

