return {
    -- Greek letters
    s({ trig = ";a", wordTrig = false, snippetType = "autosnippet", dscr = "Greek letter alpha" },
        {
            t("\\alpha"),
        }
    ),
    s({ trig = ";b", wordTrig=false, snippetType = "autosnippet", dscr = "Greek letter beta" },
        {
            t("\\beta"),
        }
    ),
    s({ trig = ";g", wordTrig = false, snippetType = "autosnippet", dscr = "Greek letter gamma" },
        {
            t("\\gamma"),
        }
    ),

    -- Equation
    s({ trig = "eq", dscr = "Expands into equation environment" },
        fmta(
            [[
                \begin{equation}
                    <>
                \end{equation}
                <>
            ]],
            { i(1), i(0) }
        )
    ),

    -- Begin environment
    s({ trig = "be", dscr = "Expands into beginning any environment" },
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
            { i(1), i(2), rep(1) }
        )
    ),

    -- Inline math environment
    s({ trig = "mm", snippetType = "autosnippet" , dscr = "Expands into inline math mode"},
        fmta(
            [[
                $<>$<>
            ]],
            { i(1), i(0)}
        )
    ),
}
