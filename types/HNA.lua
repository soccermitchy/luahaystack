local HType = require './HType'
local HNA = HType:extend("HNA")

function HNA:toZinc()
    return "NA"
end
function HNA:toJson()
    return '"z:"'
end

return HNA