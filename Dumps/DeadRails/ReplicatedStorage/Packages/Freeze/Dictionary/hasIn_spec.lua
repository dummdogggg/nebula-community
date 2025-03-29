--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.hasIn.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.hasIn);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = {
            b = "c"
        }
    };
    it("should find existing index", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2 = v0(v1, {
            "a", 
            "b"
        });
        expect(v2).toEqual(true);
    end);
    it("should return false for non-existing index", function() --[[ Line: 11 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, {
            "d"
        })).toEqual(false);
    end);
end;