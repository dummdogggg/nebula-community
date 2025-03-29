--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.map.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.map);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = 1, 
        b = 2, 
        c = 3
    };
    it("map", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v4 = v0(v1, function(v2, v3) --[[ Line: 7 ]]
            return v2 * 10, v3;
        end);
        expect(v4).toEqual({
            a = 10, 
            b = 20, 
            c = 30
        });
    end);
    it("change type", function() --[[ Line: 13 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v7 = v0(v1, function(v5, v6) --[[ Line: 14 ]]
            return tostring(v5), v6;
        end);
        expect(v7).toEqual({
            a = "1", 
            b = "2", 
            c = "3"
        });
    end);
    it("filters with nil", function() --[[ Line: 20 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v10 = v0(v1, function(v8, v9) --[[ Line: 21 ]]
            return if v8 == 2 then nil else v8, v9;
        end);
        expect(v10).toEqual({
            a = 1, 
            c = 3
        });
    end);
    it("convert list to dictionary", function() --[[ Line: 27 ]]
        -- upvalues: v0 (ref)
        local v12 = v0({
            "a", 
            "b", 
            "c"
        }, function(_) --[[ Line: 29 ]]
            return 0, "a";
        end);
        expect(v12).toEqual({
            a = 0
        });
    end);
end;