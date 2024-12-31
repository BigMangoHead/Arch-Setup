local M = {}

local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

-- Only at start of line
M.line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Only in math mode
function M.in_math()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

-- Only in text mode
function M.in_text()
    return not M.in_math()
end

return M
