--[[
    Script: ReplicatedStorage.Client.LocalPlayerObjectsContainer
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_ReplicatedStorage_0.Packages.CharacterLoadedWrapper);
local v3 = require(l_ReplicatedStorage_0.Shared.PlayerClassData);
local v4 = require(l_ReplicatedStorage_0.Client.Controllers.PlayerDataController);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v6 = {
    _objects = {}
};
v6.registerLocalPlayer = function() --[[ Line: 28 ]] --[[ Name: registerLocalPlayer ]]
    -- upvalues: v4 (copy), v6 (copy), v2 (copy), l_LocalPlayer_0 (copy), v3 (copy)
    local l_Data_0 = v4.getPlayerDataReplica().Data;
    v6._objects = {
        _characterLoadedWrapper = v2.new(l_LocalPlayer_0), 
        _playerClassData = v3.new(l_Data_0.currentClass, l_Data_0.classData)
    };
end;
v6.waitForRegisteredAsync = function() --[[ Line: 37 ]] --[[ Name: waitForRegisteredAsync ]]
    -- upvalues: v6 (copy)
    while not next(v6._objects) do
        task.wait();
    end;
end;
v6.getCharacterLoadedWrapper = function() --[[ Line: 43 ]] --[[ Name: getCharacterLoadedWrapper ]]
    -- upvalues: v6 (copy)
    return v6._objects._characterLoadedWrapper;
end;
v6.getPlayerClassData = function() --[[ Line: 47 ]] --[[ Name: getPlayerClassData ]]
    -- upvalues: v6 (copy)
    return v6._objects._playerClassData;
end;
return v6;