-- Conditions
local helper = require('luasnip-helper')
local line_begin = helper.line_begin
local in_math = helper.in_math
local in_text = helper.in_text
local get_visual = helper.get_visual
local line_begin_and_in_text = function (a, b, c) return line_begin(a, b, c) and in_text(a, b, c) end

local function environment(trig, env, dscr)
    return s({ trig = trig, dscr = dscr },
        fmta(
            [[
                \begin{]] .. env .. [[}
                    <>
                \end{]] .. env .. [[}
                <>
            ]],
            { i(1), i(0) }
        ),
        {condition = line_begin_and_in_text}
    )
end

-- Snippets
return {
    -- Jump forward
    -- s({ trig = "; ", snippetType = "autosnippet", dscr = "Jump forward in math mode" },

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
                \section{<>}
            ]],
            { i(1) }
        ),
        {condition = line_begin_and_in_text}
    ),

    -- Spam of different environments I use
    -- Equation
    environment("eq", "equation*", "Expands into equation environment"),
    environment("equ", "equation*", "Expands into equation environment"),

    -- Align
    environment("al", "align*", "Expands into align environment"),
    environment("ali", "align*", "Expands into align environment"),

    -- Proof environment
    environment("pr", "proof", "Expands into proof environment"),
    environment("pf", "proof", "Expands into proof environment"),
    environment("pro", "proof", "Expands into proof environment"),

    -- Theorem environment
    environment("th", "theorem", "Expands into theorem environment"),
    environment("the", "theorem", "Expands into theorem environment"),

    -- Lemma environment
    environment("le", "lemma", "Expands into lemma environment"),
    environment("lem", "lemma", "Expands into lemma environment"),

    -- Corollary environment
    environment("cor", "corollary", "Expands into corollary environment"),

    -- Conjecture environment
    environment("con", "conjecture", "Expands into conjecture environment"),

    -- Definition environment
    environment("de", "definition", "Expands into definition environment"),
    environment("def", "definition", "Expands into definition environment"),

    -- Claim environment
    environment("cl", "claim", "Expands into claim environment"),
    environment("cla", "claim", "Expands into claim environment"),

    -- Note environment
    environment("no", "note", "Expands into note environment"),
    environment("not", "note", "Expands into note environment"),

    -- Remark environment
    environment("re", "remark", "Expands into remark environment"),
    environment("rem", "remark", "Expands into remark environment"),

    -- Fact environment
    environment("fa", "fact", "Expands into fact environment"),
    environment("fac", "fact", "Expands into fact environment"),

    -- Exercise environment
    environment("ex", "exercise", "Expands into exercise environment"),
    environment("exe", "exercise", "Expands into exercise environment"),
    environment("ex*", "exercise*", "Expands into exercise* environment"),

    -- Problem environment
    environment("pb", "problem", "Expands into problem environment"),
    
    -- Enumerate environment
    environment("en", "enumerate", "Expands into enumerate environment"),
    environment("enu", "enumerate", "Expands into enumerate environment"),

    -- Itemize environment
    environment("it", "itemize", "Expands into itemize environment"),
    environment("ite", "itemize", "Expands into itemize environment"),
}
