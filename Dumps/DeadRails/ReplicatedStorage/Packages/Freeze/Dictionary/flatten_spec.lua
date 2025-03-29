--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.flatten.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.flatten);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        foo = 1, 
        foobar = {
            bar = 2, 
            baz = {
                etc = 3
            }
        }
    };
    it("flatten", function() --[[ Line: 15 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v2 = v0(v1);
        expect(v2).toEqual({
            foo = 1, 
            bar = 2, 
            etc = 3
        });
    end);
    it("flatten with depth", function() --[[ Line: 21 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, 1);
        expect(v3).toEqual({
            foo = 1, 
            bar = 2, 
            baz = {
                etc = 3
            }
        });
    end);
end;