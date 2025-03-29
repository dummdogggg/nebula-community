--[[
    Script: ReplicatedStorage.Packages.Freeze.List.take.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.take);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("exactly 1", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, 1)).toEqual({
            "a"
        });
    end);
    it("more than 1", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, 2)).toEqual({
            "a", 
            "b"
        });
    end);
end;