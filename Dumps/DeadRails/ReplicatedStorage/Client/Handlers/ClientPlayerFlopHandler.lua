--[[
    Script: ReplicatedStorage.Client.Handlers.ClientPlayerFlopHandler
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_ReplicatedStorage_0.Shared.Remotes);
local v5 = require(l_ReplicatedStorage_0.Shared.SharedConstants.Tag);
local _ = require(l_ReplicatedStorage_0.Client.LocalPlayerObjectsContainer);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v9 = {
    _lastFlopRequestTime = workspace:GetServerTimeNow()
};
v9.start = function() --[[ Line: 23 ]] --[[ Name: start ]]
    -- upvalues: l_UserInputService_0 (copy), l_LocalPlayer_0 (copy), v5 (copy), v9 (copy), v4 (copy), l_CurrentCamera_0 (copy)
    l_UserInputService_0.JumpRequest:Connect(function() --[[ Line: 24 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v5 (ref), v9 (ref), v4 (ref), l_CurrentCamera_0 (ref)
        local l_Character_0 = l_LocalPlayer_0.Character;
        if not l_Character_0 or not l_Character_0.PrimaryPart then
            return;
        elseif not l_Character_0:HasTag(v5.Dead) then
            return;
        else
            local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
            if l_workspace_ServerTimeNow_0 - v9._lastFlopRequestTime < 1 then
                return;
            else
                v9._lastFlopRequestTime = l_workspace_ServerTimeNow_0;
                game.SoundService.Flop:Play();
                v4.Events.RagdollFlop:FireServer(l_CurrentCamera_0.CFrame.LookVector);
                return;
            end;
        end;
    end);
end;
return v9;