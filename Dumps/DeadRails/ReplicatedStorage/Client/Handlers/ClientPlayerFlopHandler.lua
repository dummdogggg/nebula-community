--[[
    Script: ReplicatedStorage.Client.Handlers.ClientPlayerFlopHandler
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:24
-- Luau version 6, Types version 3
-- Time taken: 0.000962 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local module_upvr = {
	_lastFlopRequestTime = workspace:GetServerTimeNow();
}
local UserInputService_upvr = game:GetService("UserInputService")
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local Tag_upvr = require(ReplicatedStorage.Shared.SharedConstants.Tag)
local Remotes_upvr = require(ReplicatedStorage.Shared.Remotes)
local CurrentCamera_upvr = workspace.CurrentCamera
function module_upvr.start() -- Line 23
	--[[ Upvalues[6]:
		[1]: UserInputService_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
		[3]: Tag_upvr (readonly)
		[4]: module_upvr (readonly)
		[5]: Remotes_upvr (readonly)
		[6]: CurrentCamera_upvr (readonly)
	]]
	UserInputService_upvr.JumpRequest:Connect(function() -- Line 24
		--[[ Upvalues[5]:
			[1]: LocalPlayer_upvr (copied, readonly)
			[2]: Tag_upvr (copied, readonly)
			[3]: module_upvr (copied, readonly)
			[4]: Remotes_upvr (copied, readonly)
			[5]: CurrentCamera_upvr (copied, readonly)
		]]
		local Character = LocalPlayer_upvr.Character
		if not Character or not Character.PrimaryPart then
		else
			if not Character:HasTag(Tag_upvr.Dead) then return end
			local workspace_GetServerTimeNow_result1 = workspace:GetServerTimeNow()
			if workspace_GetServerTimeNow_result1 - module_upvr._lastFlopRequestTime < 1 then return end
			module_upvr._lastFlopRequestTime = workspace_GetServerTimeNow_result1
			game.SoundService.Flop:Play()
			Remotes_upvr.Events.RagdollFlop:FireServer(CurrentCamera_upvr.CFrame.LookVector)
		end
	end)
end
return module_upvr