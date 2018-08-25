local HType = require'./HType'
local HDict = HType:extend("HDict")

function HDict:initialize(dict)
    dict = dict or {}
    for k,v in pairs(dict) do
        if type(k) == "number" then
            error "table with numeric key passed to HDict"
        end
        if type(v) ~= "table" and not v.toZinc then
            error "type not inheriting from HType passed to HDict"
        end
    end
    self.dict = dict
end

function HDict:add(key, value)
    if not type(value)=="table" and not value.toZinc then
        error "type not inheriting from HType passed to HDict"
    end
    dict[key]=value
end
function HDict:length()
    return #self.dict
end

function HDict:toZinc()
    local valueTable = {}
    for k,v in pairs(self.dict) do
        local s = k
        if v._type ~= "HMarker" then
            s = s .. ": " .. v:toZinc()
        end
        table.insert(valueTable, s)
    end
    return "{" .. table.concat(valueTable, " ") .. "}"
end

function HDict:toJson()
    local valueTable = {}
    for k,v in pairs(self.dict) do
        local s = '"' .. k .. '": ' .. v:toJson()
        table.insert(valueTable, s)
    end
    return "{" .. table.concat(valueTable, ", ") .. "}"
end

return HDict