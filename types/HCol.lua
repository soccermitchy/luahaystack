local HType = require './HType'
local HCol = HType:extend("HCol")
function HCol:initialize(name, meta)
    if type(name) == "table" and name.type == "HStr" then
        name = name.value
    end
    if name == nil then
        error "no column name specified"
    end
    meta = meta or {_type = "HDict",dict={}}
    if type(meta) ~= table and not meta._type == "HDict" then
        error "non-HDict given for meta in HCol"
    end
    self.meta = meta
    self.name = name
end

function HCol:toZinc()
    local s = self.name
    if #self.meta ~= 0 then
        local valueTable = {}
        for k,v in pairs(self.meta.dict) do
            if v._type ~= "HMarker" then
                table.insert(valueTable, k..": "..v:toZinc())
            else
                table.insert(valueTable, k)
            end
        end
        s = s .. " " .. table.concat(valueTable, " ")
    end
    return s
end

function HCol:toJson()
    local s = '{"name": "' .. self.name .. '"'
    if (#self.meta ~= 0) then
        local valueTable = {}
        for k,v in pairs(self.meta.dict) do
            table.insert(valueTable, '"'..k..'": '..v:toJson())
        end
        s = s .. ", " .. table.concat(valueTable, ", ")
    end
    s = s .. "}"
    return s
end

return HCol