string.split = function(sourceStr, splitStr)
    -- 切割字符串
    local rt = { }
    for w in string.gmatch(sourceStr, '[^' .. splitStr .. ']+') do
        table.insert(rt, w)
    end
    return rt
end
