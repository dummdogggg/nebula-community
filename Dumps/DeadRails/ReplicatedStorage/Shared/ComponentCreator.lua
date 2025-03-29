--[[
    Script: ReplicatedStorage.Shared.ComponentCreator
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CollectionService_0 = game:GetService("CollectionService");
local v2 = require(l_ReplicatedStorage_0.Packages.Signal);
local v3 = require(l_ReplicatedStorage_0.Shared.Connections);
local _ = require(l_ReplicatedStorage_0.Shared.SharedConstants.CollectionServiceTag.TagEnumType);
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7, ...) --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy)
    local v8 = {
        tag = v6, 
        wrapperClass = v7, 
        _connections = v3.new(), 
        _wrappersByInstance = {}, 
        _wrapperParameters = table.pack(...), 
        objectAdded = v2.new()
    };
    setmetatable(v8, v5);
    return v8;
end;
v5.listen = function(v9) --[[ Line: 59 ]] --[[ Name: listen ]]
    -- upvalues: l_CollectionService_0 (copy)
    local l_l_CollectionService_0_Tagged_0 = l_CollectionService_0:GetTagged(v9.tag);
    for _, v12 in ipairs(l_l_CollectionService_0_Tagged_0) do
        v9:_wrapInstance(v12);
    end;
    local v14 = l_CollectionService_0:GetInstanceAddedSignal(v9.tag):Connect(function(v13) --[[ Line: 68 ]]
        -- upvalues: v9 (copy)
        v9:_wrapInstance(v13);
        v9.objectAdded:Fire(v9._wrappersByInstance[v13]);
    end);
    local v16 = l_CollectionService_0:GetInstanceRemovedSignal(v9.tag):Connect(function(v15) --[[ Line: 74 ]]
        -- upvalues: v9 (copy)
        v9:_unwrapInstance(v15);
    end);
    v9._connections:add(v14, v16);
end;
v5.getComponentFromInstance = function(v17, v18) --[[ Line: 81 ]] --[[ Name: getComponentFromInstance ]]
    return v17._wrappersByInstance[v18];
end;
v5._wrapInstance = function(v19, v20) --[[ Line: 86 ]] --[[ Name: _wrapInstance ]]
    v19._wrappersByInstance[v20] = v19.wrapperClass.new(v20, table.unpack(v19._wrapperParameters));
end;
v5._unwrapInstance = function(v21, v22) --[[ Line: 90 ]] --[[ Name: _unwrapInstance ]]
    local v23 = v21._wrappersByInstance[v22];
    v21._wrappersByInstance[v22] = nil;
    if v23.destroy then
        v23:destroy();
    end;
end;
v5.destroy = function(v24) --[[ Line: 99 ]] --[[ Name: destroy ]]
    v24._connections:disconnect();
    for _, v26 in pairs(v24._wrappersByInstance) do
        v26:destroy();
    end;
    v24.objectAdded:DisconnectAll();
end;
return v5;