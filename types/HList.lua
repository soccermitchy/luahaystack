local HType = require'./HType'
local HList = HType:extend("HList")

function HList:initialize(list)
    list = list or {}
    for k,v in pairs(list) do
        if type(k) ~= "number" then
            error "non-array table passed to HList"
        end

        if type(v) ~= "table" and not v.toZinc then
            error "type not inheriting from HType passed to HList"
        end
    end
    self.list = list
end

function HList:add(element)
    if not type(element) == "table" then
        error "type not inheriting from HType passed to HList"
    end
    table.insert(self.list, element)
end

function HList:length()
    return #self.list
end

function HList:toZinc()
    local valueTable = {}
    for k,v in ipairs(self.list) do
        table.insert(valueTable, v:toZinc())
    end
    return "["..table.concat(valueTable, ",").."]"
end
function HList:toJson()
    local valueTable = {}
    for k,v in pairs(self.list) do
        table.insert(valueTable, v:toJson())
    end
    return "["..table.concat(valueTable, ",").."]"
end
return HList