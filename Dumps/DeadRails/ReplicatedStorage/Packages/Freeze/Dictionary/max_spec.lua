--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.max.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.max);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = 1, 
        b = 2, 
        c = 3
    };
    it("default comparator", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2, v3 = v0(v1);
        expect(v3).toEqual("c");
        expect(v2).toEqual(3);
    end);
    it("max, object", function() --[[ Line: 12 ]]
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
        local v7 = {
            alice = v4, 
            bertram = v5, 
            charlie = v6
        };
        local v10, v11 = v0(v7, function(v8, v9) --[[ Line: 19 ]]
            return v8.age > v9.age;
        end);
        expect(v11).toEqual("charlie");
        expect(v10).toEqual(v6);
    end);
    it("max, empty", function() --[[ Line: 27 ]]
        -- upvalues: v0 (ref)
        local v12, v13 = v0({});
        expect(v12).toEqual(nil);
        expect(v13).toEqual(nil);
    end);
end;