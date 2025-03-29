--[[
    Script: ReplicatedStorage.Packages.Freeze.List.concat.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.concat);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("concat 2 values", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2 = v0(v1, {
            "x", 
            "y", 
            "z"
        });
        expect(v2).toEqual({
            "a", 
            "b", 
            "c", 
            "x", 
            "y", 
            "z"
        });
    end);
    it("concat 3 values", function() --[[ Line: 11 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, {
            "x", 
            "y", 
            "z"
        }, v1);
        expect(v3).toEqual({
            "a", 
            "b", 
            "c", 
            "x", 
            "y", 
            "z", 
            "a", 
            "b", 
            "c"
        });
    end);
    it("concat 1 value", function() --[[ Line: 16 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v4 = v0(v1);
        expect(v4).toEqual({
            "a", 
            "b", 
            "c"
        });
    end);
    it("handle nil", function() --[[ Line: 21 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v5 = v0(v1, nil, {
            "x", 
            "y", 
            "z"
        });
        expect(v5).toEqual({
            "a", 
            "b", 
            "c", 
            "x", 
            "y", 
            "z"
        });
    end);
    it("handle empty table", function() --[[ Line: 27 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v6 = v0(v1, {}, {
            "x", 
            "y", 
            "z"
        });
        expect(v6).toEqual({
            "a", 
            "b", 
            "c", 
            "x", 
            "y", 
            "z"
        });
    end);
    it("handle objects", function() --[[ Line: 32 ]]
        -- upvalues: v0 (ref)
        local v7 = {
            {
                age = 0
            }
        };
        local v8 = {
            {
                age = 100
            }
        };
        local v9 = v0(v7, v8);
        expect(v9).toEqual({
            {
                age = 0
            }, 
            {
                age = 100
            }
        });
    end);
end;