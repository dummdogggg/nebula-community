--[[
    Script: Workspace.ServerBackpackHandler
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:43:51
-- Luau version 6, Types version 3
-- Time taken: 0.003279 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes_upvr = require(ReplicatedStorage.Shared.Remotes)
local Attribute_upvr = require(ReplicatedStorage.Shared.SharedConstants.Attribute)
local PlayerCharacterUtil_upvr = require(game:GetService("ServerScriptService").Server.Utils.PlayerCharacterUtil)
local module_upvr = {}
function module_upvr.start() -- Line 13
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr._listenForClientAmmoEvents()
	module_upvr._listenForClientEquipmentEvents()
end
function module_upvr._listenForClientAmmoEvents() -- Line 18
	--[[ Upvalues[3]:
		[1]: Remotes_upvr (readonly)
		[2]: PlayerCharacterUtil_upvr (readonly)
		[3]: Attribute_upvr (readonly)
	]]
	Remotes_upvr.Events.DropAmmo.OnServerEvent:Connect(function(arg1, arg2) -- Line 19
		--[[ Upvalues[2]:
			[1]: PlayerCharacterUtil_upvr (copied, readonly)
			[2]: Attribute_upvr (copied, readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		-- KONSTANTERROR: [0] 1. Error Block 27 start (CF ANALYSIS FAILED)
		local any_getRequiredCharacterInstances_result1_2, any_getRequiredCharacterInstances_result2 = PlayerCharacterUtil_upvr.getRequiredCharacterInstances(arg1.Character)
		local var17
		if not any_getRequiredCharacterInstances_result1_2 or not any_getRequiredCharacterInstances_result2 then
		else
			local CFrame_2 = any_getRequiredCharacterInstances_result1_2.CFrame
			local Position = CFrame_2.Position
			var17 = nil
			if arg2 == Attribute_upvr.LightAmmo then
				var17 = PlayerCharacterUtil_upvr.dropAmmo(arg1, Attribute_upvr.LightAmmo, Position)
				-- KONSTANTWARNING: GOTO [61] #46
			end
			-- KONSTANTERROR: [0] 1. Error Block 27 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [30] 23. Error Block 28 start (CF ANALYSIS FAILED)
			if arg2 == Attribute_upvr.MediumAmmo then
				var17 = PlayerCharacterUtil_upvr.dropAmmo(arg1, Attribute_upvr.MediumAmmo, Position)
			elseif arg2 == Attribute_upvr.ShotAmmo then
				var17 = PlayerCharacterUtil_upvr.dropAmmo(arg1, Attribute_upvr.ShotAmmo, Position)
			end
			if var17 then
				for _, v_2 in var17 do
					v_2:PivotTo(CFrame.new(Position + CFrame_2.LookVector * 10 + Vector3.new(math.random() * 2 - 1, 0, math.random() * 2 - 1)))
					local _
				end
			end
			-- KONSTANTERROR: [30] 23. Error Block 28 end (CF ANALYSIS FAILED)
		end
	end)
end
function module_upvr._listenForClientEquipmentEvents() -- Line 53
	--[[ Upvalues[3]:
		[1]: Remotes_upvr (readonly)
		[2]: PlayerCharacterUtil_upvr (readonly)
		[3]: module_upvr (readonly)
	]]
	Remotes_upvr.Events.DropEquipment.OnServerEvent:Connect(function(arg1, arg2) -- Line 54
		--[[ Upvalues[2]:
			[1]: PlayerCharacterUtil_upvr (copied, readonly)
			[2]: module_upvr (copied, readonly)
		]]
		if arg2 ~= "Head" and arg2 ~= "Torso" and arg2 ~= "Right Arm" and arg2 ~= "Left Arm" then
		else
			local any_getRequiredCharacterInstances_result1, any_getRequiredCharacterInstances_result2_3 = PlayerCharacterUtil_upvr.getRequiredCharacterInstances(arg1.Character)
			if not any_getRequiredCharacterInstances_result1 or not any_getRequiredCharacterInstances_result2_3 then return end
			local CFrame = any_getRequiredCharacterInstances_result1.CFrame
			local Position_2 = CFrame.Position
			local any__findFirstChildInEquipmentSlot_result1 = module_upvr._findFirstChildInEquipmentSlot(arg1.Character, arg2)
			if any__findFirstChildInEquipmentSlot_result1 then
				if any__findFirstChildInEquipmentSlot_result1:IsA("Accessory") then
					local any_dropAccessory_result1 = PlayerCharacterUtil_upvr.dropAccessory(any__findFirstChildInEquipmentSlot_result1, Position_2)
					if any_dropAccessory_result1 then
						any_dropAccessory_result1:PivotTo(CFrame.new(Position_2 + CFrame.LookVector * 10 + Vector3.new(math.random() * 2 - 1, 0, math.random() * 2 - 1)))
					end
				end
			end
		end
	end)
end
local Tag_upvr = require(ReplicatedStorage.Shared.SharedConstants.Tag)
function module_upvr._findFirstChildInEquipmentSlot(arg1, arg2) -- Line 93
	--[[ Upvalues[2]:
		[1]: Tag_upvr (readonly)
		[2]: Attribute_upvr (readonly)
	]]
	for _, v in arg1:GetChildren() do
		if v:HasTag(Tag_upvr.Equippable) and v:GetAttribute(Attribute_upvr.EquipmentSlot) == arg2 then
			return v
		end
	end
	return nil
end
return module_upvr