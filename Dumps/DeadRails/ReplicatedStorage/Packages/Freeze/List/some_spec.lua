--[[
    Script: ReplicatedStorage.Packages.Freeze.List.some.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.some);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        1, 
        2, 
        3
    };
    it("match all", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, function(_) --[[ Line: 7 ]]
            return true;
        end)).toEqual(true);
    end);
    it("no match", function() --[[ Line: 12 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, function(_) --[[ Line: 13 ]]
            return false;
        end)).toEqual(false);
    end);
    it("one match", function() --[[ Line: 18 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, function(v4) --[[ Line: 19 ]]
            return v4 == 2;
        end)).toEqual(true);
    end);
end;