--[[
    Script: ReplicatedStorage.Shared.Utils.TypeValidators.validateGun
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:11
-- Luau version 6, Types version 3
-- Time taken: 0.000574 seconds

local ._validateWeapon_upvr = require("./validateWeapon")
local WeaponConstants_upvr = require(game:GetService("ReplicatedStorage").Shared.DataBanks.WeaponConstants)
return function(arg1) -- Line 11, Named "validateGun"
	--[[ Upvalues[2]:
		[1]: ._validateWeapon_upvr (readonly)
		[2]: WeaponConstants_upvr (readonly)
	]]
	if not ._validateWeapon_upvr(arg1) then
		return false
	end
	if arg1:FindFirstChild(WeaponConstants_upvr.WEAPON_CONFIURATION_FOLDER):FindFirstChild(WeaponConstants_upvr.CONFIGURATION_VALUES.WEAPON_TYPE).Value ~= WeaponConstants_upvr.WEAPON_TYPE.GUN then
		return false
	end
	return true
end