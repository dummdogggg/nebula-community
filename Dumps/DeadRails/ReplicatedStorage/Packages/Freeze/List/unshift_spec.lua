--[[
    Script: ReplicatedStorage.Packages.Freeze.List.unshift.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.unshift);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("should unshift 1 value", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, "x")).toEqual({
            "x", 
            "a", 
            "b", 
            "c"
        });
    end);
    it("should unshift 3 values", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, "x", "y", "z")).toEqual({
            "x", 
            "y", 
            "z", 
            "a", 
            "b", 
            "c"
        });
    end);
end;