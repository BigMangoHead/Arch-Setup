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

    -- Integer pair
    s({ trig = "pi", dscr = "Pair of integers"},
        t("pair<int, int>")
    ),

    s({ trig = "vl", dscr = "Long long vector"},
        t("vector<ll>")
    ),

    s({ trig = "vll", dscr = "Long long matrix"},
        t("vector<vector<ll>>")
    ),

    -- Read long long vectors
    s({ trig = "readvl", descr = "Read long long vector", priority = 2000},
        fmta(
            [[
                vector<<ll>> <>(<>);
                for (int i=0; i << <>; i++) {
                    ll x;
                    cin >>>> x;
                    <>[i] = x;
                }

            ]],
            { i(1), i(2), rep(2), rep(1) }
        ),
        {condition = line_begin}
    ),

    s({ trig = "readvll", descr = "Read long long matrix", priority = 2000},
        fmta(
            [[
                vector<<vector<<ll>>>> <>(<>, vector<<ll>>(<>));
                for (int i=0; i << <>; i++) {
                    for (int j=0; j << <>; j++) {
                        ll x;
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

    s({ trig = "foj", snippetType = "autosnippet", dscr = "For all j loop" },
        fmta(
            [[
                for (int j=0; j << <>; j++) {
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
