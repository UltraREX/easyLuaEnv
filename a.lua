local A = class(nil, "A")


function A:ctor()
    print("+++++ A ctor")
    self._a = 0
    self._b = 0

    local sum = self:sum()
    print(sum)
end


function A:sum()
    print("+++++ A sum")
    return self._a + self._b
end


return A
