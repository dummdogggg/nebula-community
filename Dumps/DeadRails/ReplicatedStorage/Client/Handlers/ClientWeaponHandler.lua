--[[
    Script: ReplicatedStorage.Client.Handlers.ClientWeaponHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:17
-- Luau version 6, Types version 3
-- Time taken: 0.003243 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer
local .__Controllers_ActionController_upvr = require("../Controllers/ActionController")
local WeaponController_upvr = require(ReplicatedStorage.Client.Controllers.WeaponController)
local ActionData_upvr = require(ReplicatedStorage.Client.DataBanks.ActionData)
local var6_upvw = false
local var7_upvw = false
local var8_upvw
local tick_result1_upvw = tick()
local function shootWeaponCallback_upvr(arg1, arg2) -- Line 81, Named "shootWeaponCallback"
	--[[ Upvalues[1]:
		[1]: var7_upvw (read and write)
	]]
	if arg2 == Enum.UserInputState.Begin then
		var7_upvw = true
		return Enum.ContextActionResult.Sink
	end
	if arg2 == Enum.UserInputState.End or arg2 == Enum.UserInputState.Cancel then
		var7_upvw = false
		return Enum.ContextActionResult.Sink
	end
	return Enum.ContextActionResult.Pass
end
local function reloadWeaponCallback_upvr(arg1, arg2) -- Line 93, Named "reloadWeaponCallback"
	--[[ Upvalues[2]:
		[1]: var8_upvw (read and write)
		[2]: WeaponController_upvr (readonly)
	]]
	if not var8_upvw then return end
	if arg2 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	WeaponController_upvr.ReloadGun(var8_upvw)
	return Enum.ContextActionResult.Sink
end
local function throwWeaponCallback_upvr(arg1, arg2) -- Line 107, Named "throwWeaponCallback"
	--[[ Upvalues[2]:
		[1]: var8_upvw (read and write)
		[2]: WeaponController_upvr (readonly)
	]]
	if not var8_upvw then return end
	if arg2 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	WeaponController_upvr.ThrowWeapon(var8_upvw)
	return Enum.ContextActionResult.Sink
end
local function onWeaponEquipped_upvr() -- Line 121, Named "onWeaponEquipped"
	--[[ Upvalues[8]:
		[1]: var6_upvw (read and write)
		[2]: var8_upvw (read and write)
		[3]: .__Controllers_ActionController_upvr (readonly)
		[4]: ActionData_upvr (readonly)
		[5]: shootWeaponCallback_upvr (readonly)
		[6]: reloadWeaponCallback_upvr (readonly)
		[7]: throwWeaponCallback_upvr (readonly)
		[8]: WeaponController_upvr (readonly)
	]]
	if not var6_upvw then
		if var8_upvw.WeaponConfiguration.WeaponType.Value == "Gun" then
			.__Controllers_ActionController_upvr.bindAction(ActionData_upvr.Action.Shoot, shootWeaponCallback_upvr, ActionData_upvr.ActionContext[ActionData_upvr.Action.Shoot], Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2, ActionData_upvr.ActionPriority.Highest)
			.__Controllers_ActionController_upvr.bindAction(ActionData_upvr.Action.Reload, reloadWeaponCallback_upvr, ActionData_upvr.ActionContext[ActionData_upvr.Action.Reload], Enum.KeyCode.R, Enum.KeyCode.ButtonX, ActionData_upvr.ActionPriority.Highest)
		elseif var8_upvw.WeaponConfiguration.WeaponType.Value == "Throwable" then
			.__Controllers_ActionController_upvr.bindAction(ActionData_upvr.Action.Throw, throwWeaponCallback_upvr, ActionData_upvr.ActionContext[ActionData_upvr.Action.Throw], Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2, ActionData_upvr.ActionPriority.Highest)
		end
		var6_upvw = true
	end
	WeaponController_upvr.OnWeaponEquipped:Fire(var8_upvw)
end
local function onWeaponUnequipped_upvr() -- Line 158, Named "onWeaponUnequipped"
	--[[ Upvalues[5]:
		[1]: var6_upvw (read and write)
		[2]: .__Controllers_ActionController_upvr (readonly)
		[3]: ActionData_upvr (readonly)
		[4]: var8_upvw (read and write)
		[5]: WeaponController_upvr (readonly)
	]]
	if var6_upvw then
		.__Controllers_ActionController_upvr.unbindAction(ActionData_upvr.Action.Shoot)
		.__Controllers_ActionController_upvr.unbindAction(ActionData_upvr.Action.Reload)
		.__Controllers_ActionController_upvr.unbindAction(ActionData_upvr.Action.Throw)
		var6_upvw = false
	end
	if not var8_upvw then
	else
		var8_upvw = nil
		WeaponController_upvr.OnWeaponUnequipped:Fire()
	end
end
local function onCharacterAdded(arg1) -- Line 176
	--[[ Upvalues[3]:
		[1]: var8_upvw (read and write)
		[2]: onWeaponEquipped_upvr (readonly)
		[3]: onWeaponUnequipped_upvr (readonly)
	]]
	local function _(arg1_2) -- Line 177, Named "onChildAdded"
		--[[ Upvalues[2]:
			[1]: var8_upvw (copied, read and write)
			[2]: onWeaponEquipped_upvr (copied, readonly)
		]]
		if not var8_upvw and arg1_2:IsA("Tool") and arg1_2:HasTag("Weapon") then
			var8_upvw = arg1_2
			onWeaponEquipped_upvr()
		end
	end
	local function _(arg1_3) -- Line 188, Named "onChildRemoved"
		--[[ Upvalues[2]:
			[1]: var8_upvw (copied, read and write)
			[2]: onWeaponUnequipped_upvr (copied, readonly)
		]]
		if arg1_3 == var8_upvw then
			onWeaponUnequipped_upvr()
		end
	end
end
if LocalPlayer.Character then
	task.spawn(onCharacterAdded, LocalPlayer.Character)
end
LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
game:GetService("RunService").Heartbeat:Connect(function() -- Line 28, Named "onHeartbeat"
	--[[ Upvalues[4]:
		[1]: var8_upvw (read and write)
		[2]: tick_result1_upvw (read and write)
		[3]: var7_upvw (read and write)
		[4]: WeaponController_upvr (readonly)
	]]
	if not var8_upvw then
	else
		if var8_upvw.WeaponConfiguration.WeaponType.Value ~= "Gun" then return end
		if not var8_upvw:FindFirstChild("ClientWeaponState") then return end
		if not var8_upvw.ClientWeaponState:FindFirstChild("CurrentAmmo") then return end
		if var8_upvw.ClientWeaponState.IsReloading.Value then return end
		if tick() < tick_result1_upvw then return end
		if var7_upvw then
			if workspace:GetServerTimeNow() - var8_upvw.ClientWeaponState.LastFireTime.Value < var8_upvw.WeaponConfiguration.FireDelay.Value then return end
			tick_result1_upvw = tick() + 0.5
			WeaponController_upvr.FireBullet(var8_upvw)
		end
	end
end)