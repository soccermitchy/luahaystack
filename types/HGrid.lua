local HType = require './HType'
local HDict = require './HDict'
local HList = require './HList'
local HMarker = require './HMarker'
local HCol = require './HCol'
local HGrid = HType:extend("HGrid")

-- meta: HDict
-- cols: Array<HCol> or string
-- data: Array<HList>
function HGrid:initialize(meta, cols, data)
    meta = meta or HDict:new()

    cols = (cols~=nil and type(cols) == "table" and #cols>0 and cols) or error "No cols given"
    data = (data~=nil and type(data) == "table" and #data>0 and data) or error "No data given"

    self.meta = meta
    for k,v in pairs(cols) do
        if (type(v) ~= "table" or v._type ~= "HCol") and type(v) ~= "string" then
            error "Non-HCol/non-string given as a header"
        end
        if type(v) == "string" then
            cols[k] = HCol:new(v)
        end
    end
    self.cols = cols

    for k,v in pairs(data) do
        if type(v) ~= "table" or v.toZinc == nil then
            error "Non-HType given as data value"
        end
    end
    self.data = data
end

function HGrid:toZinc()
    local s = ""
    -- build meta
    s = s .. 'ver: "3.0"'
    if (#self.meta > 0) then
        s = s .. ' '
        local valueTable = {}
        for k,v in pairs(self.meta.dict) do
            local value = k
            if v._type ~= "HMarker" then
                value = value .. ": " .. v:toZinc()
            end
            table.insert(valueTable, value)
        end
        s = s .. table.concat(value)
    end
    s = s .. "\n"
    -- build header
    local headerTable = {}
    for k,v in pairs(self.cols) do
        table.insert(headerTable, v:toZinc())
    end
    s = s .. table.concat(headerTable, " ") .. "\n"

    -- build data
    for k,v in pairs(self.data) do
        local rowData = {}
        for k2,v2 in pairs(v.list) do
            table.insert(rowData, v2:toZinc())
        end
        s = s .. table.concat(rowData, ",") .. "\n"
    end
    s = s .. "\n"
    return s
end

function HGrid:toJson()

end

local grid = HGrid:new(nil, {"test"}, {HList:new({HMarker:new()})})
print(grid:toZinc())