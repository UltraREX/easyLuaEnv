





local pathStr = "chenxin" .. "\\" .. "3013_trans"
print(string.gsub(pathStr, "\\", "/"))





print(2//2)
print(2.5//2)
print(3//2)



local f = 29
local s = 60

print(f >> (s - 1) & 1 == 1)



local t = {}
t[4] = 0 t[5]=0 t[6]=0 t[7] = 0 t[8] =0 
print(#t)
for i,v in pairs(t) do
	print(i,v)
end








--[[

	local perNumList = {498, 0, 498, 0, 0}
    local precisionSumNum = 10 ^ (1 + 2)

    local perSumNum = 0
    for _, perNum in ipairs(perNumList) do
        perSumNum = perSumNum + perNum
    end
    local diffNum = precisionSumNum - perSumNum
	
	local indexInt = 1
	local lenInt = #perNumList
    while true do
		local perNum = perNumList[indexInt]
		print("++++ perNum", perNum)
		if perNum > 0 then
			perNumList[indexInt] = perNum + 1
			print("+++++ ", perNumList[indexInt])
			diffNum = diffNum - 1
			print("+++++ diffNum", diffNum)
			if diffNum <= 0 then
				break
			end
		end

			indexInt = indexInt + 1
			indexInt = indexInt % lenInt
			
            indexInt = indexInt == 0 and lenInt or indexInt
			print("+++++ indexInt", indexInt)
    end

	mPrint(perNumList)


--]]


















--[[
local class_warpower_max = {
    [10000] = { {0,10000,1},{0,10000,2},{0,10000,3} },
    [38778] = { {10001,38778,1},{10001,38778,2},{10001,38778,3} },
    [80907] = { {38779,80907,1},{38779,80907,2},{38779,80907,3} },
    [136118] = { {80908,136118,1},{80908,136118,2},{80908,136118,3} },
    [204214] = { {136119,204214,1},{136119,204214,2},{136119,204214,3} },
    [285040] = { {204215,285040,1},{204215,285040,2},{204215,285040,3} },
    [378469] = { {285041,378469,1},{285041,378469,2},{285041,378469,3} },
    [484393] = { {378470,484393,1},{378470,484393,2},{378470,484393,3} },
    [602719] = { {484394,602719,1},{484394,602719,2},{484394,602719,3} },
    [733364] = { {602720,733364,1},{602720,733364,2},{602720,733364,3} },
    [876254] = { {733365,876254,1},{733365,876254,2},{733365,876254,3} },
    [1031322] = { {876255,1031322,1},{876255,1031322,2},{876255,1031322,3} },
    [1198507] = { {1031323,1198507,1},{1031323,1198507,2},{1031323,1198507,3} },
    [1377754] = { {1198508,1377754,1},{1198508,1377754,2},{1198508,1377754,3} },
    [1569011] = { {1377755,1569011,1},{1377755,1569011,2},{1377755,1569011,3} },
    [1772230] = { {1569012,1772230,1},{1569012,1772230,2},{1569012,1772230,3} },
    [1987366] = { {1772231,1987366,1},{1772231,1987366,2},{1772231,1987366,3} },
    [2214377] = { {1987367,2214377,1},{1987367,2214377,2},{1987367,2214377,3} },
    [2453224] = { {2214378,2453224,1},{2214378,2453224,2},{2214378,2453224,3} },
    [2703869] = { {2453225,2703869,1},{2453225,2703869,2},{2453225,2703869,3} },
    [2966277] = { {2703870,2966277,1},{2703870,2966277,2},{2703870,2966277,3} },
    [3240415] = { {2966278,3240415,1},{2966278,3240415,2},{2966278,3240415,3} },
    [3526250] = { {3240416,3526250,1},{3240416,3526250,2},{3240416,3526250,3} },
    [3823752] = { {3526251,3823752,1},{3526251,3823752,2},{3526251,3823752,3} },
    [4132892] = { {3823753,4132892,1},{3823753,4132892,2},{3823753,4132892,3} },
    [4453642] = { {4132893,4453642,1},{4132893,4453642,2},{4132893,4453642,3} },
}


local powerMaxList = {}
for k, v in pairs(class_warpower_max) do
    powerMaxList[#powerMaxList + 1] = k
end
table.sort(powerMaxList)

mPrint(powerMaxList)

local suitPowerInt = 10000

local minIndexInt = 1
local maxIndexInt = #powerMaxList
while minIndexInt < maxIndexInt do
	local indexInt = math.floor((minIndexInt + maxIndexInt) / 2)
	local valueInt = powerMaxList[indexInt]
	
	if suitPowerInt <= valueInt then
		maxIndexInt = indexInt
	else
		minIndexInt = indexInt + 1
	end
end

local minValueInt = 0
local prevIndexInt = minIndexInt - 1
if prevIndexInt > 0 then
	minValueInt = powerMaxList[prevIndexInt] + 1
end
local maxValueInt = powerMaxList[maxIndexInt]

print(minIndexInt, maxIndexInt, minValueInt, maxValueInt)
--]]











--[[
function getPreciseDecimal( numInt, digitInt )
    if type(numInt) ~= "number" then
        return numInt
    end
    
    digitInt = digitInt or 0
    digitInt = math.floor(digitInt)
    if digitInt < 0 then
        digitInt = 0
    end
	
    if numInt < 0 then
		local roundInt = math.ceil(numInt)
		local fractionNum = numInt - roundInt
		local absFractionNum = math.abs(fractionNum)
        local decimalNum = absFractionNum - absFractionNum % 0.1 ^ digitInt
		return roundInt - decimalNum
    else
		local roundInt = math.floor(numInt)
		print("roundInt", roundInt)
		local fractionNum = numInt - roundInt
		print("fractionNum", fractionNum)
        local decimalNum = fractionNum - fractionNum % 0.1 ^ digitInt
		print("decimalNum", fractionNum % 0.1 ^ digitInt)
		print("decimalNum", decimalNum)
		return roundInt + decimalNum
    end
end

print(getPreciseDecimal(1.16, 2))
print(getPreciseDecimal(1.16123, 2))
print(getPreciseDecimal(1.166123, 2))
--]]







--[[
function keepDecimalTest(num, n)
    if type(num) ~= "number" then
        return num    
    end
    n = n or 2
    if num < 0 then
        return -(math.abs(num) - math.abs(num) % 0.1 ^ n)
    else
        return num - num % 0.1 ^ n
    end
end

function getPreciseDecimal(numInt, digitInt)
    digitInt = digitInt or 0
    digitInt = math.floor(digitInt)
    if digitInt < 0 then
        digitInt = 0
    end

    local nDecimalInt = 10 ^ digitInt
    -- 这里如果不tostring的话会出现类似math.floor(1.16*100) = 115的异常结果
    local nTempInt = math.floor( tostring(numInt * nDecimalInt) )
    local nRetInt = nTempInt / nDecimalInt
    return nRetInt
end




print(keepDecimalTest(1.123, 1))
print(keepDecimalTest(1.123, 2))
print(keepDecimalTest(-1.123, 1))

print(getPreciseDecimal(1.123, 1))
print(getPreciseDecimal(1.123, 2))
print(getPreciseDecimal(-1.123, 1))
--]]










--[[

collectgarbage("stop")  -- close auto gc
collectgarbage("collect")  -- full gc

--[[
local before = collectgarbage("count")
for i = 1, 10000 do
	local str = "1000000000" .. "0"
end

local after = collectgarbage("count")
print(after - before)
--]]


--[[
local before = collectgarbage("count")
for i = 1, 10000 do
	local str = "1000000000" .. i
end

local after = collectgarbage("count")
print(after - before)
--]]


--[[
local before = collectgarbage("count")
for i = 1, 10000 do
	local str = "1000000000100000000010000000001000000000" .. "0"
end

local after = collectgarbage("count")
print(after - before)
--]]


--[[
local before = collectgarbage("count")
for i = 1, 10000 do
	local str = "1000000000100000000010000000001000000000" .. i
end

local after = collectgarbage("count")
print(after - before)
--]]

--]]















--[[
local data = require("src.data")
data:init()
--]]
--[[
print("insert:")
data:insertTab()
data:insertSelfTab()
--]]

--[[
print("t[i] = :")
data:updateTab()
data:updateSelfTab()
data:updateLocalSelfTab()
--]]

--[[
print("t[#t + 1] = :")
data:updateTabC()
data:updateSelfTabC()
--]]































--[[
local leafLuaList = {"one", "two", "three", "four", "five", "six", "seven"}
local maxLenInt = #leafLuaList
local midInt = math.ceil(maxLenInt/2)

function getLeafLuaList( indexInt )
	local indexList = {}
	for i = 1, indexInt/2 do
		table.insert(indexList, i)
		local rightIndexInt = maxLenInt - i + 1
		table.insert(indexList, rightIndexInt)
	end
	table.insert(indexList, midInt)
	table.sort(indexList)
	
	local luaList = {}
	for _, indexInt in ipairs(indexList) do
		table.insert(luaList, leafLuaList[indexInt])
	end
	return luaList
end

mPrint(getLeafLuaList(5))
--]]














--[[
local v = {["x"] = 1, ["y"] = 1, ["z"] = 1}

function readonly(t)
    local proxy = {origin = t}
    local mt = {
        __index = t,
        __newindex = function(t, k, v)
            assert(false, 'Can\'t change value for key:'..k..' for a readonly table.\n') 
        end
    }

    setmetatable(proxy, mt)
    return proxy
end


local rv = readonly(v)
mPrint(rv)

rv.origin.x = 2
mPrint(rv)

print(v.x)
print(rv.x)

--]]
















--[[
local str = "123.4567-890"


local function escape( str )
    str = string.gsub(str, "[%(%)%.%+%-%*%?%[%]%^%$%%]", "%%%1")
    return str
end

print("+++ ", string.find(str, str))
print("+++ ", string.find(str, escape(str)))
--]]










--[[
for param in string.gmatch("123#title##text###", "(#[%w]+#)") do
	print(param)
end
--]]




--[[
function singleton(super)
    local instObj = {}
    instObj.__index = instObj
    setmetatable(instObj, {__index = super})

    function instObj.instance(...)
        if instObj._instance then
            return instObj._instance
        end

        local instance = setmetatable({}, instObj)
        if instance.ctor then
            instance:ctor(...)
        end

        instObj._instance = instance
        return instObj._instance
    end

    return instObj
end

local t = {

}

function t:f()
	print("123")
end

local s = singleton(t)
print(s.f())
--]]





--[[
lvInt = 1
repeat
	lvInt = lvInt - 1
	break
until lvInt == 0

print(lvInt)
--]]


--[[
	{
		year = 2021,
		month = 6,
		day = 15,
		hour = 17,
		min = 4,
		sec = 47,
		yday = 166,
		wday = 3,
		isdst = false,
	}
--]]
--[[
local now = os.time()
mPrint(now)
local nowDict = os.date('*t', now)
nowDict.day = 20
local weekTimestampInt = os.time(nowDict)
mPrint(weekTimestampInt)
mPrint(os.date('*t', weekTimestampInt))
--]]















--[[
local cls = require("src.cls").new()
local ins = require("src.instance")


print("cls")
print(cls:getN())
cls:setN(2)
print(cls:getN())

print("cls2")
local cls2 = require("src.cls").new()
print(cls2:getN())
cls2:setN(1)
print(cls2:getN())

print("ins")
print(ins:getN())
print(ins:getN())
print(ins:getN())

print("ins2")
local ins2 = require("src.instance")
print(ins2:getN())
print(ins2:getN())
print(ins2:getN())
--]]