--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.every.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.every);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = 1, 
        b = 2, 
        c = 3
    };
    it("match", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, function(v2) --[[ Line: 7 ]]
            return type(v2) == "number";
        end)).toEqual(true);
    end);
    it("no match", function() --[[ Line: 12 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, function(_) --[[ Line: 13 ]]
            return false;
        end)).toEqual(false);
    end);
end;