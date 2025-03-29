--[[
    Script: ReplicatedStorage.Client.Handlers.UIHandlers.SelfReviveUIHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:46
-- Luau version 6, Types version 3
-- Time taken: 0.001019 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayerObjectsContainer = require(ReplicatedStorage.Client.LocalPlayerObjectsContainer)
LocalPlayerObjectsContainer.waitForRegisteredAsync()
local any_getCharacterLoadedWrapper_result1 = LocalPlayerObjectsContainer.getCharacterLoadedWrapper()
local SelfRevive_upvr = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("SelfRevive", math.huge)
local var5_upvw
any_getCharacterLoadedWrapper_result1.loaded:Connect(function() -- Line 19, Named "onLocalCharacterLoaded"
	--[[ Upvalues[1]:
		[1]: SelfRevive_upvr (readonly)
	]]
	SelfRevive_upvr.Enabled = false
end)
any_getCharacterLoadedWrapper_result1.died:Connect(function() -- Line 23, Named "onLocalCharacterDied"
	--[[ Upvalues[2]:
		[1]: var5_upvw (read and write)
		[2]: SelfRevive_upvr (readonly)
	]]
	if var5_upvw then
		task.cancel(var5_upvw)
	end
	var5_upvw = task.spawn(function() -- Line 28
		--[[ Upvalues[2]:
			[1]: SelfRevive_upvr (copied, readonly)
			[2]: var5_upvw (copied, read and write)
		]]
		SelfRevive_upvr.Enabled = true
		for i = 14, 0, -1 do
			SelfRevive_upvr.SelfRevive.Text = `Self Revive ({i})`
			task.wait(1)
		end
		SelfRevive_upvr.Enabled = false
		var5_upvw = nil
	end)
end)
local RevivePlayer_upvr = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("RevivePlayer")
SelfRevive_upvr.SelfRevive.Activated:Connect(function() -- Line 44
	--[[ Upvalues[1]:
		[1]: RevivePlayer_upvr (readonly)
	]]
	RevivePlayer_upvr:FireServer()
end)