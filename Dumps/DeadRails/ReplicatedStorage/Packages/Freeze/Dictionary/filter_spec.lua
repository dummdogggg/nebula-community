--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.filter.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.filter);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = 1, 
        b = 2, 
        c = 3, 
        d = 4
    };
    it("filter even", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, function(v2) --[[ Line: 7 ]]
            return v2 % 2 == 0;
        end);
        expect(v3).toEqual({
            b = 2, 
            d = 4
        });
    end);
    it("filter all", function() --[[ Line: 14 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v5 = v0(v1, function(_) --[[ Line: 15 ]]
            return false;
        end);
        expect(v5).toEqual({});
    end);
end;