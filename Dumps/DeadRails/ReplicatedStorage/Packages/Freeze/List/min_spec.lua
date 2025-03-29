--[[
    Script: ReplicatedStorage.Packages.Freeze.List.min.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.min);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        10, 
        -200, 
        30
    };
    it("min, default", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2, v3 = v0(v1);
        expect(v2).toEqual(-200);
        expect(v3).toEqual(2);
    end);
    it("min, object", function() --[[ Line: 12 ]]
        -- upvalues: v0 (ref)
        local v4 = {
            age = 5
        };
        local v5 = {
            age = 15
        };
        local v6 = {
            age = 25
        };
        local v9 = v0({
            v4, 
            v5, 
            v6
        }, function(v7, v8) --[[ Line: 17 ]]
            return v7.age > v8.age;
        end);
        expect(v9).toEqual(v4);
    end);
    it("min, empty", function() --[[ Line: 24 ]]
        -- upvalues: v0 (ref)
        local v10, v11 = v0({});
        expect(v10).toEqual(nil);
        expect(v11).toEqual(nil);
    end);
end;