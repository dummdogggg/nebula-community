--[[
    Script: ReplicatedStorage.Packages.Satchel.Packages._Index.roblox_testez@0.4.1.testez.Context
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return {
    new = function(v0) --[[ Line: 7 ]] --[[ Name: new ]]
        local v1 = {};
        local v2 = {};
        v1.__index = v2;
        if v0 then
            for v3, v4 in pairs(getmetatable(v0).__index) do
                v2[v3] = v4;
            end;
        end;
        v1.__newindex = function(_, v6, v7) --[[ Line: 18 ]] --[[ Name: __newindex ]]
            -- upvalues: v2 (copy)
            assert(v2[v6] == nil, string.format("Cannot reassign %s in context", (tostring(v6))));
            v2[v6] = v7;
        end;
        return (setmetatable({}, v1));
    end
};