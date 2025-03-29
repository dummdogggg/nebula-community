--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateWeaponAsync
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:13
-- Luau version 6, Types version 3
-- Time taken: 0.000756 seconds

local ._validateInstance_upvr = require("./validateInstance")
local WeaponConstants_upvr = require(game:GetService("ReplicatedStorage").Shared.DataBanks.WeaponConstants)
return function(arg1) -- Line 11, Named "validateWeaponAsync"
	--[[ Upvalues[2]:
		[1]: ._validateInstance_upvr (readonly)
		[2]: WeaponConstants_upvr (readonly)
	]]
	if not ._validateInstance_upvr(arg1, "Tool") then
		return false, "Wrong instance"
	end
	if not arg1:HasTag(WeaponConstants_upvr.WEAPON_TAG) then
		return false, `Missing tag {WeaponConstants_upvr.WEAPON_TAG}`
	end
	local SOME = arg1:WaitForChild(WeaponConstants_upvr.WEAPON_CONFIURATION_FOLDER, 10)
	if not SOME then
		return false, "Missing WeaponConfiguration"
	end
	if not SOME:WaitForChild(WeaponConstants_upvr.CONFIGURATION_VALUES.WEAPON_TYPE, 10) then
		return false, "Missing WeaponType"
	end
	return true
end