
row_manager = require("add_row")

-- .ODS file storing time data
TIME_TRACKER_FILE = "/home/bigma/misc-files/time.ods"
DATA_FILE = "/home/bigma/scripts/data/time_tracker"

if arg[1] == "start" then
    local file_text = os.time() .. '\n'
    file_text = file_text .. arg[2] .. '\n'
    local f = assert(io.open(DATA_FILE, "w"))
    f:write(file_text)
    f:close()

elseif arg[1] == "stop" then
    local f = assert(io.open(DATA_FILE), "r")
    local i = 0
    local time_now = os.time()
    local time_old = 0
    local row_data = {}
    local topic
    for line in f:lines() do
        if i == 0 then
            time_old = line
        elseif i == 1 then -- Only add one argument of data for now
            topic = line
        end
        i = i + 1
    end

    table.insert(row_data, topic or "")
    local hours = math.floor((time_now - time_old) / 3600)
    local minutes = math.floor((time_now - time_old) / 60) % 60
    table.insert(row_data, string.format("%02d:%02d", hours, minutes)) 
    table.insert(row_data, os.date("%m/%d", time_old))
    row_manager.add_row(TIME_TRACKER_FILE, row_data)

    f = assert(io.open(DATA_FILE, "w"))
    f:write("")
    f:close()

elseif arg[1] == "cancel" then
    f = assert(io.open(DATA_FILE, "w"))
    f:write("")
    f:close()

elseif arg[1] == "open" then
    os.execute("libreoffice " .. TIME_TRACKER_FILE)

end
