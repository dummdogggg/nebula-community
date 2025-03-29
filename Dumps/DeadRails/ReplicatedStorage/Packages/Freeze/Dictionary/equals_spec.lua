--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.equals.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.equals);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = 1, 
        b = 2, 
        c = 3
    };
    it("match reference", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, v1)).toEqual(true);
    end);
    it("match value", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, {
            a = 1, 
            b = 2, 
            c = 3
        })).toEqual(true);
    end);
    it("empty", function() --[[ Line: 14 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, {})).toEqual(false);
    end);
    it("no match", function() --[[ Line: 18 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, {
            a = 1, 
            b = 3
        })).toEqual(false);
    end);
end;