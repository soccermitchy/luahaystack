local HType = require './HType'
local HMarker = HType:extend("HMarker")

function HMarker:toZinc()
    return "M"
end
function HMarker:toJson()
    return '"m:"'
end

return HMarker