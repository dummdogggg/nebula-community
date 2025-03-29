--[[
    Script: StarterGui.GameModeDisplay.DisplayGameMode
    Type: LocalScript
    Decompiled with Wave using Nebula Decompiler
--]]

local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(l_ReplicatedStorage_0.Shared.Remotes);
local l_GameModeDisplay_0 = l_Players_0.LocalPlayer.PlayerGui:WaitForChild("GameModeDisplay");
local l_TextLabel_0 = l_GameModeDisplay_0:WaitForChild("TextLabel");
local _ = TweenInfo.new(0.25, Enum.EasingStyle.Linear);
local v8 = TweenInfo.new(2.5, Enum.EasingStyle.Linear);
local function v10() --[[ Line: 16 ]] --[[ Name: displayGameModeAsync ]]
    -- upvalues: l_ReplicatedFirst_0 (copy), l_GameModeDisplay_0 (copy), l_TextLabel_0 (copy), l_TweenService_0 (copy), v8 (copy)
    if not l_ReplicatedFirst_0.StartClient:GetAttribute("IsStarted") then
        l_ReplicatedFirst_0.StartClient:GetAttributeChangedSignal("IsStarted"):Wait();
    end;
    l_GameModeDisplay_0.Enabled = true;
    l_TextLabel_0.BackgroundTransparency = 0;
    l_TextLabel_0.TextTransparency = 0;
    task.wait(2);
    local v9 = l_TweenService_0:Create(l_TextLabel_0, v8, {
        BackgroundTransparency = 1, 
        TextTransparency = 1
    });
    v9:Play();
    v9.Completed:Wait();
    task.wait(1);
    l_GameModeDisplay_0.Enabled = false;
end;
v4.Events.DisplayGameMode.OnClientEvent:Connect(function() --[[ Line: 48 ]] --[[ Name: onDisplayGameMode ]]
    -- upvalues: v10 (copy)
    v10();
end);