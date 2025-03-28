-- Leave if not in competitive coding mode
if not vim.g.compcodingmode then return {} end

-- Conditions
local helper = require('luasnip-helper')
local line_begin = helper.line_begin

-- Snippets
return {
    -- Braces
    s({ trig = "{s", snippetType = "autosnippet", dscr = "Curly bracket"},
        fmta(
            [[
                {
                    <>
                }
            ]],
            { i(1) }
        )
    ),

    -- Vectors
    s({ trig = "vv", snippetType = "autosnippet", dscr = "General vector" },
        fmta(
            [[
                vector<<<>>>
            ]],
            { i(1) }
        ),
        {condition = line_begin}
    ),

    s({ trig = "vi", dscr = "Integer vector"},
        t("vector<int>")
    ),

    s({ trig = "vii", dscr = "Integer matrix"},
        t("vector<vector<int>>")
    ),

    -- Read vectors
    s({ trig = "readvi", descr = "Read integer vector", priority = 2000},
        fmta(
            [[
                vector<<int>> <>(<>);
                for (int i=0; i << <>; i++) {
                    int x;
                    cin >>>> x;
                    <>[i] = x;
                }

            ]],
            { i(1), i(2), rep(2), rep(1) }
        ),
        {condition = line_begin}
    ),

    s({ trig = "readvii", descr = "Read integer matrix", priority = 2000},
        fmta(
            [[
                vector<<vector<<int>>>> <>(<>, vector<<int>>(<>));
                for (int i=0; i << <>; i++) {
                    for (int j=0; j << <>; j++) {
                        int x;
                        cin >>>> x;
                        <>[i][j] = x;
                    }
                }

            ]],
            { i(1), i(2), i(3), rep(2), rep(3), rep(1) }
        ),
        {condition = line_begin}
    ),
    

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
    s({trig = "bss", snippetType = "autosnippet", dscr = "Binary search template" },
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
