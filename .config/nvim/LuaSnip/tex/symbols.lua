-- Conditions
local helper = require('luasnip-helper')
local in_math = helper.in_math

-- Snippet Helpers
local function symbol(a, b, c)
    return s({trig = a, wordTrig = false, snippetType = "autosnippet", dscr = c},
                {t("\\" .. b)},
            {condition = in_math})
end

local function greek(a, b)
    return symbol(a, b, "Greek letter " .. b)
end

local function greekcap(a, b)
    return symbol(a, b, "Capital greek letter " .. b)
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
    greek(";t", "tau"),
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
    
    -- Dots
    symbol("ld", "ldots", "Three dots"),

    -- Inverse
    s({trig = a, wordTrig = false, snippetType = "autosnippet", dscr = "Inverse by exponent"},
                {t("^{-1}")},
            {condition = in_math})
    s({trig = a, wordTrig = false, snippetType = "autosnippet", dscr = "Inverse by exponent"},
                {t("^{-1}")},
            {condition = in_math})

}
