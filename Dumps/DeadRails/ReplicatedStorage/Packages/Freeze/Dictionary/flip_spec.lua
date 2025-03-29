--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.flip.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.flip);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = "A", 
        b = "B", 
        c = "C"
    };
    it("flip match", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2 = v0(v1);
        expect(v2).toEqual({
            A = "a", 
            B = "b", 
            C = "c"
        });
    end);
end;