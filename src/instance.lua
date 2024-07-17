local ins = singleton()

function ins:ctor()
	self._n = 0
end

function ins:getN()
	self._n = self._n + 1
	return self._n
end

return ins.instance()