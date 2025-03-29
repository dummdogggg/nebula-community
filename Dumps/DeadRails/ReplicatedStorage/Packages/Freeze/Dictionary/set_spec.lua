--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.set.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.set);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = 1, 
        b = 2, 
        c = 3
    };
    it("set existing", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, "b", 4)).toEqual({
            a = 1, 
            b = 4, 
            c = 3
        });
    end);
    it("set new", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, "d", 4)).toEqual({
            a = 1, 
            b = 2, 
            c = 3, 
            d = 4
        });
    end);
    it("set no change, same id", function() --[[ Line: 14 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, "a", 1)).toBe(v1);
    end);
end;