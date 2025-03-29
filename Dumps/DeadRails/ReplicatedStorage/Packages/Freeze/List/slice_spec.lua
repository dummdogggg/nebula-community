--[[
    Script: ReplicatedStorage.Packages.Freeze.List.slice.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.slice);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("no arguments", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2 = v0(v1);
        expect(v2).toBe(v1);
    end);
    it("positive from", function() --[[ Line: 11 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, 2);
        expect(v3).toEqual({
            "b", 
            "c"
        });
    end);
    it("negative from", function() --[[ Line: 16 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v4 = v0(v1, -1);
        expect(v4).toEqual({
            "c"
        });
    end);
    it("negative to", function() --[[ Line: 21 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v5 = v0(v1, 1, -1);
        expect(v5).toEqual({
            "a", 
            "b"
        });
    end);
end;