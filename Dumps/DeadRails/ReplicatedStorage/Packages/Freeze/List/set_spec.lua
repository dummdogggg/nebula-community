--[[
    Script: ReplicatedStorage.Packages.Freeze.List.set.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.set);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("should replace existing index", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, 1, "A")).toEqual({
            "A", 
            "b", 
            "c"
        });
    end);
    it("should add new index", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, 4, "D")).toEqual({
            "a", 
            "b", 
            "c", 
            "D"
        });
    end);
    it("should add new index out of bounds", function() --[[ Line: 14 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, 6, "D")).toEqual({
            "a", 
            "b", 
            "c", 
            nil, 
            nil, 
            "D"
        });
    end);
end;