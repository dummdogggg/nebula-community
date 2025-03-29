--[[
    Script: ReplicatedStorage.Packages.Freeze.List.flatten.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.flatten);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    it("flatten, no depth, no change", function() --[[ Line: 5 ]]
        -- upvalues: v0 (ref)
        local v1 = v0({
            "a", 
            "B", 
            "c"
        });
        expect(v1).toEqual({
            "a", 
            "B", 
            "c"
        });
    end);
    it("flatten, depth of 1", function() --[[ Line: 11 ]]
        -- upvalues: v0 (ref)
        local v2 = v0({
            "foo", 
            {
                "bar", 
                "baz"
            }, 
            {
                "bar", 
                "baz"
            }, 
            "quz"
        });
        expect(v2).toEqual({
            "foo", 
            "bar", 
            "baz", 
            "bar", 
            "baz", 
            "quz"
        });
    end);
    local v3 = {
        "foo", 
        {
            "bar", 
            "baz", 
            {
                "bar", 
                "baz"
            }
        }, 
        "quz"
    };
    it("flatten, depth of 2", function() --[[ Line: 41 ]]
        -- upvalues: v0 (ref), v3 (copy)
        local v4 = v0(v3);
        expect(v4).toEqual({
            "foo", 
            "bar", 
            "baz", 
            "bar", 
            "baz", 
            "quz"
        });
    end);
    it("flatten, depth of 2, limit 1", function() --[[ Line: 46 ]]
        -- upvalues: v0 (ref), v3 (copy)
        local v5 = v0(v3, 1);
        expect(v5).toEqual({
            "foo", 
            "bar", 
            "baz", 
            {
                "bar", 
                "baz"
            }, 
            "quz"
        });
    end);
end;