local HType = require'./HType'
local HUri = HType:extend("HUri")

function HUri:initialize(target)
    self.target = target
end

function HUri:toZinc()
    return ("`%s`"):format(self.target)
end
function HUri:toJson()
    return ("u:%s"):format(self.target)
end
return HUri