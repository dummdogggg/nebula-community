--[[
    Script: ReplicatedStorage.Packages.Freeze.List.pop.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.pop);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        10, 
        20, 
        30
    };
    it("pop, default", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2 = v0(v1);
        expect(v2).toEqual({
            10, 
            20
        });
    end);
    it("pop, 2", function() --[[ Line: 11 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, 2);
        expect(v3).toEqual({
            10
        });
    end);
    it("pop, empty", function() --[[ Line: 16 ]]
        -- upvalues: v0 (ref)
        local v4 = v0({});
        expect(v4).toEqual({});
    end);
end;