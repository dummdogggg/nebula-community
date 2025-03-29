--[[
    Script: ReplicatedStorage.Packages.Freeze.List.merge.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.merge);
local v1 = require(script.Parent.Parent.None);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy), v1 (copy)
    it("merge 2", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref)
        local v2 = v0({
            "a", 
            nil, 
            "c"
        }, {
            nil, 
            "b", 
            "C"
        });
        expect(v2).toEqual({
            "a", 
            "b", 
            "C"
        });
    end);
    it("merge 3, with none", function() --[[ Line: 14 ]]
        -- upvalues: v0 (ref), v1 (ref)
        local v3 = v0({
            "a", 
            "b", 
            "c"
        }, {
            "x"
        }, {
            nil, 
            "y", 
            v1
        });
        expect(v3).toEqual({
            "x", 
            "y"
        });
    end);
end;