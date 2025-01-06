local lfs = require("lfs")
local json = require("lunajson")

local get_dir = {}

function get_dir.run(cmd_args)
    if not cmd_args[2] then
        error("At least two arguments must be passed. Form of command is \"mn <open/make> <CLASS> [ARGS]\"")
    end

    -- Iterate over directories in classes folder to find class directory
    local configFile
    local class_dir
    local foundName = false
    for d in lfs.dir(MATH_CLASSES_PATH) do
        if d == cmd_args[2] then
            foundName = true
        end
        if d ~= "." and d ~= ".." then
            configFile = io.open(MATH_CLASSES_PATH .. "/" .. d .. "/" .. cmd_args[2] .. "/" .. CONFIG_PATH, "r")
            if configFile then
                class_dir = MATH_CLASSES_PATH .. "/" .. d .. "/" .. cmd_args[2]
                break
            end
        end
    end

    -- Parse JSON config
    local config
    if configFile then
        local lines = {}
        -- Remove comments from the JSON file
        for line in configFile:lines() do
            local i = string.find(line, "//")
            if i then
                line = line:sub(1, i-1)
            end
            table.insert(lines, line)
        end
        configJson = table.concat(lines, "\n")
        configFile:close()
        config = json.decode(configJson)
    elseif foundName then
        error("Config file for class not found")
    else
        error("Class not found in " .. MATH_CLASSES_PATH .. " or its immediate subdirectories")
    end

    return class_dir, config
end

return get_dir
