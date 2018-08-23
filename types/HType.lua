local Object = require'core'.Object
local HType = Object:extend()

HType._new = HType.new
HType._extend = HType.extend
HType._type = "HType"
function HType:extend(type)
    type = type or error 'Type must be specified when extending HType'
    local newType = self:_extend()
    newType._type = type
    newType._parent = self
    return newType
end

function HType:new(...)
    if not self.toZinc then
        print("[luahaystack warning] Class " .. self._type .." inheriting from HType didn't implement toZinc!")
    end
    if not self.toJson then
        print("[luahaystack warning] Class " .. self._type .." inheriting from HType didn't implement toJson!")
    end
    local newinst = self:_new(...)
    return newinst
end

return HType