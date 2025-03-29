--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.findKey.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.findKey);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = 1, 
        b = 2, 
        c = 3
    };
    it("findKey match", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, function(v2) --[[ Line: 7 ]]
            return v2 % 2 == 0;
        end);
        expect(v3).toEqual("b");
    end);
    it("findKey no match", function() --[[ Line: 14 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v5 = v0(v1, function(v4) --[[ Line: 15 ]]
            return v4 == 4;
        end);
        expect(v5).toEqual(nil);
    end);
    it("findKey no match, default", function() --[[ Line: 22 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v7 = v0(v1, function(v6) --[[ Line: 23 ]]
            return v6 == 4;
        end, "d");
        expect(v7).toEqual("d");
    end);
end;