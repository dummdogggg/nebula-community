--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.remove.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_remove_0 = require(script.Parent:FindFirstChild("remove"));
return function() --[[ Line: 4 ]]
    -- upvalues: l_remove_0 (copy)
    local v1 = {
        a = 1, 
        b = 2, 
        c = 3
    };
    it("remove 1", function() --[[ Line: 6 ]]
        -- upvalues: l_remove_0 (ref), v1 (copy)
        expect(l_remove_0(v1, "a")).toEqual({
            b = 2, 
            c = 3
        });
    end);
    it("remove 2", function() --[[ Line: 10 ]]
        -- upvalues: l_remove_0 (ref), v1 (copy)
        expect(l_remove_0(v1, "a", "b")).toEqual({
            c = 3
        });
    end);
    it("remove missing key, same id", function() --[[ Line: 14 ]]
        -- upvalues: l_remove_0 (ref), v1 (copy)
        local v2 = l_remove_0(v1, "z");
        expect(v2).toBe(v2);
    end);
end;