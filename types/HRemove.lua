local HType = require './HType'
local HRemove = HType:extend("HRemove")

function HRemove:toZinc()
    return "R"
end
function HRemove:toJson()
    return '"-:"'
end

return HRemove