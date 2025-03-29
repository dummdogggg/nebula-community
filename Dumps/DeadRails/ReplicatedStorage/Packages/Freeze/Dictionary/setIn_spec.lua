--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.setIn.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.setIn);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    local v1 = {
        a = {
            b = {
                "c"
            }
        }
    };
    it("setIn 1", function() --[[ Line: 6 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, {
            "a"
        }, "test")).toEqual({
            a = "test"
        });
    end);
    it("setIn 2", function() --[[ Line: 10 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, {
            "a", 
            "b"
        }, "test")).toEqual({
            a = {
                b = "test"
            }
        });
    end);
    it("setIn 3", function() --[[ Line: 14 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, {
            "a", 
            "b", 
            "c"
        }, "test")).toEqual({
            a = {
                b = {
                    "c"; 
                    c = "test"
                }
            }
        });
    end);
    it("setIn 4", function() --[[ Line: 18 ]]
        -- upvalues: v0 (ref), v1 (copy)
        expect(v0(v1, {
            "x", 
            "y", 
            "z"
        }, "test")).toEqual({
            a = {
                b = {
                    "c"
                }
            }, 
            x = {
                y = {
                    z = "test"
                }
            }
        });
    end);
    it("age", function() --[[ Line: 22 ]]
        -- upvalues: v0 (ref)
        local v2 = {
            persons = {
                alice = {
                    age = 10
                }
            }
        };
        local v3 = v0(v2, {
            "persons", 
            "alice", 
            "age"
        }, 11);
        expect(v3).toEqual({
            persons = {
                alice = {
                    age = 11
                }
            }
        });
    end);
end;