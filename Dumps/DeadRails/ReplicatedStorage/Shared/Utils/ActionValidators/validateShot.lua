--[[
    Script: ReplicatedStorage.Shared.Utils.ActionValidators.validateShot
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:17
-- Luau version 6, Types version 3
-- Time taken: 0.000883 seconds

return function(arg1, arg2, arg3) -- Line 9, Named "validateShot"
	local workspace_GetServerTimeNow_result1 = workspace:GetServerTimeNow()
	if workspace_GetServerTimeNow_result1 < arg1 then
		return false, "Client timestamp in the future"
	end
	if arg1 < workspace_GetServerTimeNow_result1 - 1 then
		return false, "Client timestamp too far in the past"
	end
	local Value = arg2.ServerWeaponState.LastFireTime.Value
	if arg2.ServerWeaponState.IsReloading.Value then
		return false, "Gun is reloading"
	end
	if arg2.ServerWeaponState.CurrentAmmo.Value <= 0 then
		return false, "Gun has no ammo"
	end
	if arg1 - Value + 0.05 < arg2.WeaponConfiguration.FireDelay.Value then
		return false, `Gun is on fire cooldown {arg1 - Value}`
	end
	return true
end