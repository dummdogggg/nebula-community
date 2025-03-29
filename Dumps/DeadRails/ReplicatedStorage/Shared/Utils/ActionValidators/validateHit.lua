--[[
    Script: ReplicatedStorage.Shared.Utils.ActionValidators.validateHit
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:21
-- Luau version 6, Types version 3
-- Time taken: 0.000716 seconds

local Players_upvr = game:GetService("Players")
return function(arg1, arg2, arg3, arg4, arg5) -- Line 11, Named "validateHit"
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	local class_Model = arg1:FindFirstAncestorOfClass("Model")
	if not class_Model then
		return false
	end
	if arg5 and Players_upvr:GetPlayerFromCharacter(class_Model) then
		return false
	end
	if (arg2 - arg4.position).Magnitude < (class_Model:GetPivot().Position - arg2).Magnitude - 10 then
		return false, "Server hit static geometry"
	end
	return true
end