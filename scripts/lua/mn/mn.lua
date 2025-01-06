local mn_get_dir = require("utils/get_dir")

CONFIG_PATH = ".struct/config.json"
MATH_CLASSES_PATH = "/home/bigma/math/classes"
DATA_STORAGE_PATH = "/home/bigma/scripts/data"


if arg[1] == "make" then

    local mn_make = require("make")
    class_dir, config = mn_get_dir.run(arg)
    mn_make.run(arg, class_dir, config)

elseif arg[1] == "open" then

    local mn_open = require("open")
    class_dir, config = mn_get_dir.run(arg)
    mn_open.run(arg, class_dir, config)

elseif arg[1] == "latest" then
    
elseif arg[1] then

    error("Invalid command: " .. arg[1] .. " is not a valid option")

else
    error("No command passed")
end
