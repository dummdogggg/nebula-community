--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.joinAsString.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.joinAsString);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = 1
    };
    it("joinAsString", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1)).toEqual("a=1");
    end);
    it("empty", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref)
        expect(v0({})).toEqual("");
    end);
end;