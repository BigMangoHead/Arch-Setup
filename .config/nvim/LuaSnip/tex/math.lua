-- Conditions
local helper = require('luasnip-helper')
local in_math = helper.in_math

-- Snippets
return {
    -- Fraction
    s({ trig = "fj", snippetType = "autosnippet" , dscr = "Expands into a fraction"},
        fmta(
            "\\frac{<>}{<>}",
            { i(1), i(2) }
        ),
        {condition = in_math}
    ),

    -- Square root
    s({ trig = "sq", snippetType = "autosnippet" , dscr = "Expands into square root"},
        fmta(
            [[\sqrt{<>}]],
            { i(1) }
        ),
        {condition = in_math}
    ),
    -- Square root with custom power
    s({ trig = "ssq", snippetType = "autosnippet" , dscr = "Expands into n-th root"},
        fmta(
            [[\sqrt[<>]{<>}]],
            { i(1), i(2) }
        ),
        {condition = in_math}
    ),
}