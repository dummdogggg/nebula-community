--[[
    Script: ReplicatedStorage.Client.Controllers.PlayerDataController
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_script_FirstAncestor_0 = script:FindFirstAncestor("Client");
local _ = require(l_script_FirstAncestor_0.ReplicaClient);
local v2 = {
    _replica = nil
};
v2.isPlayerDataLoaded = function() --[[ Line: 11 ]] --[[ Name: isPlayerDataLoaded ]]
    -- upvalues: v2 (copy)
    return v2.hasLoaded();
end;
v2.getPlayerDataReplica = function() --[[ Line: 15 ]] --[[ Name: getPlayerDataReplica ]]
    -- upvalues: v2 (copy)
    return v2.getReplica();
end;
v2.hasLoaded = function() --[[ Line: 20 ]] --[[ Name: hasLoaded ]]
    -- upvalues: v2 (copy)
    return v2._replica ~= nil;
end;
v2.waitForDataLoadAsync = function() --[[ Line: 24 ]] --[[ Name: waitForDataLoadAsync ]]
    -- upvalues: v2 (copy)
    while not v2.isPlayerDataLoaded() do
        task.wait();
    end;
end;
v2.getReplica = function() --[[ Line: 30 ]] --[[ Name: getReplica ]]
    -- upvalues: v2 (copy)
    if not v2.isPlayerDataLoaded() then
        error("Cannot getPlayerDataReplica; Player data is not loaded!");
    end;
    return v2._replica;
end;
return v2;