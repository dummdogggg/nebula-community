--[[
    Script: ReplicatedStorage.Packages.Freeze.Dictionary.removeIn.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_removeIn_0 = require(script.Parent:FindFirstChild("removeIn"));
return function() --[[ Line: 4 ]]
    -- upvalues: l_removeIn_0 (copy)
    local v1 = {
        a = {
            b = {
                "c"
            }
        }
    };
    it("removeIn 1", function() --[[ Line: 6 ]]
        -- upvalues: l_removeIn_0 (ref), v1 (copy)
        expect(l_removeIn_0(v1, {
            "a"
        })).toEqual({});
    end);
    it("removeIn 2", function() --[[ Line: 10 ]]
        -- upvalues: l_removeIn_0 (ref), v1 (copy)
        expect(l_removeIn_0(v1, {
            "a", 
            "b"
        })).toEqual({
            a = {}
        });
    end);
    it("removeIn 3", function() --[[ Line: 14 ]]
        -- upvalues: l_removeIn_0 (ref), v1 (copy)
        expect(l_removeIn_0(v1, {
            "a", 
            "b", 
            "c"
        })).toEqual({
            a = {
                b = {
                    "c"
                }
            }
        });
    end);
    it("removeIn 4", function() --[[ Line: 18 ]]
        -- upvalues: l_removeIn_0 (ref), v1 (copy)
        expect(l_removeIn_0(v1, {
            "x", 
            "y", 
            "z"
        })).toEqual({
            a = {
                b = {
                    "c"
                }
            }, 
            x = {
                y = {}
            }
        });
    end);
end;