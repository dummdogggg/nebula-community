--[[
    Script: ReplicatedStorage.Packages.Freeze.List.findIndex.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.findIndex);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "B", 
        "c"
    };
    it("findIndex match", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, function(v2) --[[ Line: 7 ]]
            return string.upper(v2) == v2;
        end);
        expect(v3).toEqual(2);
    end);
    it("findIndex no match", function() --[[ Line: 14 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v5 = v0(v1, function(v4) --[[ Line: 15 ]]
            return v4 == "d";
        end);
        expect(v5).toEqual(nil);
    end);
end;