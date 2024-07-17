
local T = {}

function T:ctor()
	self._num = 1
end

function T:getNum()
	return self._num
end

function T:addNum( numInt )
	self._num = self._num + numInt
end

return T
