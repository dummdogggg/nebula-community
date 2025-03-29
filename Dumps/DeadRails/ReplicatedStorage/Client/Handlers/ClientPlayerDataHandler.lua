--[[
    Script: ReplicatedStorage.Client.Handlers.ClientPlayerDataHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:33:57
-- Luau version 6, Types version 3
-- Time taken: 0.000756 seconds

local Client = script:FindFirstAncestor("Client")
local ReplicaClient = require(Client.ReplicaClient)
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local PlayerDataController_upvr = require(Client.Controllers.PlayerDataController)
ReplicaClient.OnNew("PlayerProfile", function(arg1) -- Line 11
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: PlayerDataController_upvr (readonly)
	]]
	if arg1.Tags.player ~= LocalPlayer_upvr then
	else
		PlayerDataController_upvr._replica = arg1
	end
end)
ReplicaClient.RequestData()