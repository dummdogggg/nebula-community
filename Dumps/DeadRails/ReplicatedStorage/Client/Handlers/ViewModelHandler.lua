--[[
    Script: ReplicatedStorage.Client.Handlers.ViewModelHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:16
-- Luau version 6, Types version 3
-- Time taken: 0.001316 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage.Client
local WeaponController = require(Client.Controllers.WeaponController)
local var4_upvw
local drawRayResults_upvr = require(Client.Effects.drawRayResults)
WeaponController.OnWeaponActivated:Connect(function(arg1, arg2, arg3) -- Line 16
	--[[ Upvalues[2]:
		[1]: drawRayResults_upvr (readonly)
		[2]: var4_upvw (read and write)
	]]
	drawRayResults_upvr(arg1, var4_upvw.model:GetPivot().Position, arg3)
	var4_upvw:playShootAnimation()
end)
WeaponController.OnClientReload:Connect(function(arg1, arg2) -- Line 23
	--[[ Upvalues[1]:
		[1]: var4_upvw (read and write)
	]]
	var4_upvw:playReloadAnimation(arg1 or 2, arg2)
end)
WeaponController.OnClientThrow:Connect(function() -- Line 27
	--[[ Upvalues[1]:
		[1]: var4_upvw (read and write)
	]]
	var4_upvw:playThrowAnimation()
end)
WeaponController.OnServerCancelledReload:Connect(function() -- Line 31
	--[[ Upvalues[1]:
		[1]: var4_upvw (read and write)
	]]
	if var4_upvw then
		var4_upvw:cancelReloadAnimation()
	end
end)
local ViewModelController_upvr = require(ReplicatedStorage.ViewModelControl.Utility.ViewModelController)
local bindToInstanceDestroyed_upvr = require(ReplicatedStorage.ViewModelControl.Utility.bindToInstanceDestroyed)
WeaponController.OnWeaponEquipped:Connect(function(arg1) -- Line 38
	--[[ Upvalues[3]:
		[1]: var4_upvw (read and write)
		[2]: ViewModelController_upvr (readonly)
		[3]: bindToInstanceDestroyed_upvr (readonly)
	]]
	if not var4_upvw then
		var4_upvw = ViewModelController_upvr.new(arg1)
		bindToInstanceDestroyed_upvr(arg1, function() -- Line 43
			--[[ Upvalues[1]:
				[1]: var4_upvw (copied, read and write)
			]]
			if var4_upvw then
				var4_upvw:destroy()
			end
		end)
	end
	var4_upvw:enable()
end)
WeaponController.OnWeaponUnequipped:Connect(function() -- Line 56
	--[[ Upvalues[1]:
		[1]: var4_upvw (read and write)
	]]
	if var4_upvw then
		var4_upvw:destroy()
	end
	var4_upvw = nil
end)