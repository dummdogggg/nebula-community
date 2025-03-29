--[[
    Script: ReplicatedStorage.Client.Handlers.ClientPlayerDataHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local _ = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Client");
local v3 = require(l_script_FirstAncestor_0.ReplicaClient);
local v4 = require(l_script_FirstAncestor_0.Controllers.PlayerDataController);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
v3.OnNew("PlayerProfile", function(v6) --[[ Line: 11 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v4 (copy)
    if v6.Tags.player ~= l_LocalPlayer_0 then
        return;
    else
        v4._replica = v6;
        return;
    end;
end);
v3.RequestData();