--[[
    Script: ReplicatedStorage.Packages.Freeze.List.forEach.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.forEach);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        1, 
        2, 
        3, 
        4
    };
    it("forEach break", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, function(v2) --[[ Line: 7 ]]
            return v2 < 2;
        end);
        expect(v3).toEqual(2);
    end);
    it("forEach no match", function() --[[ Line: 14 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v5 = v0(v1, function(_) --[[ Line: 15 ]]
            return false;
        end);
        expect(v5).toEqual(1);
    end);
    it("forEach all match", function() --[[ Line: 22 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v7 = v0(v1, function(_) --[[ Line: 23 ]]
            return true;
        end);
        expect(v7).toEqual(4);
    end);
end;