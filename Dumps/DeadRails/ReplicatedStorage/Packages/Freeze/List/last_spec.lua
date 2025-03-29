--[[
    Script: ReplicatedStorage.Packages.Freeze.List.last.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.last);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("last", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1)).toEqual("c");
    end);
    it("default", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref)
        expect(v0({}, "default")).toEqual("default");
    end);
end;