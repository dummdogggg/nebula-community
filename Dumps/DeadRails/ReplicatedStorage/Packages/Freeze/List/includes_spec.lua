--[[
    Script: ReplicatedStorage.Packages.Freeze.List.includes.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.includes);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("exists", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, "b")).toEqual(true);
    end);
    it("doesnt exist", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, "d")).toEqual(false);
    end);
end;