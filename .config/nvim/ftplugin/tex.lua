vim.g.custom_autosave_default = true;

vim.g.vimtex_compiler_latexmk = { 
    aux_dir = ".aux", 
    out_dir = "out",

    options = {"-synctex=1", "-interaction=nonstopmode", "-file-line-error", "-verbose", -- Default options
    "-shell-escape" -- Used for externalizing pgfplots calls to prevent memory issues
}
}

-- Keybinds
-- Compile command
vim.keymap.set({'n', 's', 'v', 'o'}, "<localleader>c", "<Cmd>write<CR><Cmd>VimtexCompile<CR>")
vim.keymap.set({'n', 's', 'v', 'o'}, "<localleader>j", "<Cmd>write<CR>")

-- Autocompile command
vim.keymap.set({'n', 's', 'v', 'o'}, "<localleader>C", "<Cmd>ToggleAutosave<CR><Cmd>VimtexCompile<CR>")

-- Change environment keybind (default)
vim.keymap.set({'n'}, "cs$", "<Plug>(vimtex-env-change-math)")

-- Change to align* environment
vim.keymap.set({'n'}, "csa", "<Plug>(vimtex-env-change-math)align*<CR>")

-- Remap H, J, K, L
vim.keymap.set({'n'}, "H", "<Cmd>call vimtex#motion#math(1,1,0)<CR>")
vim.keymap.set({'n'}, "J", "<Cmd>call vimtex#motion#math(0,1,0)<CR>")
vim.keymap.set({'n'}, "K", "<Cmd>call vimtex#motion#math(1,0,0)<CR>")
vim.keymap.set({'n'}, "L", "<Cmd>call vimtex#motion#math(0,0,0)<CR>")
