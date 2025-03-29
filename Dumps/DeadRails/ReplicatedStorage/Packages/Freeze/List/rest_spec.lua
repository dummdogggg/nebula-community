--[[
    Script: ReplicatedStorage.Packages.Freeze.List.rest.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.rest);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("rest", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1)).toEqual({
            "b", 
            "c"
        });
    end);
end;