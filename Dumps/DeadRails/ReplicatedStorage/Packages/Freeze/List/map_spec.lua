--[[
    Script: ReplicatedStorage.Packages.Freeze.List.map.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.map);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("map", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2 = v0(v1, string.upper);
        expect(v2).toEqual({
            "A", 
            "B", 
            "C"
        });
    end);
    it("map, filter", function() --[[ Line: 11 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v4 = v0(v1, function(v3) --[[ Line: 12 ]]
            if v3 == "c" then
                return nil;
            else
                return (string.upper(v3));
            end;
        end);
        expect(v4).toEqual({
            "A", 
            "B"
        });
    end);
    it("map, change type", function() --[[ Line: 19 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v6 = v0(v1, function(_) --[[ Line: 20 ]]
            return 1;
        end);
        expect(v6).toEqual({
            1, 
            1, 
            1
        });
    end);
end;