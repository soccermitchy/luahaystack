local HType = require './HType'
local HStr = HType:extend("HStr")

function HStr:initialize(value)
    self.value = value
end

function HStr:toZinc()
    return '"' .. self:encodeStr() .. '""'
end

function HStr:toJson()
    return '"s:' .. self:encodeStr() .. '"'
end

function HStr:encodeStr(str)
    local str = str or self.value
    local out = ""
    for i=1, #str do
        local char = str:sub(i,i)
        if (char:byte() < 32) then
            out = out .. "\\"
            if (char == "\n") then
                out = out .. "n"
            elseif (char == "\t") then
                out = out .. "t"
            elseif (char == "\r") then
                out = out .. "r"
            else
                out = out .. "u" .. string.format("%04x", char:byte())
            end
        elseif (char == "\\") then
            out = out .. "\\\\"
        else
            out = out .. char
        end
    end
    return out
end

return HStr