--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.update.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.update);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = 1, 
        b = 2, 
        c = 3
    };
    it("should replace existing key", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, "a", function(v2) --[[ Line: 7 ]]
            assert(v2, "should exist");
            return v2 * 100;
        end);
        expect(v3).toEqual({
            a = 100, 
            b = 2, 
            c = 3
        });
    end);
    it("should pass nil to updater for nil key", function() --[[ Line: 15 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v4 = false;
        local _ = nil;
        local v7 = v0(v1, "d", function(_) --[[ Line: 17 ]]
            -- upvalues: v4 (ref)
            v4 = true;
            return 4;
        end);
        expect(v4).toEqual(true);
        expect(nil).toEqual(nil);
        expect(v7).toEqual({
            a = 1, 
            b = 2, 
            c = 3, 
            d = 4
        });
    end);
    it("should pass notSetValue to updater for nil key", function() --[[ Line: 27 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v9 = v0(v1, "d", function(v8) --[[ Line: 28 ]]
            assert(v8, "exists");
            return v8 * 100;
        end, 4);
        expect(v9).toEqual({
            a = 1, 
            b = 2, 
            c = 3, 
            d = 400
        });
    end);
end;