--[[
    Script: ReplicatedStorage.Packages.Freeze.List.every.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.every);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("match", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, function(v2) --[[ Line: 7 ]]
            return type(v2) == "string";
        end)).toEqual(true);
    end);
    it("no match", function() --[[ Line: 12 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, function(v3) --[[ Line: 13 ]]
            return v3 == "b";
        end)).toEqual(false);
    end);
    it("none match", function() --[[ Line: 18 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, function(v4) --[[ Line: 19 ]]
            return v4 == string.upper(v4);
        end)).toEqual(false);
    end);
end;