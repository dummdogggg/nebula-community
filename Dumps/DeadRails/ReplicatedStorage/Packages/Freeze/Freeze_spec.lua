--[[
    Script: ReplicatedStorage.Packages.Freeze.Freeze.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    it("handle multiple operations", function() --[[ Line: 5 ]]
        -- upvalues: v0 (ref)
        local v1 = v0.List.push({
            "a", 
            "b"
        }, "c");
        local v3 = v0.List.map(v1, function(v2) --[[ Line: 8 ]]
            return string.upper(v2);
        end);
        expect(v3).toEqual({
            "A", 
            "B", 
            "C"
        });
    end);
    it("deprecation warning", function() --[[ Line: 14 ]]
        -- upvalues: v0 (ref)
        local v4 = {
            a = 1, 
            b = 2, 
            c = 3
        };
        local v5 = v0.Dictionary.removeKeys(v4, "b", "c");
        expect(v5).toEqual({
            a = 1
        });
        v5 = v0.List.append({
            "a", 
            "b", 
            "c"
        }, "b", "c");
        expect(v5).toEqual({
            "a", 
            "b", 
            "c", 
            "b", 
            "c"
        });
    end);
end;