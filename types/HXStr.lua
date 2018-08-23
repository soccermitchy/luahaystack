local HType = require './HType'
local HXStr = HType:extend("HType")

function HXStr:initialize(type, value)
    self.type = type
    self.value = value
end

function HXStr:toZinc()
    return ("%s(%s)"):format(self.type, self.value)
end

function HXStr:toJson()
    return ("x:%s:%s"):format(self.type, self.value)
end

return HXStr