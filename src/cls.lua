
local cls = class(nil, "t")

function cls:ctor()
	self._n = 0
end

function cls:getN()
	return self._n
end

function cls:setN(numInt)
	self._n = numInt
end

return cls