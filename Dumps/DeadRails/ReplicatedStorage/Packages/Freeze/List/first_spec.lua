--[[
    Script: ReplicatedStorage.Packages.Freeze.List.first.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.first);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("first", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1)).toEqual("a");
    end);
    it("default", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref)
        expect(v0({}, "default")).toEqual("default");
    end);
end;