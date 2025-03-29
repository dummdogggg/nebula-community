--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateWeapon
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:16
-- Luau version 6, Types version 3
-- Time taken: 0.000750 seconds

local ._validateInstance_upvr = require("./validateInstance")
local WeaponConstants_upvr = require(game:GetService("ReplicatedStorage").Shared.DataBanks.WeaponConstants)
return function(arg1) -- Line 11, Named "validateGun"
	--[[ Upvalues[2]:
		[1]: ._validateInstance_upvr (readonly)
		[2]: WeaponConstants_upvr (readonly)
	]]
	if not ._validateInstance_upvr(arg1, "Tool") then
		return false, "wrong instance"
	end
	if not arg1:HasTag(WeaponConstants_upvr.WEAPON_TAG) then
		return false, "no Weapon tag"
	end
	local SOME = arg1:FindFirstChild(WeaponConstants_upvr.WEAPON_CONFIURATION_FOLDER)
	if not SOME then
		return false, "No WeaponConfiguration"
	end
	if not SOME:FindFirstChild(WeaponConstants_upvr.CONFIGURATION_VALUES.WEAPON_TYPE) then
		return false, "No WeaponType"
	end
	return true
end