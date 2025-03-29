--[[
    Script: ReplicatedStorage.Shared.Connections
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Packages.Signal);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v3 = {
        _connections = {}
    };
    setmetatable(v3, v2);
    return v3;
end;
v2.add = function(v4, ...) --[[ Line: 34 ]] --[[ Name: add ]]
    for _, v6 in {
        ...
    } do
        assert(not table.find(v4._connections, v6), "This connection has already been added");
        table.insert(v4._connections, v6);
    end;
end;
v2.remove = function(v7, v8) --[[ Line: 41 ]] --[[ Name: remove ]]
    local v9 = table.find(v7._connections, v8);
    if v9 then
        table.remove(v7._connections, v9);
    end;
end;
v2.disconnect = function(v10) --[[ Line: 48 ]] --[[ Name: disconnect ]]
    for _, v12 in v10._connections do
        v12:Disconnect();
    end;
    v10._connections = {};
end;
return v2;