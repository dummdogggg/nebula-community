--[[
    Script: ReplicatedStorage.Packages.Freeze.List.insert.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.insert);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("should insert 1 value", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, 2, "d")).toEqual({
            "a", 
            "d", 
            "b", 
            "c"
        });
    end);
    it("should insert multiple values", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref)
        local v2 = v0({
            "a", 
            "b", 
            "c"
        }, 2, "X", "Y", "Z");
        expect(v2).toEqual({
            "a", 
            "X", 
            "Y", 
            "Z", 
            "b", 
            "c"
        });
    end);
    it("should insert and clamp 1 value out of bounds positive", function() --[[ Line: 15 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, 100, "d");
        expect(v3).toEqual({
            "a", 
            "b", 
            "c", 
            "d"
        });
    end);
    it("should insert and clamp 1 value out of bounds negative", function() --[[ Line: 20 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v4 = v0(v1, -100, "d");
        expect(v4).toEqual({
            "d", 
            "a", 
            "b", 
            "c"
        });
    end);
end;