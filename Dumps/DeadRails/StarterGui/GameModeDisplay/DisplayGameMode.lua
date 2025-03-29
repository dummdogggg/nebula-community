--[[
    Script: StarterGui.GameModeDisplay.DisplayGameMode
    Type: LocalScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:14
-- Luau version 6, Types version 3
-- Time taken: 0.000988 seconds

local GameModeDisplay_upvr = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("GameModeDisplay")
local ReplicatedFirst_upvr = game:GetService("ReplicatedFirst")
local TextLabel_upvr = GameModeDisplay_upvr:WaitForChild("TextLabel")
local TweenService_upvr = game:GetService("TweenService")
local TweenInfo_new_result1_upvr = TweenInfo.new(2.5, Enum.EasingStyle.Linear)
local function displayGameModeAsync_upvr() -- Line 16, Named "displayGameModeAsync"
	--[[ Upvalues[5]:
		[1]: ReplicatedFirst_upvr (readonly)
		[2]: GameModeDisplay_upvr (readonly)
		[3]: TextLabel_upvr (readonly)
		[4]: TweenService_upvr (readonly)
		[5]: TweenInfo_new_result1_upvr (readonly)
	]]
	if not ReplicatedFirst_upvr.StartClient:GetAttribute("IsStarted") then
		ReplicatedFirst_upvr.StartClient:GetAttributeChangedSignal("IsStarted"):Wait()
	end
	GameModeDisplay_upvr.Enabled = true
	TextLabel_upvr.BackgroundTransparency = 0
	TextLabel_upvr.TextTransparency = 0
	task.wait(2)
	local any_Create_result1 = TweenService_upvr:Create(TextLabel_upvr, TweenInfo_new_result1_upvr, {
		BackgroundTransparency = 1;
		TextTransparency = 1;
	})
	any_Create_result1:Play()
	any_Create_result1.Completed:Wait()
	task.wait(1)
	GameModeDisplay_upvr.Enabled = false
end
require(game:GetService("ReplicatedStorage").Shared.Remotes).Events.DisplayGameMode.OnClientEvent:Connect(function() -- Line 48, Named "onDisplayGameMode"
	--[[ Upvalues[1]:
		[1]: displayGameModeAsync_upvr (readonly)
	]]
	displayGameModeAsync_upvr()
end)