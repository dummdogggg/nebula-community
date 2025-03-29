--[[
    Script: ReplicatedStorage.Packages.Freeze.List.zip.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.zip);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("matching lengths", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2 = v0(v1, {
            "x", 
            "y", 
            "z"
        });
        expect(v2).toEqual({
            {
                "a", 
                "x"
            }, 
            {
                "b", 
                "y"
            }, 
            {
                "c", 
                "z"
            }
        });
    end);
    it("mismatching lengths", function() --[[ Line: 12 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, {
            "x", 
            "y", 
            "z", 
            "W"
        });
        expect(v3).toEqual({
            {
                "a", 
                "x"
            }, 
            {
                "b", 
                "y"
            }, 
            {
                "c", 
                "z"
            }
        });
    end);
end;