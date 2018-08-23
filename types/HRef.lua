local HType = require'./HType'
local HRef = HType:extend("HRef")

function HRef:initialize(id, dis)
    self.id = id
    self.dis = dis or ""
end

function HRef:toZinc()
    return ("@%s%s"):format(self.id, (self.dis ~= "" and " ") .. self.dis)
end

function HRef:toJson()
    return ('"r:%s%s"'):format(self.id, (self.dis ~= "" and " ") .. self.dis)
end

return HRef