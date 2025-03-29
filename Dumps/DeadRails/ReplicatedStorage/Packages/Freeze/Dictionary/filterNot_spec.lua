--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.filterNot.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.filterNot);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = 1, 
        b = 2, 
        c = 3, 
        d = 4
    };
    it("filterNot even", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, function(v2) --[[ Line: 7 ]]
            return v2 % 2 == 0;
        end);
        expect(v3).toEqual({
            a = 1, 
            c = 3
        });
    end);
    it("filterNot all", function() --[[ Line: 14 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v5 = v0(v1, function(_) --[[ Line: 15 ]]
            return false;
        end);
        expect(v5).toEqual({
            a = 1, 
            b = 2, 
            c = 3, 
            d = 4
        });
    end);
end;