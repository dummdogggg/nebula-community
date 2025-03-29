--[[
    Script: ReplicatedStorage.Client.Controllers.WeaponController
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:45:51
-- Luau version 6, Types version 3
-- Time taken: 0.005784 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService_upvr = game:GetService("CollectionService")
local Players_upvr = game:GetService("Players")
local LocalPlayer_upvr = Players_upvr.LocalPlayer
local CurrentCamera_upvr = workspace.CurrentCamera
local Remotes = ReplicatedStorage.Remotes
local Signal = require(ReplicatedStorage.Packages.Signal)
local Shared = ReplicatedStorage.Shared
local WeaponConstants_upvr = require(Shared.DataBanks.WeaponConstants)
local TypeValidators = Shared.Utils.TypeValidators
local Client = ReplicatedStorage.Client
local module_upvr = {
	OnWeaponEquipped = Signal.new();
	OnWeaponUnequipped = Signal.new();
	OnWeaponActivated = Signal.new();
	OnClientReload = Signal.new();
	OnClientThrow = Signal.new();
	OnServerCancelledReload = Signal.new();
}
local getRayDirections_upvr = require(Shared.Utils.getRayDirections)
local castRays_upvr = require(Shared.Utils.castRays)
local Shoot_upvr = Remotes.Weapon.Shoot
function module_upvr.FireBullet(arg1) -- Line 56
	--[[ Upvalues[7]:
		[1]: CurrentCamera_upvr (readonly)
		[2]: module_upvr (readonly)
		[3]: WeaponConstants_upvr (readonly)
		[4]: getRayDirections_upvr (readonly)
		[5]: castRays_upvr (readonly)
		[6]: LocalPlayer_upvr (readonly)
		[7]: Shoot_upvr (readonly)
	]]
	local workspace_GetServerTimeNow_result1 = workspace:GetServerTimeNow()
	local CFrame = CurrentCamera_upvr.CFrame
	if arg1.ClientWeaponState.CurrentAmmo.Value <= 0 then
		module_upvr.ReloadGun(arg1)
	else
		if workspace_GetServerTimeNow_result1 - arg1.ClientWeaponState.LastFireTime.Value < arg1.WeaponConfiguration.FireDelay.Value then return end
		if arg1.ClientWeaponState.IsReloading.Value then return end
		arg1.ClientWeaponState.LastFireTime.Value = workspace_GetServerTimeNow_result1
		local CurrentAmmo = arg1.ClientWeaponState.CurrentAmmo
		CurrentAmmo.Value -= 1
		local var27 = 1
		if arg1.WeaponConfiguration.BulletType.Value == WeaponConstants_upvr.BULLET_TYPE.SHOT then
			var27 = arg1.WeaponConfiguration.PelletsPerBullet.Value
		end
		local getRayDirections_upvr_result1 = getRayDirections_upvr(CFrame, var27, math.rad(arg1.WeaponConfiguration.SpreadAngle.Value), workspace_GetServerTimeNow_result1)
		for i_2, v_2 in getRayDirections_upvr_result1 do
			getRayDirections_upvr_result1[i_2] = v_2 * WeaponConstants_upvr.BULLET_RANGE
			local var29
		end
		local castRays_upvr_result1 = castRays_upvr(LocalPlayer_upvr.Character, CFrame.Position, var29, WeaponConstants_upvr.RAY_RADIUS)
		for i_3, v_3 in castRays_upvr_result1 do
			if v_3.taggedHumanoid then
				({})[tostring(i_3)] = v_3.taggedHumanoid
			end
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		Shoot_upvr:FireServer(workspace_GetServerTimeNow_result1, arg1, CFrame, {})
		module_upvr.OnWeaponActivated:Fire(workspace_GetServerTimeNow_result1, arg1, castRays_upvr_result1)
	end
end
local validateLivingCharacter_upvr = require(TypeValidators.validateLivingCharacter)
local Reload_upvr = Remotes.Weapon.Reload
function module_upvr.ReloadGun(arg1) -- Line 117
	--[[ Upvalues[4]:
		[1]: validateLivingCharacter_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
		[3]: Reload_upvr (readonly)
		[4]: module_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if not validateLivingCharacter_upvr(LocalPlayer_upvr.Character) then
	else
		local Character_upvr = LocalPlayer_upvr.Character
		local Value_upvr = arg1.WeaponConfiguration.BulletType.Value
		local Value = arg1.ClientWeaponState.CurrentAmmo.Value
		local attribute_upvr = Character_upvr:GetAttribute(Value_upvr.."Ammo")
		local minimum = math.min(arg1.WeaponConfiguration.MagazineSize.Value - Value, attribute_upvr)
		if arg1.ClientWeaponState.IsReloading.Value then return end
		if minimum <= 0 then return end
		local var40
		if arg1.WeaponConfiguration:FindFirstChild("MagazineFed") and arg1.WeaponConfiguration.MagazineFed.Value == true then
			var40 = arg1.WeaponConfiguration.ReloadDuration.Value
		end
		local const_number_upvw = 1
		local var43_upvr = Value + minimum
		task.delay(var40, function() -- Line 152
			--[[ Upvalues[6]:
				[1]: Character_upvr (readonly)
				[2]: Value_upvr (readonly)
				[3]: attribute_upvr (readonly)
				[4]: const_number_upvw (read and write)
				[5]: arg1 (readonly)
				[6]: var43_upvr (readonly)
			]]
			Character_upvr:SetAttribute(Value_upvr.."Ammo", attribute_upvr - const_number_upvw)
			arg1.ClientWeaponState.CurrentAmmo.Value = var43_upvr
			arg1.ClientWeaponState.IsReloading.Value = false
		end)
		arg1.ClientWeaponState.IsReloading.Value = true
		Reload_upvr:FireServer(workspace:GetServerTimeNow(), arg1)
		module_upvr.OnClientReload:Fire(const_number_upvw, var40)
	end
end
local Throw_upvr = Remotes.Weapon.Throw
function module_upvr.ThrowWeapon(arg1) -- Line 168
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: CurrentCamera_upvr (readonly)
		[3]: Throw_upvr (readonly)
	]]
	if arg1.WeaponConfiguration.WeaponType.Value ~= "Throwable" then
	else
		if arg1.WeaponConfiguration.Thrown.Value == true then return end
		module_upvr.OnClientThrow:Fire()
		arg1.WeaponConfiguration.Thrown.Value = true
		task.delay(arg1.WeaponConfiguration.ThrowTime.Value, function() -- Line 184
			--[[ Upvalues[3]:
				[1]: CurrentCamera_upvr (copied, readonly)
				[2]: Throw_upvr (copied, readonly)
				[3]: arg1 (readonly)
			]]
			Throw_upvr:FireServer(arg1, CurrentCamera_upvr.CFrame)
		end)
	end
end
local playSoundAtPosition_upvr = require(Client.Effects.playSoundAtPosition)
local drawRayResults_upvr = require(Client.Effects.drawRayResults)
function module_upvr._onServerReplicateShot(arg1, arg2, arg3, arg4) -- Line 191
	--[[ Upvalues[2]:
		[1]: playSoundAtPosition_upvr (readonly)
		[2]: drawRayResults_upvr (readonly)
	]]
	if arg2 and arg2:IsDescendantOf(game) then
		local Position = arg2:GetPivot().Position
		playSoundAtPosition_upvr(arg2.WeaponConfiguration.Sounds.Shoot, Position)
	end
	drawRayResults_upvr(arg1, Position, arg4)
end
local validateWeaponAsync_upvr = require(TypeValidators.validateWeaponAsync)
local CONFIGURATION_VALUES_upvr = WeaponConstants_upvr.CONFIGURATION_VALUES
local GUN_VALUES_upvr = WeaponConstants_upvr.CONFIGURATION_VALUES.GUN_VALUES
local GUN_VALUES_upvr_2 = WeaponConstants_upvr.STATE_VALUES.GUN_VALUES
function module_upvr._initializeWeapon(arg1) -- Line 202
	--[[ Upvalues[7]:
		[1]: validateWeaponAsync_upvr (readonly)
		[2]: Players_upvr (readonly)
		[3]: WeaponConstants_upvr (readonly)
		[4]: CONFIGURATION_VALUES_upvr (readonly)
		[5]: GUN_VALUES_upvr (readonly)
		[6]: GUN_VALUES_upvr_2 (readonly)
		[7]: module_upvr (readonly)
	]]
	local validateWeaponAsync_upvr_result1, validateWeaponAsync_upvr_result2 = validateWeaponAsync_upvr(arg1)
	if not validateWeaponAsync_upvr_result1 then
		warn("Invalid weapon:", validateWeaponAsync_upvr_result2)
	else
		if not arg1.Parent or not arg1.Parent:IsDescendantOf(workspace) and not arg1.Parent:IsDescendantOf(Players_upvr) then
			if not arg1.Parent then
				warn("no parent")
			else
				if not arg1.Parent:IsDescendantOf(workspace) then
					warn("parent not in workspace", arg1:IsDescendantOf(workspace))
					return
				end
				if not arg1.Parent:IsDescendantOf(Players_upvr) then
					warn("parent not in players either", arg1:IsDescendantOf(Players_upvr))
				end
			end
		end
		local ServerWeaponState = arg1:WaitForChild("ServerWeaponState")
		local Folder = Instance.new("Folder")
		Folder.Name = "Client"..WeaponConstants_upvr.WEAPON_STATE_FOLDER
		Folder.Parent = arg1
		if arg1:FindFirstChild(WeaponConstants_upvr.WEAPON_CONFIURATION_FOLDER):FindFirstChild(CONFIGURATION_VALUES_upvr.WEAPON_TYPE).Value == WeaponConstants_upvr.WEAPON_TYPE.GUN then
			local SOME_upvr = ServerWeaponState:WaitForChild(GUN_VALUES_upvr_2.CURRENT_AMMO)
			local SOME_upvr_3 = ServerWeaponState:WaitForChild(GUN_VALUES_upvr_2.LAST_FIRE_TIME)
			local SOME_upvr_2 = ServerWeaponState:WaitForChild(GUN_VALUES_upvr_2.IS_RELOADING)
			local NumberValue_upvr_2 = Instance.new("NumberValue")
			NumberValue_upvr_2.Name = GUN_VALUES_upvr_2.CURRENT_AMMO
			NumberValue_upvr_2.Value = SOME_upvr.Value
			NumberValue_upvr_2.Parent = Folder
			local NumberValue_upvr = Instance.new("NumberValue")
			NumberValue_upvr.Name = GUN_VALUES_upvr_2.LAST_FIRE_TIME
			NumberValue_upvr.Value = SOME_upvr_3.Value
			NumberValue_upvr.Parent = Folder
			local BoolValue_upvr = Instance.new("BoolValue")
			BoolValue_upvr.Name = GUN_VALUES_upvr_2.IS_RELOADING
			BoolValue_upvr.Value = SOME_upvr_2.Value
			BoolValue_upvr.Parent = Folder
			local var64_upvw
			local function onNewServerState() -- Line 262
				--[[ Upvalues[8]:
					[1]: var64_upvw (read and write)
					[2]: BoolValue_upvr (readonly)
					[3]: SOME_upvr_2 (readonly)
					[4]: module_upvr (copied, readonly)
					[5]: NumberValue_upvr_2 (readonly)
					[6]: SOME_upvr (readonly)
					[7]: NumberValue_upvr (readonly)
					[8]: SOME_upvr_3 (readonly)
				]]
				if var64_upvw then
					task.cancel(var64_upvw)
				end
				var64_upvw = task.delay(1, function() -- Line 267
					--[[ Upvalues[7]:
						[1]: BoolValue_upvr (copied, readonly)
						[2]: SOME_upvr_2 (copied, readonly)
						[3]: module_upvr (copied, readonly)
						[4]: NumberValue_upvr_2 (copied, readonly)
						[5]: SOME_upvr (copied, readonly)
						[6]: NumberValue_upvr (copied, readonly)
						[7]: SOME_upvr_3 (copied, readonly)
					]]
					if BoolValue_upvr.Value and not SOME_upvr_2.Value then
						module_upvr.OnServerCancelledReload:Fire()
					end
					NumberValue_upvr_2.Value = SOME_upvr.Value
					NumberValue_upvr.Value = SOME_upvr_3.Value
					BoolValue_upvr.Value = SOME_upvr_2.Value
				end)
			end
			NumberValue_upvr_2.Changed:Connect(onNewServerState)
			NumberValue_upvr.Changed:Connect(onNewServerState)
			BoolValue_upvr.Changed:Connect(onNewServerState)
			SOME_upvr.Changed:Connect(onNewServerState)
			SOME_upvr_3.Changed:Connect(onNewServerState)
			SOME_upvr_2.Changed:Connect(onNewServerState)
			return
		end
		SOME_upvr = "Melee not handled yet:"
		SOME_upvr_3 = arg1:GetFullName()
		warn(SOME_upvr, SOME_upvr_3)
	end
end
function module_upvr._listenForWeapons() -- Line 291
	--[[ Upvalues[3]:
		[1]: CollectionService_upvr (readonly)
		[2]: WeaponConstants_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	CollectionService_upvr:GetInstanceAddedSignal(WeaponConstants_upvr.WEAPON_TAG):Connect(module_upvr._initializeWeapon)
end
local ReplicateShot_upvr = Remotes.Weapon.ReplicateShot
function module_upvr.start() -- Line 295
	--[[ Upvalues[4]:
		[1]: CollectionService_upvr (readonly)
		[2]: WeaponConstants_upvr (readonly)
		[3]: module_upvr (readonly)
		[4]: ReplicateShot_upvr (readonly)
	]]
	for _, v in CollectionService_upvr:GetTagged(WeaponConstants_upvr.WEAPON_TAG) do
		module_upvr._initializeWeapon(v)
	end
	module_upvr._listenForWeapons()
	ReplicateShot_upvr.OnClientEvent:Connect(module_upvr._onServerReplicateShot)
end
return module_upvr