-- Conditions
local helper = require('luasnip-helper')
local line_begin = helper.line_begin
local in_math = helper.in_math
local in_text = helper.in_text

-- Snippets
return {
    -- Equation
    s({ trig = "eq", snippetType = "autosnippet", dscr = "Expands into equation environment" },
        fmta(
            [[
                \begin{equation*}
                    <>
                \end{equation*}
                <>
            ]],
            { i(1), i(0) }
        ),
        {condition = line_begin}
    ),

    -- Align
    s({ trig = "al", snippetType = "autosnippet", dscr = "Expands into align environment" },
        fmta(
            [[
                \begin{align*}
                    <>
                \end{align*}
                <>
            ]],
            { i(1), i(0) }
        ),
        {condition = line_begin}
    ),

    -- Begin environment
    s({ trig = "be", dscr = "Expands into beginning any environment" },
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
                <>
            ]],
            { i(1), i(2), rep(1), i(0) }
        )
    ),

    -- Inline math environment
    s({ trig = "dj", snippetType = "autosnippet" , dscr = "Expands into inline math mode"},
        fmta(
            [[$<>$]],
            { i(1)}
        ),
        {condition = in_text}
    ),

    -- New section
    s({ trig = "se", snippetType = "autosnippet" , dscr = "Expands into inline math mode"},
        fmta(
            [[
                \section*{<>}
                <>
            ]],
            { i(1), i(0) }
        ),
        {condition = line_begin}
    ),
}
