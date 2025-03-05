local csv = require("csv")
local eansi = require("eansi")

local file = csv.open(arg[1])

local columns = {}
local pointspos = {}
local students = {}

local pattern = nil
if arg[2] == 'ws' then pattern = function(x) return (string.find(x, "^WS ") and string.find(x, "%[S3%]")) end
elseif arg[2] == 'pc' then pattern = function(x) return string.find(x, "^PC ") end
elseif arg[2] == 'web' then pattern = function(x) return (string.find(x, "^WebAssign ") and string.find(x, "%(")) end
else error("Invalid option for assignment type")
end

local x = 1
for fields in file:lines() do
    if x == 1 then
        for i, v in ipairs(fields) do 
            columns[i] = v
        end
    end
    if x == 3 then
        for i, v in ipairs(fields) do 
            pointspos[i] = v
        end
    end
    if x > 3 then
        local student = {}
        local name = ""
        local pc_score = 0
        local pc_total = 0
        for i, v in ipairs(fields) do 
            if i == 1 then name = v end
            if v ~= "" then
                if pattern(columns[i]) and not string.find(v, "%a") then
                    pc_score = pc_score + v
                    pc_total = pc_total + pointspos[i]
                end
            end
        end
        student['pc_score'] = pc_score
        student['pc_total'] = pc_total
        student['name'] = name

        local col
        if (pc_score / pc_total < 0.5) then col = "${red}"
        elseif (pc_score / pc_total < 0.8) then col = "${yellow}"
        else col = "${green}"
        end

        print(eansi(col .. name .. ' ' .. pc_score .. ' ' .. pc_total))

        students[name] = student
    end

    x = x + 1
end

for i, v in ipairs(students) do print(i) end
