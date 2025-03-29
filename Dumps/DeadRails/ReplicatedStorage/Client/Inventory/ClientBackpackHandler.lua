--[[
    Script: ReplicatedStorage.Client.Inventory.ClientBackpackHandler
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:50
-- Luau version 6, Types version 3
-- Time taken: 0.002668 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes_upvr = require(ReplicatedStorage.Shared.Remotes)
local Attribute_upvr = require(ReplicatedStorage.Shared.SharedConstants.Attribute)
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local Inventory_upvr = LocalPlayer_upvr.PlayerGui:WaitForChild("Inventory")
local ArmorFrame_upvr = Inventory_upvr:WaitForChild("ArmorFrame")
local module_upvr = {}
local Satchel_upvr = require(ReplicatedStorage.Packages.Satchel)
function module_upvr.startAsync() -- Line 29
	--[[ Upvalues[2]:
		[1]: Satchel_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	Satchel_upvr:GetStateChangedEvent().Event:Connect(module_upvr._onBackpackToggled)
	module_upvr._listenForLocalCharacter()
	module_upvr._listenForAmmoEventsAsync()
	module_upvr._listenForArmorEventsAsync()
end
function module_upvr._onBackpackToggled(arg1) -- Line 38
	--[[ Upvalues[1]:
		[1]: Inventory_upvr (readonly)
	]]
	Inventory_upvr.Enabled = arg1
end
local AmmoFrame_upvr = Inventory_upvr:WaitForChild("AmmoFrame")
local isAnyGunReloading_upvr = require(ReplicatedStorage.Shared.Utils.isAnyGunReloading)
function module_upvr._listenForAmmoEventsAsync() -- Line 42
	--[[ Upvalues[5]:
		[1]: AmmoFrame_upvr (readonly)
		[2]: isAnyGunReloading_upvr (readonly)
		[3]: LocalPlayer_upvr (readonly)
		[4]: Remotes_upvr (readonly)
		[5]: Attribute_upvr (readonly)
	]]
	AmmoFrame_upvr:WaitForChild("LightAmmo").Activated:Connect(function() -- Line 47
		--[[ Upvalues[4]:
			[1]: isAnyGunReloading_upvr (copied, readonly)
			[2]: LocalPlayer_upvr (copied, readonly)
			[3]: Remotes_upvr (copied, readonly)
			[4]: Attribute_upvr (copied, readonly)
		]]
		if isAnyGunReloading_upvr(LocalPlayer_upvr) then
		else
			Remotes_upvr.Events.DropAmmo:FireServer(Attribute_upvr.LightAmmo)
		end
	end)
	AmmoFrame_upvr:WaitForChild("MediumAmmo").Activated:Connect(function() -- Line 55
		--[[ Upvalues[4]:
			[1]: isAnyGunReloading_upvr (copied, readonly)
			[2]: LocalPlayer_upvr (copied, readonly)
			[3]: Remotes_upvr (copied, readonly)
			[4]: Attribute_upvr (copied, readonly)
		]]
		if isAnyGunReloading_upvr(LocalPlayer_upvr) then
		else
			Remotes_upvr.Events.DropAmmo:FireServer(Attribute_upvr.MediumAmmo)
		end
	end)
	AmmoFrame_upvr:WaitForChild("ShotgunShell").Activated:Connect(function() -- Line 63
		--[[ Upvalues[4]:
			[1]: isAnyGunReloading_upvr (copied, readonly)
			[2]: LocalPlayer_upvr (copied, readonly)
			[3]: Remotes_upvr (copied, readonly)
			[4]: Attribute_upvr (copied, readonly)
		]]
		if isAnyGunReloading_upvr(LocalPlayer_upvr) then
		else
			Remotes_upvr.Events.DropAmmo:FireServer(Attribute_upvr.ShotAmmo)
		end
	end)
end
function module_upvr._listenForArmorEventsAsync() -- Line 72
	--[[ Upvalues[2]:
		[1]: ArmorFrame_upvr (readonly)
		[2]: Remotes_upvr (readonly)
	]]
	ArmorFrame_upvr:WaitForChild("Head").Activated:Connect(function() -- Line 78
		--[[ Upvalues[1]:
			[1]: Remotes_upvr (copied, readonly)
		]]
		Remotes_upvr.Events.DropEquipment:FireServer("Head")
	end)
	ArmorFrame_upvr:WaitForChild("Torso").Activated:Connect(function() -- Line 82
		--[[ Upvalues[1]:
			[1]: Remotes_upvr (copied, readonly)
		]]
		Remotes_upvr.Events.DropEquipment:FireServer("Torso")
	end)
	ArmorFrame_upvr:WaitForChild("RightArm").Activated:Connect(function() -- Line 86
		--[[ Upvalues[1]:
			[1]: Remotes_upvr (copied, readonly)
		]]
		Remotes_upvr.Events.DropEquipment:FireServer("Right Arm")
	end)
	ArmorFrame_upvr:WaitForChild("LeftArm").Activated:Connect(function() -- Line 90
		--[[ Upvalues[1]:
			[1]: Remotes_upvr (copied, readonly)
		]]
		Remotes_upvr.Events.DropEquipment:FireServer("Left Arm")
	end)
end
local LocalPlayerObjectsContainer_upvr = require(ReplicatedStorage.Client.LocalPlayerObjectsContainer)
function module_upvr._listenForLocalCharacter() -- Line 95
	--[[ Upvalues[3]:
		[1]: LocalPlayerObjectsContainer_upvr (readonly)
		[2]: module_upvr (readonly)
		[3]: LocalPlayer_upvr (readonly)
	]]
	local any_getCharacterLoadedWrapper_result1 = LocalPlayerObjectsContainer_upvr.getCharacterLoadedWrapper()
	if any_getCharacterLoadedWrapper_result1:isLoaded() then
		module_upvr._onCharacterAdded(LocalPlayer_upvr.Character)
	end
	any_getCharacterLoadedWrapper_result1.loaded:Connect(module_upvr._onCharacterAdded)
end
local Tag_upvr = require(ReplicatedStorage.Shared.SharedConstants.Tag)
local ImageData_upvr = require(ReplicatedStorage.Client.Inventory.ImageData)
function module_upvr._onCharacterAdded(arg1) -- Line 105
	--[[ Upvalues[4]:
		[1]: Tag_upvr (readonly)
		[2]: Attribute_upvr (readonly)
		[3]: ArmorFrame_upvr (readonly)
		[4]: ImageData_upvr (readonly)
	]]
	local function updateArmorVisuals() -- Line 106
		--[[ Upvalues[5]:
			[1]: arg1 (readonly)
			[2]: Tag_upvr (copied, readonly)
			[3]: Attribute_upvr (copied, readonly)
			[4]: ArmorFrame_upvr (copied, readonly)
			[5]: ImageData_upvr (copied, readonly)
		]]
		-- KONSTANTERROR: [0] 1. Error Block 19 start (CF ANALYSIS FAILED)
		for _, v in arg1:GetChildren() do
			if v:HasTag(Tag_upvr.Equippable) then
				local tbl = {
					name = v.Name;
					slot = v:GetAttribute(Attribute_upvr.EquipmentSlot);
				}
				table.insert({}, tbl)
			end
		end
		local children, NONE, NONE_2 = ArmorFrame_upvr:GetChildren()
		-- KONSTANTERROR: [0] 1. Error Block 19 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [80] 55. Error Block 12 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [80] 55. Error Block 12 end (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [40] 28. Error Block 6 start (CF ANALYSIS FAILED)
		-- KONSTANTERROR: [40] 28. Error Block 6 end (CF ANALYSIS FAILED)
	end
	arg1.ChildAdded:Connect(updateArmorVisuals)
	arg1.ChildRemoved:Connect(updateArmorVisuals)
end
return module_upvr