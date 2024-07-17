function singleton(super)
    local instObj = {}
    instObj.__index = instObj
    setmetatable(instObj, super)

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