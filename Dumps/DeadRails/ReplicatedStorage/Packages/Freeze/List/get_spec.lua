--[[
    Script: ReplicatedStorage.Packages.Freeze.List.get.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.get);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("should find existing index", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, 1)).toEqual("a");
    end);
    it("should return nil for non-existing index", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, 4)).toEqual(nil);
    end);
    it("should return default for non-existing index", function() --[[ Line: 14 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, 4, "d")).toEqual("d");
    end);
    it("should handle negative index", function() --[[ Line: 18 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, -1)).toEqual("c");
    end);
    it("should handle negative index out of bounds", function() --[[ Line: 22 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, -100)).toEqual(nil);
    end);
end;