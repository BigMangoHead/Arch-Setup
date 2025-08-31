local M = {}

local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node
local t = ls.text_node

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

function M.get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, t(parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return M
