--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.getIn.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.getIn);
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
        expect(v2).toEqual("c");
    end);
    it("should return nil for non-existing index", function() --[[ Line: 11 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, {
            "a", 
            "b", 
            "c"
        });
        expect(v3).toEqual(nil);
    end);
    it("should return nil for non-existing index 2", function() --[[ Line: 16 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v4 = v0(v1, {
            "x", 
            "y", 
            "z"
        });
        expect(v4).toEqual(nil);
    end);
    it("should return default for non-existing index", function() --[[ Line: 21 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, {
            "d"
        }, "default")).toEqual("default");
    end);
end;