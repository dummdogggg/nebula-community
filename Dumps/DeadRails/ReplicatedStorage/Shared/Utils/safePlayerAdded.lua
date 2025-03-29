--[[
    Script: ReplicatedStorage.Shared.Utils.safePlayerAdded
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:36:18
-- Luau version 6, Types version 3
-- Time taken: 0.000526 seconds

local Players_upvr = game:GetService("Players")
return function(arg1) -- Line 7, Named "safePlayerAdded"
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	for _, v in ipairs(Players_upvr:GetPlayers()) do
		task.spawn(arg1, v)
	end
	return Players_upvr.PlayerAdded:Connect(arg1)
end