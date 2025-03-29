--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.removeValue.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.removeValue);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    it("removeValue 1", function() --[[ Line: 5 ]]
        -- upvalues: v0 (ref)
        local v1 = {
            a = 1, 
            b = 2, 
            c = 3
        };
        expect(v0(v1, 1)).toEqual({
            b = 2, 
            c = 3
        });
    end);
    it("removeValue 2", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref)
        local v2 = {
            a = 1, 
            b = 1, 
            c = 3
        };
        expect(v0(v2, 1)).toEqual({
            c = 3
        });
    end);
    it("removeValue 0, same id", function() --[[ Line: 15 ]]
        -- upvalues: v0 (ref)
        local v3 = {
            a = 1, 
            b = 2, 
            c = 3
        };
        expect(v0(v3, 0)).toBe(v3);
    end);
end;