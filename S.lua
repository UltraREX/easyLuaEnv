local S = singleton()

function S:ctor()
	self._num = 1
end


function S:getNum()
	return self._num
end

function S:addNum( numInt )
	self._num = self._num + numInt
end

return S.instance()
