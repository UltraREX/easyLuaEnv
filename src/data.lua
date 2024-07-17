local Data = {}


local MAX = 9999999


function Data:init()
	self._tab = {}
	self._tab2 = {}
	self._tab3 = {}
end


function Data:insertTab()
	local start = os.clock()
	
	local t = {}
	local table_insert = table.insert
	for i=1,MAX do
		table_insert(t, i)
	end
	self._tab = t
	
	local endt = os.clock()
	print(endt - start)
end


function Data:insertSelfTab()
	local start = os.clock()
	
	local table_insert = table.insert
	for i=1,MAX do
		table_insert(self._tab2, i)
	end
	
	local endt = os.clock()
	print(endt - start)
end


function Data:updateTab()
	local start = os.clock()
	local t = {}
	
	for i=1,MAX do
		t[i] = i
	end
	self._tab = t
	
	local endt = os.clock()
	print(endt - start)
end


function Data:updateSelfTab()
	local start = os.clock()
	
	for i=1,MAX do
		self._tab2[i] = i
	end
	
	local endt = os.clock()
	print(endt - start)
end


function Data:updateLocalSelfTab()
	local start = os.clock()
	
	local t = self._tab3
	for i=1,MAX do
		t[i] = i
	end
	
	local endt = os.clock()
	print(endt - start)
end


function Data:updateTabC()
	local start = os.clock()
	
	local t = {}
	for i=1,MAX do
		t[#t + 1] = i
	end
	self._tab = t
	
	local endt = os.clock()
	print(endt - start)
end


function Data:updateSelfTabC()
	local start = os.clock()
	
	for i=1,MAX do
		self._tab2[#self._tab2 + 1] = i
	end
	
	local endt = os.clock()
	print(endt - start)
end


return Data
