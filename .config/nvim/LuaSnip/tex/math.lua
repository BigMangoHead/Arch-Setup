-- Conditions
local helper = require('luasnip-helper')
local in_math = helper.in_math

local function make_small_power(x)
    return s({ trig = "j" .. x, wordTrig = false, snippetType = "autosnippet" , dscr = x .. "-th power"},
        t("^" .. x .. ""),
        {condition = in_math}
    )
end

local function make_small_subscript(x)
    return s({ trig = "k" .. x, wordTrig = false, snippetType = "autosnippet" , dscr = x .. "-th subscript"},
        t("_" .. x .. ""),
        {condition = in_math}
    )
end

-- Snippets
return {
    -- Set brackets
    s({ trig = "set", wordTrig = false, snippetType = "autosnippet" , dscr = "Expands into a set brackets"},
        fmta(
            [[\{<>\}]],
            { i(1) }
        ),
        {condition = in_math}
    ),

    -- Langle, rangle brackets
    s({ trig = "lan", wordTrig = false, snippetType = "autosnippet" , dscr = "Expands into a set brackets"},
        fmta(
            [[\langle <> \rangle]],
            { i(1) }
        ),
        {condition = in_math}
    ),

    -- Fraction
    s({ trig = "fj", wordTrig = false, snippetType = "autosnippet" , dscr = "Expands into a fraction"},
        fmta(
            "\\frac{<>}{<>}",
            { i(1), i(2) }
        ),
        {condition = in_math}
    ),

    -- Square root
    s({ trig = "sq", wordTrig = false, snippetType = "autosnippet" , dscr = "Expands into square root"},
        fmta(
            [[\sqrt{<>}]],
            { i(1) }
        ),
        {condition = in_math}
    ),

    -- Square root with custom power
    s({ trig = "Sq", wordTrig = false, snippetType = "autosnippet" , dscr = "Expands into n-th root"},
        fmta(
            [[\sqrt[<>]{<>}]],
            { i(1), i(2) }
        ),
        {condition = in_math}
    ),

    -- Matrix environments
    s({ trig = "pma", wordTrig = false, snippetType = "autosnippet" , dscr = "Expands into standard matrix"},
        fmta(
            [[
                \begin{pmatrix}
                    <>
                \end{pmatrix}
            ]],
            { i(1) }
        ),
        {condition = in_math}
    ),

    s({ trig = "vma", wordTrig = false, snippetType = "autosnippet" , dscr = "Expands into determinant"},
        fmta(
            [[
                \begin{vmatrix}
                    <>
                \end{vmatrix}
            ]],
            { i(1) }
        ),
        {condition = in_math}
    ),

    -- Inverse
    s({trig = "jn", wordTrig = false, snippetType = "autosnippet", dscr = "Inverse by exponent"},
        {t("^{-1}")},
        {condition = in_math}
    ),

    s({trig = "jfn", wordTrig = false, snippetType = "autosnippet", dscr = "Inverse by fraction"},
        fmta(
            [[\frac{1}{<>}]],
            { i(1) }
        ),
        {condition = in_math}
    ),

    -- Small powers
    make_small_power(2),
    make_small_power(3),
    make_small_power(4),
    make_small_power(5),
    make_small_power(6),
    make_small_power(7),
    make_small_power(8),
    make_small_power(9),

    -- Exponent
    s({trig = "je", wordTrig = false, snippetType = "autosnippet", dscr = "Exponentiation"},
        fmta(
            [[^{<>}]],
            { i(1) }
        ),
        {condition = in_math}
    ),

    -- Subscripts
    s({trig = "kd", wordTrig = false, snippetType = "autosnippet", dscr = "Subscript"},
        fmta(
            [[_{<>}]],
            { i(1) }
        ),
        {condition = in_math}
    ),

    -- Subscript symbol
    s({trig = "kk", wordTrig = false, snippetType = "autosnippet", dscr = "Subscript symbol"},
        {t([[_]])},
        {condition = in_math}
    ),

    -- Zero subscript
    s({trig = "kn", wordTrig = false, snippetType = "autosnippet" , dscr = "0-th subscript"},
        {t([[_0]])},
        {condition = in_math}
    ),

    -- Small subscripts
    make_small_subscript(1),
    make_small_subscript(2),
    make_small_subscript(3),
    make_small_subscript(4),
    make_small_subscript(5),
    make_small_subscript(6),
    make_small_subscript(7),
    make_small_subscript(8),
    make_small_subscript(9),

    -- Overline / bar
    s({trig = "ove", wordTrig = false, snippetType = "autosnippet", dscr = "Put bar on top"},
        fmta(
            [[\overline {<>}]],
            { i(1) }
        ),
        {condition = in_math}
    ),

    -- Bold font
    s({trig = "bf", wordTrig = false, snippetType = "autosnippet", dscr = "Math bold font"},
        {t([[\mathbf ]])},
        {condition = in_math}
    ),

    -- Summations
    s({trig = "sml", wordTrig = false, snippetType = "autosnippet", dscr = "Finite summation"},
        fmta(
            [[\sum_{<>}^{<>}]],
            { i(1), i(2) }
        ),
        {condition = in_math}
    ),

    s({trig = "smi", wordTrig = false, snippetType = "autosnippet", dscr = "Finite summation"},
        fmta(
            [[\sum_{<>}^{\infty}]],
            { i(1) }
        ),
        {condition = in_math}
    ),

}
