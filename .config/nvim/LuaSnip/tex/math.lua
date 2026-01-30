-- Conditions
local helper = require('luasnip-helper')
local in_math = helper.in_math
local get_visual = helper.get_visual

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
    -- Delimiters
    -- Parenthesis (mainly for visual mode insert)
    s({ trig = "par", wordTrig = false, snippetType = "autosnippet" , dscr = "Parenthesis"},
        fmta(
            [[(<>)]],
            { d(1, get_visual) }
        ),
        {condition = in_math}
    ),

    -- Set brackets
    s({ trig = "set", wordTrig = false, snippetType = "autosnippet" , dscr = "Set brackets"},
        fmta(
            [[\{<>\}]],
            { d(1, get_visual) }
        ),
        {condition = in_math}
    ),

    -- Langle, rangle brackets
    s({ trig = "lan", wordTrig = false, snippetType = "autosnippet" , dscr = "Angled brackets"},
        fmta(
            [[\langle <> \rangle]],
            { d(1, get_visual) }
        ),
        {condition = in_math}
    ),

    -- Floor
    s({ trig = "FL", wordTrig = false, snippetType = "autosnippet" , dscr = "Floor"},
        fmta(
            [[\lfloor <> \rfloor]],
            { d(1, get_visual) }
        ),
        {condition = in_math}
    ),

    -- Ceiling
    s({ trig = "CE", wordTrig = false, snippetType = "autosnippet" , dscr = "Ceiling"},
        fmta(
            [[\lceil <> \rceil]],
            { d(1, get_visual) }
        ),
        {condition = in_math}
    ),

    -- Absolute value
    s({ trig = "abs", wordTrig = false, snippetType = "autosnippet" , dscr = "Absolute value"},
        fmta(
            [[\lvert <> \rvert]],
            { d(1, get_visual) }
        ),
        {condition = in_math}
    ),



    -- Fraction
    s({ trig = "fl", wordTrig = false, snippetType = "autosnippet" , dscr = "Fraction"},
        fmta(
            "\\frac{<>}{<>}",
            { i(1), i(2) }
        ),
        {condition = in_math}
    ),

    -- Square root
    s({ trig = "sq", wordTrig = false, snippetType = "autosnippet" , dscr = "Square root"},
        fmta(
            [[\sqrt{<>}]],
            { i(1) }
        ),
        {condition = in_math}
    ),

    -- Square root with custom power
    s({ trig = "Sq", wordTrig = false, snippetType = "autosnippet" , dscr = "n-th root"},
        fmta(
            [[\sqrt[<>]{<>}]],
            { i(1), i(2) }
        ),
        {condition = in_math}
    ),

    -- Matrix environments
    s({ trig = "pma", wordTrig = false, snippetType = "autosnippet" , dscr = "Standard matrix"},
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

    s({ trig = "vma", wordTrig = false, snippetType = "autosnippet" , dscr = "Determinant"},
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

    -- Cases for function definition
    s({ trig = "cas", wordTrig = false, snippetType = "autosnippet" , dscr = "Determinant"},
        fmta(
            [[
                \begin{cases}
                    <>
                \end{cases}
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
    make_small_power(1),
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
            { c(1, {i(nil), t("\\infty")}) }
        ),
        {condition = in_math}
    ),

    -- Star superscript
    s({trig = "jst", wordTrig = false, snippetType = "autosnippet", dscr = "Star superscript"},
        fmta(
            [[^{\star}]],
            { }
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
    s({trig = "kk", wordTrig = false, snippetType = "autosnippet" , dscr = "Subscript symbol"},
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

    -- Hats for sets
    s({trig = "wha", wordTrig = false, snippetType = "autosnippet", dscr = "Wide hat"},
        fmta(
            [[\widehat{<>}]],
            { i(1) }
        ),
        {condition = in_math}
    ),
    s({trig = "lha", wordTrig = false, snippetType = "autosnippet", dscr = "Little hat"},
        fmta(
            [[\hat{<>}]],
            { i(1) }
        ),
        {condition = in_math}
    ),

    -- Tilde
    s({trig = "til", wordTrig = false, snippetType = "autosnippet", dscr = "Wide tilde"},
        fmta(
            [[\widetilde ]],
            {  }
        ),
        {condition = in_math}
    ),
    

    -- Bold font
    s({trig = "bf", wordTrig = false, snippetType = "autosnippet", dscr = "Math bold font"},
        {t([[\mathbf ]])},
        {condition = in_math}
    ),

    -- Union
    s({trig = "SCUP", wordTrig = false, snippetType = "autosnippet", dscr = "Big disjoint union"},
        fmta(
            [[\bigsqcup_{<>}^{<>}]],
            { i(1), i(2, "\\infty") }
        ),
        {condition = in_math}
    ),
    s({trig = "CUP", wordTrig = false, snippetType = "autosnippet", dscr = "Big union"},
        fmta(
            [[\bigcup_{<>}^{<>}]],
            { i(1), i(2, "\\infty") }
        ),
        {condition = in_math}
    ),

    -- Intersection (relies on CA -> \\mathcal A)
    s({trig = "S\\mathcal AP", wordTrig = false, snippetType = "autosnippet", dscr = "Big disjoint intersection"},
        fmta(
            [[\bigsqcap_{<>}^{<>}]],
            { i(1), i(2, "\\infty") }
        ),
        {condition = in_math}
    ),
    s({trig = "\\mathcal AP", wordTrig = false, snippetType = "autosnippet", dscr = "Big intersection"},
        fmta(
            [[\bigcap_{<>}^{<>}]],
            { i(1), i(2, "\\infty") }
        ),
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

    -- Limit
    s({trig = "lii", wordTrig = false, snippetType = "autosnippet", dscr = "Infinite limit"},
        fmta(
            [[\lim_{<> \to \infty}]],
            { i(1) }
        ),
        {condition = in_math}
    ),

    -- Derivatives
    s({trig = "dff", wordTrig = false, snippetType = "autosnippet", dscr = "Ordinary derivative"},
        fmta(
            [[\frac{d<>}{d<>}]],
            { i(1), i(2) }
        ),
        {condition = in_math}
    ),

    s({trig = "dfp", wordTrig = false, snippetType = "autosnippet", dscr = "Partial derivative"},
        fmta(
            [[\frac{\partial <>}{\partial <>}]],
            { i(1), i(2) }
        ),
        {condition = in_math}
    ),

    -- Combinations
    s({trig = "cho", wordTrig = false, snippetType = "autosnippet", dscr = "Combination"},
        fmta(
            [[\binom{<>}{<>}]],
            { i(1), i(2) }
        ),
        {condition = in_math}
    ),

    -- Modulus
    s({trig = "PM", wordTrig = false, snippetType = "autosnippet", dscr = "Modulus"},
        fmta(
            [[\pmod {<>}]],
            { i(1) }
        ),
        {condition = in_math}
    ),
}
