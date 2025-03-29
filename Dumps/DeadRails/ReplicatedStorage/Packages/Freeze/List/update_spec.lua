--[[
    Script: ReplicatedStorage.Packages.Freeze.List.update.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.update);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        "a", 
        "b", 
        "c"
    };
    it("should replace existing index", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, 1, function(v2) --[[ Line: 7 ]]
            assert(v2, "exists");
            return string.rep(v2, 5);
        end);
        expect(v3).toEqual({
            "aaaaa", 
            "b", 
            "c"
        });
    end);
    it("should pass nil to updater for nil index", function() --[[ Line: 15 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v4 = false;
        local _ = nil;
        local v7 = v0(v1, 4, function(_) --[[ Line: 17 ]]
            -- upvalues: v4 (ref)
            v4 = true;
            return "d";
        end);
        expect(v4).toEqual(true);
        expect(nil).toEqual(nil);
        expect(v7).toEqual({
            "a", 
            "b", 
            "c", 
            "d"
        });
    end);
    it("should pass notSetValue to updater for nil index", function() --[[ Line: 27 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v9 = v0(v1, 4, function(v8) --[[ Line: 28 ]]
            assert(v8, "exists");
            return string.rep(v8, 5);
        end, "d");
        expect(v9).toEqual({
            "a", 
            "b", 
            "c", 
            "ddddd"
        });
    end);
end;