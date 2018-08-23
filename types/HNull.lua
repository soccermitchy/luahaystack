local HType = require './HType'
local HNull = HType:extend("HNull")

function HNull:toZinc()
    return "N"
end
function HNull:toJson()
    return "null"