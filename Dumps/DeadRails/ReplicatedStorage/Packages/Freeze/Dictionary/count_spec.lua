--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.count.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.count);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = 1, 
        b = 2, 
        c = 3
    };
    it("count", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1)).toEqual(3);
    end);
    it("predicate", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, function(v2) --[[ Line: 11 ]]
            return v2 == 2;
        end)).toEqual(1);
    end);
end;