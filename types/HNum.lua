local HType = require './HType'
local HNum = HType:extend("HNum")

function HNum:initialize(value, unit)
    if type(value) ~= "number" then
        error "Value passed to HNum is not a number"
    end
    local unit = unit or ""
    if type(unit) ~= "string" then
        error "Unit passed to HNum must be a string"
    end

    self.value = value
    self.unit = unit
end

function HNum:toZinc(prefix)
    local s = prefix or ""
    if (self.value < 0) then 
        s = s .. '-' 
    end
    if (math.abs(self.value) == math.huge) then
        s = s .. "INF"
    else
        s = s .. math.abs(self.value)
    end
    if self.unit ~= "" then
        s = s .. ' ' .. self.unit
    end
    return s
end

function HNum:toJson()
    return self:toZinc("n:")
end

return HNum