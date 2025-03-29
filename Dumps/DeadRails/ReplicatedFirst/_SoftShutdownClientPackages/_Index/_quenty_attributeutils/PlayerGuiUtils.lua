--[[
    Script: ReplicatedFirst._SoftShutdownClientPackages._Index.@quenty/attributeutils.PlayerGuiUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:37:09
-- Luau version 6, Types version 3
-- Time taken: 0.000560 seconds

local module = {}
local Players_upvr = game:GetService("Players")
function module.getPlayerGui() -- Line 9
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	local LocalPlayer = Players_upvr.LocalPlayer
	if not LocalPlayer then
		error("No localPlayer")
	end
	local class_PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
	if not class_PlayerGui then
		class_PlayerGui = error("No PlayerGui")
	end
	return class_PlayerGui
end
return module