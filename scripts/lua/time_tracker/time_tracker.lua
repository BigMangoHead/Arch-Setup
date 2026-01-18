
local json = require("lunajson")
local row_manager = require("add_row")

-- .ODS file storing time data
TIME_TRACKER_FILE = "/home/bigma/misc-files/time.ods"
DATA_FILE = "/home/bigma/scripts/data/time_tracker"

local cmd = arg[1]

local function getJson()
    local f = assert(io.open(DATA_FILE), "r")
    local raw_data = f:read("*all")
    if raw_data == "" then return nil end
    local data = json.decode(raw_data)
    f:close()
    return data
end
local function saveJson(jsonData)
    local f = assert(io.open(DATA_FILE, "w"))
    f:write(json.encode(jsonData))
    f:close()
end
local function clearData()
    io.open(DATA_FILE,"w"):close()
end
local function log(msg)
    print(msg)
end

if cmd == "start" then
    local data = {}
    data.start_time = os.time()
    data.topic = arg[2] or " "
    saveJson(data)
    log("Starting timer for topic " .. arg[2])

elseif cmd == "stop" then
    local data = getJson()
    if not data then
        log("No stored data")
        return
    end

    local time_now = os.time()
    local time_old = data.start_time or time_now
    local topic = data.topic or " "

    local time_passed = time_now - time_old - (data.time_paused or 0)
    if data.paused == true then
        time_passed = time_passed - time_now + data.last_paused
    end

    local row_data = {}
    table.insert(row_data, topic)
    local hours = math.floor(time_passed / 3600)
    local minutes = math.floor(time_passed / 60) % 60
    table.insert(row_data, string.format("%02d:%02d", hours, minutes)) 
    table.insert(row_data, os.date("%m/%d", time_old))
    row_manager.add_row(TIME_TRACKER_FILE, row_data)

    log(string.format("%02d hours and %02d minutes logged.", hours, minutes))

    clearData()

elseif cmd == "cancel" then
    clearData()

elseif cmd == "open" then
    os.execute("libreoffice " .. TIME_TRACKER_FILE .. " &")

elseif cmd == "pause" then
    local data = getJson()
    if not data then
        log("No stored data")
        return
    end

    if data.paused then return end
    data.paused = true
    data.last_paused = os.time()

    saveJson(data)

elseif cmd == "unpause" then
    local data = getJson()
    if not data then
        log("No stored data")
        return
    end
    if not data.paused then
        log("Not currently paused")
        return 
    end

    data.paused = false
    local total_time = data.time_paused or 0
    total_time = total_time + (os.time() - data.last_paused)
    data.time_paused = total_time

    saveJson(data)
else 
    local data = getJson()
    if not data then
        log("No stored data")
        return
    end

    local time_now = os.time()
    local time_old = data.start_time or time_now
    local topic = data.topic or " "

    local time_passed = time_now - time_old - (data.time_paused or 0)
    if data.paused == true then
        time_passed = time_passed - time_now + data.last_paused
    end
    log(string.format("Current elapsed time: %02d:%02d", math.floor(time_passed / 3600), math.floor(time_passed / 60) % 60))

end
