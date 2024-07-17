
function class(baseClass, classname)
    local class_type = { }
    class_type.super = baseClass
    class_type.ctor = function() end
    class_type.className = classname
    assert(classname, "classname can't be nil now")
    class_type.new = function(...)
        local instObj = { }
        instObj.super = baseClass
        instObj.ctor = function() end
        
        instObj.__class_name = classname
        setmetatable(instObj, { __index = class_type })
        
        local call_ctor
        call_ctor = function(curClassType, ...)
            if curClassType.super ~= nil then
                call_ctor(curClassType.super, ...)
            end
            if curClassType.ctor ~= nil then
                curClassType.ctor(instObj, ...)
            end

        end

        call_ctor(class_type, ...)
        return instObj
    end

    setmetatable(class_type, { __index = baseClass, __call = class_type.new})
    return class_type
end

function extend(self, tb)
	if not self or not tb then
		return self
	end
	
	for key, value in pairs(tb) do
		if not self[key] then
			self[key] = value
		end
    end
    
    return self
end

function import(module, moduleName, currentModuleName)
	local currentModuleNameParts
	local moduleFullName = moduleName
	local offset = 1
	
	while true do
		if string.byte(moduleName, offset) ~= 46 then -- .
			moduleFullName = string.sub(moduleName, offset)
			if currentModuleNameParts and #currentModuleNameParts > 0 then
				moduleFullName = table.concat(currentModuleNameParts, ".") .. "." .. moduleFullName
			end
			break
		end
		offset = offset + 1
		
		if not currentModuleNameParts then
			if not currentModuleName then
				local _, v = debug.getlocal(3, 1)
				currentModuleName = v
			end
            
            if string.find(currentModuleName, "/") then
                currentModuleNameParts = string.split(currentModuleName, "/")
            else
                currentModuleNameParts = string.split(currentModuleName, ".")
            end
        end
		table.remove(currentModuleNameParts, #currentModuleNameParts)
	end
    local importModule = require(moduleFullName)
    if importModule then 
        return extend(module, importModule)
    end

    return module
end


function append( dest, src ) 
    if not dest then 
        return nil
    end

    if not src then 
        return dest
    end

    for key, value in pairs(src) do 
        if type(value) ~= "table" or key == "__index" then 
            dest[key] = value
        else
            dest[key] = append({}, value)
        end
    end

    return dest
end


function handler( func, target )
    return function(...)
        func(target, ...)
    end
end