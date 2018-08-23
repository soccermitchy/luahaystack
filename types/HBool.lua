local HType = require'./HType'
local HBool = HType:extend("HBool")

function HBool:initialize(value)
    if type(value) ~= "boolean" then
        error "Value passed to HBool is not a boolean"
    end
    self.value = value
end 
function HBool:toZinc()
    return (value and "T") or "F"
end
function HBool:toJson()
    return (value and "true") or "false"
end

return HBool