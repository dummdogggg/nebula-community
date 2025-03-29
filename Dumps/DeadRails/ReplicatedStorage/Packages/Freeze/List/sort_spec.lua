--[[
    Script: ReplicatedStorage.Packages.Freeze.List.sort.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.sort);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        4, 
        2, 
        3, 
        1
    };
    it("no arguments", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2 = v0(v1);
        expect(v2).toEqual({
            1, 
            2, 
            3, 
            4
        });
    end);
    it("custom predicate", function() --[[ Line: 11 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v5 = v0(v1, function(v3, v4) --[[ Line: 12 ]]
            return v4 < v3;
        end);
        expect(v5).toEqual({
            4, 
            3, 
            2, 
            1
        });
    end);
end;