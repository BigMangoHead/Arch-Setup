local lfs = require("lfs")

local mn_open = {}

local function isDir(path)
    if type(path)~="string" then return false end
    local cd = lfs.currentdir()
    local is = lfs.chdir(path) and true or false
    lfs.chdir(cd)
    return is
end

function mn_open.run(cmd_args, class_dir, config)
    if not cmd_args[3] then
        error("Name of folder must be passed to open it")
    end
    local name = cmd_args[3]
    local path = class_dir

    if not config.latex_file_name then
        error("No LaTeX file name set")
    end

    local hw_path
    for d in lfs.dir(class_dir) do
        if config.file_location then
            if config.file_location.hw then
                hw_path = path .. "/" .. config.file_location.hw
            end
        end
    end

    local notes_path
    for d in lfs.dir(class_dir) do
        if config.file_location then
            if config.file_location.hw then
                notes_path = path .. "/" .. config.file_location.hw
            end
        end
    end
    
    local project_dir
    -- Check notes folder
    if notes_path then
        for d in lfs.dir(notes_path) do
            if d == name then
                local pathToCheck = notes_path .. "/" .. d
                local file = io.open(pathToCheck .. "/" .. config.latex_file_name)
                if file then
                    project_dir = pathToCheck
                    break
                end
            end
        end
    end

    -- Check homework folder
    if not project_dir and hw_path then
        for d in lfs.dir(hw_path) do
            if d == name then
                local pathToCheck = hw_path .. "/" .. d
                local file = io.open(pathToCheck .. "/" .. config.latex_file_name)
                if file then
                    project_dir = pathToCheck
                    break
                end
            end
        end
    end

    -- Check in directories and subdirectories in the class folder
    if not project_dir then
        for d in lfs.dir(class_dir) do
            if d == name then
                local pathToCheck = class_dir .. "/" .. d
                local file = io.open(pathToCheck .. "/" .. config.latex_file_name)
                if file then
                    project_dir = pathToCheck
                    break
                end
            end

            if d ~= "." and d ~= ".." then
                local pathToCheck = class_dir .. "/" .. d .. "/" .. name
                local file = io.open(pathToCheck .. "/" .. config.latex_file_name)
                if file then
                    project_dir = pathToCheck
                    break
                end
            end
        end
    end

    if not project_dir then
        error("Directory for project not found")
    end

    local file = io.open(DATA_STORAGE_PATH .. "/mn-latex-file-location","w")
    file:write(project_dir .. "/" .. config.latex_file_name)
    file:close()
    file = io.open(DATA_STORAGE_PATH .. "/mn-dir","w")
    file:write(project_dir)
    file:close()

    if config.exec then
        os.execute("bash \"" .. class_dir .. "/" .. config.exec .. "\"")
    end


end

return mn_open
