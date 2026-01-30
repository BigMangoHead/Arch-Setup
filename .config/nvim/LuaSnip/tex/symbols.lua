-- Conditions
local helper = require('luasnip-helper')
local in_math = helper.in_math

-- Snippet Helpers
local function expression(a, b, c)
    return s({trig = a, wordTrig = false, snippetType = "autosnippet", dscr = c},
                {t(b)},
            {condition = in_math})
end

local function symbol(a, b, c)
    return expression(a, "\\" .. b, c)
end

local function greek(a, b)
    return symbol(a, b, "Greek letter " .. b)
end

local function greekcap(a, b)
    return symbol(a, b, "Capital greek letter " .. b)
end

local function scriptface(a)
    return s({trig = "[Cc]" .. a, trigEngine = "pattern", wordTrig = false, snippetType = "autosnippet", dscr = "Script typeface " .. a},
                {t("\\mathcal " .. a)},
            {condition = in_math})
end

-- Snippets
return {
    -- Greek letters
    greek(";a", "alpha"),
    greek(";b", "beta"),
    greek(";g", "gamma"),
    greek(";d", "delta"),
    greek(";e", "epsilon"),
    greek(";z", "zeta"),
    greek(":e", "eta"),
    greek(";t", "theta"),
    greek(":i", "iota"),
    greek(";k", "kappa"),
    greek(";l", "lambda"),
    greek(";m", "mu"),
    greek(";n", "nu"),
    greek(";x", "xi"),
    greek(";p", "pi"),
    greek(";r", "rho"),
    greek(";s", "sigma"),
    greek(":t", "tau"),
    greek(";h", "phi"),
    symbol(":h", "varphi", "Other form of greek letter phi"),
    greek(";c", "chi"),
    greek(";i", "psi"),
    greek(";o", "omega"),
    greekcap(";G", "Gamma"),
    greekcap(";D", "Delta"),
    greekcap(";T", "Theta"),
    greekcap(";L", "Lambda"),
    greekcap(";X", "Xi"),
    greekcap(";P", "Pi"),
    greekcap(";H", "Phi"),
    greekcap(";I", "Psi"),
    greekcap(";O", "Omega"),

    -- Partial symbol
    symbol(":p", "partial", "Partial derivative"),
    
    -- Dots
    symbol("ld", "ldots", "Three dots"),

    -- Right arrow
    symbol("rar", "rightarrow", "Right arrow"),
    symbol("Rar", "rightrightarrows", "Two right arrows"),

    -- Equivalence symbol
    symbol("equ", "equiv", "Equivalence"),

    -- Simple math blackboard symbols
    symbol("NN", "mathbb N", "Set of positive integers"),
    symbol("ZZ", "mathbb Z", "Set of integers"),
    symbol("QQ", "mathbb Q", "Set of rationals"),
    symbol("RR", "mathbb R", "Set of real numbers"),
    symbol("CC", "mathbb C", "Set of complex numbers"),
    symbol("FF", "mathbb F", "Finite field"),
    symbol("PP", "mathbb P", "Projective plane"),
    symbol("EE", "mathbb E", "Euclidean plane"),
    symbol("AA", "mathbb A", "Alternative Euclidean plane"),
    symbol("DD", "mathbb D", "Open disk"),
    symbol("HH", "mathbb H", "Bold font H"),

    -- Simple math script symbols
    scriptface("A"),
    scriptface("B"),
    scriptface("D"),
    scriptface("E"),
    scriptface("F"),
    scriptface("G"),
    scriptface("H"),
    scriptface("I"),
    scriptface("J"),
    scriptface("K"),
    scriptface("L"),
    scriptface("M"),
    scriptface("N"),
    scriptface("O"),
    scriptface("P"),
    scriptface("Q"),
    scriptface("R"),
    scriptface("S"),
    scriptface("T"),
    scriptface("W"),

    -- More complex ones
    expression("Cc", [[\widehat{\mathbb C}]], "Extended complex plane"),
    expression("cC", [[\widehat{\mathbb C}]], "Extended complex plane"),

    -- Set operators
    symbol("sue", "subseteq", "Subset or equal"),
    symbol("sus", "subset", "Proper subset"),
    symbol("sem", "setminus", "Set difference"),

    -- Group operators
    symbol("ngr", "trianglelefteq", "Normal subgroup"),
    symbol("act", "curvearrowright", "Group action"),

    -- Curve in group action
    symbol("cur", "curvearrowright", "Group action symbol"),

    -- Empty set
    symbol("emp", "varnothing", "Empty set"),

    -- Infinity
    symbol("INF", "infty", "Infinity"),
}
