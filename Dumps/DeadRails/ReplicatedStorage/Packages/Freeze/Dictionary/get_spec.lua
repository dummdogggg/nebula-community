--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.get.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.get);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = 1, 
        b = 2, 
        c = 3
    };
    it("should find existing index", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2 = v0(v1, "a");
        expect(v2).toEqual(1);
    end);
    it("should return nil for non-existing index", function() --[[ Line: 11 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, "d")).toEqual(nil);
    end);
    it("should return default for non-existing index", function() --[[ Line: 15 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, "d", 4)).toEqual(4);
    end);
end;