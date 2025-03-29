--[[
    Script: ReplicatedStorage.Packages.Freeze.init.spec
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local v0 = require(script.Parent.utils.equalsDeep);
local function v1(v2) --[[ Line: 3 ]] --[[ Name: toString ]]
    -- upvalues: v1 (copy)
    if type(v2) == "table" then
        local v3 = {};
        for v4, v5 in pairs(v2) do
            table.insert(v3, if type(v4) == "number" then v1(v5) else v1(v4) .. "=" .. v1(v5));
        end;
        return "{" .. table.concat(v3, ", ") .. "}";
    else
        return (tostring(v2));
    end;
end;
return function() --[[ Line: 16 ]]
    -- upvalues: v0 (copy), v1 (copy)
    beforeAll(function() --[[ Line: 17 ]]
        -- upvalues: v0 (ref), v1 (ref)
        expect.extend({
            toEqual = function(v6, v7) --[[ Line: 19 ]] --[[ Name: toEqual ]]
                -- upvalues: v0 (ref), v1 (ref)
                if v6 == v7 then
                    return {
                        pass = true, 
                        message = "Expected to not equal"
                    };
                elseif v0(v6, v7) then
                    return {
                        pass = true, 
                        message = "Expected to not equal"
                    };
                else
                    return {
                        pass = false, 
                        message = string.format("Does not equal.\n\t\tGot:      %q\n\t\tExpected: %q\n\n", v1(v6), (v1(v7)))
                    };
                end;
            end, 
            toBe = function(v8, v9) --[[ Line: 44 ]] --[[ Name: toBe ]]
                -- upvalues: v1 (ref)
                return {
                    pass = v8 == v9, 
                    message = string.format("Does not equal.\n\t\tGot:      %q\n\t\tExpected: %q\n\n", v1(v8), (v1(v9)))
                };
            end
        });
    end);
end;