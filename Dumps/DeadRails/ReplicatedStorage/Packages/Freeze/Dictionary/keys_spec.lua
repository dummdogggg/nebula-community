--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.keys.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.keys);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = 1
    };
    it("keys", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1)).toEqual({
            "a"
        });
    end);
end;