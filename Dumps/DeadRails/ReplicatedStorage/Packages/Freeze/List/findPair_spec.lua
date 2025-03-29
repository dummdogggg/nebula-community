--[[
    Script: ReplicatedStorage.Packages.Freeze.List.findPair.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.findPair);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "B", 
        "c"
    };
    it("findPair match", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3, v4 = v0(v1, function(v2) --[[ Line: 7 ]]
            return string.upper(v2) == v2;
        end);
        expect(v3).toEqual(2);
        expect(v4).toEqual("B");
    end);
    it("findPair no match", function() --[[ Line: 15 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v6, v7 = v0(v1, function(v5) --[[ Line: 16 ]]
            return v5 == "d";
        end);
        expect(v6).toEqual(nil);
        expect(v7).toEqual(nil);
    end);
end;