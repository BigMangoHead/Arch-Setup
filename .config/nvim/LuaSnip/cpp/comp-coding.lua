-- Leave if not in competitive coding mode
if not vim.g.compcodingmode then return {} end

-- Conditions
local helper = require('luasnip-helper')
local line_begin = helper.line_begin

-- Snippets
return {
    -- For loops
    s({ trig = "fr", snippetType = "autosnippet", dscr = "Integer for loop" },
        fmta(
            [[
                for (int <>; <>; <>) {
                    <>
                }
            ]],
            { i(1), i(2), i(3), i(4) }
        ),
        {condition = line_begin}
    ),

    s({ trig = "foi", snippetType = "autosnippet", dscr = "For all i loop" },
        fmta(
            [[
                for (int i=0; i << <>; i++) {
                    <>
                }
            ]],
            { i(1), i(2) }
        ),
        {condition = line_begin}
    ),

    s({ trig = "fon", snippetType = "autosnippet", dscr = "For all in loop" },
        fmta(
            [[
                for (auto& <> : <>) {
                    <>
                }
            ]],
            { i(1), i(2), i(3) }
        ),
        {condition = line_begin}
    ),

    -- Binary search
    s({trig = "bss", snippetType = "autosnippet", dscr = "Binary search tempalte" },
        fmta(
            [[
                auto bs_check = [&](const int& x) {
                    <>
                };

                int low = <>;
                int high = <>;
                while (low << high) {
                    int mid = (low + high) / 2;
                    if (bs_check(mid)) {
                        <>
                    } else {
                        <>
                    }
                }
            ]],
            { i(3), i(1), i(2), i(4), i(5) }
        ),
        {condition = line_begin}
    ),
}
