--[[
    Script: ReplicatedStorage.Packages.Freeze.List.filterNot.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.filterNot);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        1, 
        2, 
        3, 
        4
    };
    it("filterNot even", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, function(v2) --[[ Line: 7 ]]
            return v2 % 2 == 0;
        end)).toEqual({
            1, 
            3
        });
    end);
end;