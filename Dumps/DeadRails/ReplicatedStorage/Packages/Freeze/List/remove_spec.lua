--[[
    Script: ReplicatedStorage.Packages.Freeze.List.remove.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_remove_0 = require(script.Parent:FindFirstChild("remove"));
return function() --[[ Line: 4 ]]
    -- upvalues: l_remove_0 (copy)
    local v1 = {
        10, 
        20, 
        30
    };
    it("remove", function() --[[ Line: 6 ]]
        -- upvalues: l_remove_0 (ref), v1 (copy)
        local v2 = l_remove_0(v1, 2);
        expect(v2).toEqual({
            10, 
            30
        });
    end);
    it("remove from end", function() --[[ Line: 11 ]]
        -- upvalues: l_remove_0 (ref), v1 (copy)
        local v3 = l_remove_0(v1, -1);
        expect(v3).toEqual({
            10, 
            20
        });
    end);
    it("remove from end 2", function() --[[ Line: 16 ]]
        -- upvalues: l_remove_0 (ref), v1 (copy)
        local v4 = l_remove_0(v1, -3);
        expect(v4).toEqual({
            20, 
            30
        });
    end);
    it("remove out of bounds, same id", function() --[[ Line: 21 ]]
        -- upvalues: l_remove_0 (ref), v1 (copy)
        local v5 = l_remove_0(v1, 4);
        expect(v5).toBe(v1);
    end);
    it("remove multiple indicies", function() --[[ Line: 26 ]]
        -- upvalues: l_remove_0 (ref), v1 (copy)
        local v6 = l_remove_0(v1, 1, 2);
        expect(v6).toEqual({
            30
        });
    end);
    it("remove multiple negative indicies, preserves order", function() --[[ Line: 31 ]]
        -- upvalues: l_remove_0 (ref)
        local v7 = l_remove_0({
            1, 
            2, 
            3, 
            4, 
            5, 
            6, 
            7, 
            8
        }, 8, -1);
        expect(v7).toEqual({
            1, 
            2, 
            3, 
            4, 
            5, 
            6, 
            7
        });
    end);
    it("remove multiple indicies, same id if no match", function() --[[ Line: 37 ]]
        -- upvalues: l_remove_0 (ref)
        local v8 = {
            1, 
            2, 
            3, 
            4, 
            5, 
            6, 
            7, 
            8
        };
        local v9 = l_remove_0(v8, 100, 200, -100);
        expect(v9).toBe(v8);
    end);
end;