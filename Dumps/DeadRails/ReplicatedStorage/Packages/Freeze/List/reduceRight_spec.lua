--[[
    Script: ReplicatedStorage.Packages.Freeze.List.reduceRight.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.reduceRight);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        10, 
        20, 
        30
    };
    it("reduceRight", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v4 = v0(v1, function(v2, v3) --[[ Line: 7 ]]
            return v2 + v3;
        end, 0);
        expect(v4).toEqual(60);
    end);
    it("order right to left", function() --[[ Line: 14 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v7 = v0(v1, function(v5, v6) --[[ Line: 15 ]]
            return v5 .. tostring(v6);
        end, "");
        expect(v7).toEqual("302010");
    end);
end;