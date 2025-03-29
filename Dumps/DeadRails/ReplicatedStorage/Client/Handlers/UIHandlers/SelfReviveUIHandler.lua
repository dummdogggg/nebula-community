--[[
    Script: ReplicatedStorage.Client.Handlers.UIHandlers.SelfReviveUIHandler
    Type: Script
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Client_0 = l_ReplicatedStorage_0.Client;
local v3 = require(l_Client_0.LocalPlayerObjectsContainer);
local l_PlayerGui_0 = l_Players_0.LocalPlayer.PlayerGui;
v3.waitForRegisteredAsync();
local v5 = v3.getCharacterLoadedWrapper();
local l_RevivePlayer_0 = l_ReplicatedStorage_0:WaitForChild("Remotes"):WaitForChild("RevivePlayer");
local v7 = l_PlayerGui_0:WaitForChild("SelfRevive", 1e999);
local v8 = nil;
local function v9() --[[ Line: 19 ]] --[[ Name: onLocalCharacterLoaded ]]
    -- upvalues: v7 (copy)
    v7.Enabled = false;
end;
local function v11() --[[ Line: 23 ]] --[[ Name: onLocalCharacterDied ]]
    -- upvalues: v8 (ref), v7 (copy)
    if v8 then
        task.cancel(v8);
    end;
    v8 = task.spawn(function() --[[ Line: 28 ]]
        -- upvalues: v7 (ref), v8 (ref)
        v7.Enabled = true;
        for v10 = 14, 0, -1 do
            v7.SelfRevive.Text = ("Self Revive (%*)"):format(v10);
            task.wait(1);
        end;
        v7.Enabled = false;
        v8 = nil;
    end);
end;
v5.loaded:Connect(v9);
v5.died:Connect(v11);
v7.SelfRevive.Activated:Connect(function() --[[ Line: 44 ]]
    -- upvalues: l_RevivePlayer_0 (copy)
    l_RevivePlayer_0:FireServer();
end);