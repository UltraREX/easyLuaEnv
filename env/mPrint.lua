mPrintFunc = function( param, indent )
	if not param then
		return
	end

	indent = indent or 0
	local indentStr = string.rep(" ", indent)

	local retStr = ""

	local paramType = type(param)
	if "table" == paramType then
		retStr = retStr .. "{\n"
		indent = indent + 4
		local tabIndentStr = string.rep(" ", indent)
		for k,v in pairs(param) do
			if "table" == type(v) then
				retStr = retStr .. tabIndentStr .. k .. " = " .. mPrintFunc(v, indent) .. "\n"
			else
				retStr = retStr .. tabIndentStr .. k .. " = " .. tostring(v) .. ",\n"
			end
		end
		retStr = retStr .. indentStr .. "}"
	else
		retStr = retStr .. indentStr .. param
	end

	return retStr
end


function mPrint( param )
	print(mPrintFunc(param))
end

