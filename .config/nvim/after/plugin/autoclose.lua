require("autoclose").setup({
    keys = {
        ["\""] = { escape = true, close = true, pair = "\"\"", disabled_filetypes = {"tex"}},
        ["\'"] = { escape = true, close = true, pair = "\'\'", disabled_filetypes = {"tex"}},
        ["`"] = { escape = true, close = true, pair = "``", disabled_filetypes = {"tex"}},
    }
})
