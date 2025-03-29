--[[
    Script: ReplicatedStorage.Client.Handlers.ClientReconnectHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:56
-- Luau version 6, Types version 3
-- Time taken: 0.001320 seconds

local ReconnectSession_upvr = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ReconnectSession")
require(game:GetService("ReplicatedStorage").Shared.Remotes).ReconnectSession.OnClientInvoke = function() -- Line 14, Named "onServerAskReconnectSession"
	--[[ Upvalues[1]:
		[1]: ReconnectSession_upvr (readonly)
	]]
	warn("Received")
	local var3_upvw
	local task_delay_result1 = task.delay(20, function() -- Line 20
		--[[ Upvalues[1]:
			[1]: var3_upvw (read and write)
		]]
		var3_upvw = false
	end)
	local any_Once_result1 = ReconnectSession_upvr.Container.YesButton.Activated:Once(function() -- Line 24
		--[[ Upvalues[1]:
			[1]: var3_upvw (read and write)
		]]
		var3_upvw = true
	end)
	local any_Once_result1_2 = ReconnectSession_upvr.Container.NoButton.Activated:Once(function() -- Line 28
		--[[ Upvalues[1]:
			[1]: var3_upvw (read and write)
		]]
		var3_upvw = false
	end)
	ReconnectSession_upvr.Enabled = true
	repeat
		task.wait()
	until var3_upvw ~= nil
	if any_Once_result1 then
		any_Once_result1:Disconnect()
	end
	if any_Once_result1_2 then
		any_Once_result1_2:Disconnect()
	end
	if task_delay_result1 and coroutine.status(task_delay_result1) ~= "dead" then
		task.cancel(task_delay_result1)
	end
	ReconnectSession_upvr.Enabled = false
	return var3_upvw
end
game.ReplicatedStorage.Remotes.PlayerFullyLoaded:FireServer()