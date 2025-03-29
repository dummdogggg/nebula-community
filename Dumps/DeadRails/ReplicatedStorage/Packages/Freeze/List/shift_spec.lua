--[[
    Script: ReplicatedStorage.Packages.Freeze.List.shift.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.shift);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("shift, no args", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2 = v0(v1);
        expect(v2).toEqual({
            "b", 
            "c"
        });
    end);
    it("shift, number", function() --[[ Line: 11 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, 2);
        expect(v3).toEqual({
            "c"
        });
    end);
    it("shift, to empty", function() --[[ Line: 16 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v4 = v0(v1, 3);
        expect(v4).toEqual({});
    end);
    it("shift, out of bounds", function() --[[ Line: 21 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v5 = v0(v1, 4);
        expect(v5).toEqual({});
    end);
end;