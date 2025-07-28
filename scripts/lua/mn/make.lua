local lfs = require("lfs")

local mn_make = {}

local function isDir(path)
    if type(path)~="string" then return false end
    local cd = lfs.currentdir()
    local is = lfs.chdir(path) and true or false
    lfs.chdir(cd)
    return is
end

function mn_make.run(cmd_args, class_dir, config)
    
    local name
    local path
    if cmd_args[3] == "hw" then
        if not cmd_args[4] then
            error("No name for HW file passed")
        end
        name = cmd_args[4]
        path = class_dir
        if config.file_location then
            if config.file_location.hw then
                path = path .. "/" .. config.file_location.hw
            end
        end

    else -- Defaults to "notes"
        path = class_dir
        if config.file_location then
            if config.file_location.notes then
                path = path .. "/" .. config.file_location.notes
            end
        end
        name = os.date("%m-%d-%Y")
    end

    local count = 0
    -- Make sure not to override existing directories
    while isDir(path .. "/" .. name) do
        count = count + 1
        if count == 1 then
            name = name .. "-0"
        end
        name = name:sub(1, -2) -- Technically breaks on the 10-th repeat, who cares
        name = name .. count 
    end

    lfs.chdir(path)
    --lfs.mkdir(name)

    -- Copy template folder into a new directory
    local template_path = class_dir
    if config.file_location and config.file_location.template then
        template_path = template_path .. "/" .. config.file_location.template
        new_folder_path = path .. "/" .. name
        os.execute("cp -r \"" .. template_path .. "\" \"" .. new_folder_path .. "\"")
    else
        error("Missing config entry for file_location.template")
    end

    local latex_path
    if config.latex_file_name then
        latex_path = path .. "/" .. name .. "/" .. config.latex_file_name  
    else
        error("Missing config entry for latex_file_name")
    end

    local file = io.open(DATA_STORAGE_PATH .. "/mn-latex-file-location","w")
    file:write(latex_path)
    file:close()
    file = io.open(DATA_STORAGE_PATH .. "/mn-dir","w")
    file:write(path .. "/" .. name)
    file:close()

    -- Support old form
    if config.exec then
        os.execute("bash \"" .. class_dir .. "/" .. config.exec .. "\"")
    end
    -- Current forms
    if config.exec_all then
        os.execute("bash \"" .. class_dir .. "/" .. config.exec_all .. "\"")
    end
    if cmd_args[3] == "hw" and config.exec_hw then
        os.execute("bash \"" .. class_dir .. "/" .. config.exec_hw .. "\"")
    end


end

return mn_make
