

vim.lsp.config['clangd'] = {
    cmd = { 'clangd' },

    filetypes = { 'cpp' }
}

vim.lsp.enable('clangd')
