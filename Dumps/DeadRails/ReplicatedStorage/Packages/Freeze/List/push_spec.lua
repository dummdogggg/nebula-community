--[[
    Script: ReplicatedStorage.Packages.Freeze.List.push.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.push);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        10, 
        20
    };
    it("push, 1", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2 = v0(v1, 30);
        expect(v2).toEqual({
            10, 
            20, 
            30
        });
    end);
    it("push, 2", function() --[[ Line: 11 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, 30, 40);
        expect(v3).toEqual({
            10, 
            20, 
            30, 
            40
        });
    end);
    it("push, 0", function() --[[ Line: 16 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v4 = v0(v1);
        expect(v4).toBe(v1);
    end);
end;