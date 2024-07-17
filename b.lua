local A = require("A")
local B = class(A, "B")
local super = B.super

--[[
function B.new()
    local inst = B
    B:ctor()
    return inst
end
--]]

function B:ctor()
    print("+++++ B ctor")
    super.ctor(self)

    self._c = 1
    self._d = 2
end


function B:sum()
    print("+++++ B sum")
    -- return self._c + self._d
end



return B
