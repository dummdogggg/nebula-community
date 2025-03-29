--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.merge.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.merge);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = 1, 
        b = 2, 
        c = 3
    };
    it("merge 2", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2 = v0(v1, {
            x = 4, 
            y = 5, 
            z = 6
        });
        expect(v2).toEqual({
            a = 1, 
            b = 2, 
            c = 3, 
            x = 4, 
            y = 5, 
            z = 6
        });
    end);
    it("merge 3 with overwrite", function() --[[ Line: 11 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, {
            x = 4
        }, {
            a = "test"
        });
        expect(v3).toEqual({
            a = "test", 
            b = 2, 
            c = 3, 
            x = 4
        });
    end);
end;