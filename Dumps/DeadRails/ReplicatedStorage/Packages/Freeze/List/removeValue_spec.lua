--[[
    Script: ReplicatedStorage.Packages.Freeze.List.removeValue.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.removeValue);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        10, 
        20, 
        30
    };
    local v2 = {
        10, 
        20, 
        30, 
        10, 
        20, 
        30
    };
    it("removeValue", function() --[[ Line: 7 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, 20);
        expect(v3).toEqual({
            10, 
            30
        });
    end);
    it("removeValue not found, keeps identity", function() --[[ Line: 12 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v4 = v0(v1, 100);
        expect(v4).toBe(v1);
    end);
    it("removeValue for all repeated values", function() --[[ Line: 17 ]]
        -- upvalues: v0 (ref), v2 (copy)
        local v5 = v0(v2, 20);
        expect(v5).toEqual({
            10, 
            30, 
            10, 
            30
        });
    end);
    it("removeValue multiple values", function() --[[ Line: 22 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v6 = v0(v1, 20, 30);
        expect(v6).toEqual({
            10
        });
    end);
    it("removeValue multiple values, even if some arent there", function() --[[ Line: 27 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v7 = v0(v1, 20, 30, 40);
        expect(v7).toEqual({
            10
        });
    end);
    it("removeValue multiple values, multiple times", function() --[[ Line: 32 ]]
        -- upvalues: v0 (ref), v2 (copy)
        local v8 = v0(v2, 20, 30);
        expect(v8).toEqual({
            10, 
            10
        });
    end);
end;