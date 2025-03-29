--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.updateIn.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.updateIn);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        persons = {
            alice = {
                age = 10
            }
        }
    };
    it("should replace existing key", function() --[[ Line: 14 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v1, {
            "persons", 
            "alice", 
            "age"
        }, function(v2) --[[ Line: 15 ]]
            assert(v2, "will exist");
            return v2 + 1;
        end);
        expect(v3).toEqual({
            persons = {
                alice = {
                    age = 11
                }
            }
        });
    end);
    it("should pass nil to updater for nil key", function() --[[ Line: 23 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v4 = false;
        local _ = nil;
        local v7 = v0(v1, {
            "persons", 
            "alice", 
            "age"
        }, function(_) --[[ Line: 25 ]]
            -- upvalues: v4 (ref)
            v4 = true;
            return 4;
        end);
        expect(v4).toEqual(true);
        expect(nil).toEqual(nil);
        expect(v7).toEqual({
            persons = {
                alice = {
                    age = 4
                }
            }
        });
    end);
    it("should pass notSetValue to updater for nil key", function() --[[ Line: 35 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v9 = v0(v1, {
            "persons", 
            "alice", 
            "test"
        }, function(v8) --[[ Line: 36 ]]
            assert(v8, "exists");
            return v8 + 1;
        end, 4);
        expect(v9).toEqual({
            persons = {
                alice = {
                    age = 10, 
                    test = 5
                }
            }
        });
    end);
end;