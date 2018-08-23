local HType = require'./HType'
local HCoord = HType:extend("HCoord")

function HCoord:initialize(lat, long)
    self.lat = lat
    self.long = long
end

function HCoord:toZinc()
    return ("C(%d,%d)"):format(self.lat, self.long)
end
function HCoord:toJson()
    return ('"c:%d,%d"'):format(self.lat, self.long)
end
return HCoord