--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.mergeIn.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.mergeIn);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    it("mergeIn", function() --[[ Line: 5 ]]
        -- upvalues: v0 (ref)
        local v1 = {
            persons = {
                alice = {
                    age = 10
                }
            }
        };
        local v2 = v0(v1, {
            "persons", 
            "alice"
        }, {
            age = 11
        });
        expect(v2).toEqual({
            persons = {
                alice = {
                    age = 11
                }
            }
        });
    end);
end;