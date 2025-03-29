--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientEquippableObjectHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:39
-- Luau version 6, Types version 3
-- Time taken: 0.003131 seconds

local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local HoveringObject_upvr = script.Parent.ClientDraggableObjectHandler.HoveringObject
local .________Shared_Utils_DraggableObjectUtil = require("../../../Shared/Utils/DraggableObjectUtil")
local ._____Controllers_ActionController_upvr = require("../../Controllers/ActionController")
local tbl_upvr = {
	description = "Equip an object";
	showAction = true;
	buttonText = "Equip";
	buttonSize = UDim2.fromOffset(48, 48);
	buttonPosition = UDim2.fromScale(0.92, 0.3);
}
local var7_upvw
local var8_upvw = false
local EquipObject_upvr = game:GetService("ReplicatedStorage").Remotes.Object.EquipObject
local function equipObjectActionCallback_upvr(arg1, arg2) -- Line 37, Named "equipObjectActionCallback"
	--[[ Upvalues[2]:
		[1]: var7_upvw (read and write)
		[2]: EquipObject_upvr (readonly)
	]]
	if arg2 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	if var7_upvw then
		game.SoundService.ArmorEquip:Play()
		EquipObject_upvr:FireServer(var7_upvw)
	end
	return Enum.ContextActionResult.Sink
end
local function _(arg1) -- Line 50, Named "updateEquipBind"
	--[[ Upvalues[4]:
		[1]: var8_upvw (read and write)
		[2]: ._____Controllers_ActionController_upvr (readonly)
		[3]: equipObjectActionCallback_upvr (readonly)
		[4]: tbl_upvr (readonly)
	]]
	if arg1 and not var8_upvw then
		._____Controllers_ActionController_upvr.bindAction("EquipObjectAction", equipObjectActionCallback_upvr, tbl_upvr, Enum.KeyCode.E, Enum.KeyCode.DPadLeft, 3)
		var8_upvw = true
	elseif not arg1 and var8_upvw then
		._____Controllers_ActionController_upvr.unbindAction("EquipObjectAction")
		var8_upvw = false
	end
end
local isValidDraggableObject_upvr = .________Shared_Utils_DraggableObjectUtil.isValidDraggableObject
local isDraggableObjectWelded_upvr = .________Shared_Utils_DraggableObjectUtil.isDraggableObjectWelded
local function update_upvr() -- Line 67, Named "update"
	--[[ Upvalues[9]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: var8_upvw (read and write)
		[3]: ._____Controllers_ActionController_upvr (readonly)
		[4]: HoveringObject_upvr (readonly)
		[5]: isValidDraggableObject_upvr (readonly)
		[6]: isDraggableObjectWelded_upvr (readonly)
		[7]: var7_upvw (read and write)
		[8]: equipObjectActionCallback_upvr (readonly)
		[9]: tbl_upvr (readonly)
	]]
	if not LocalPlayer_upvr.Character then
		if var8_upvw then
			._____Controllers_ActionController_upvr.unbindAction("EquipObjectAction")
			var8_upvw = false
		end
	else
		local Value = HoveringObject_upvr.Value
		local function INLINED() -- Internal function, doesn't exist in bytecode
			local var13
			return var13
		end
		local function INLINED_2() -- Internal function, doesn't exist in bytecode
			var13 = Value:HasTag("Equippable")
			return var13
		end
		local function INLINED_3() -- Internal function, doesn't exist in bytecode
			var13 = Value:GetAttribute("OwnerId")
			return var13
		end
		local function INLINED_4() -- Internal function, doesn't exist in bytecode
			var13 = Value:GetAttribute("OwnerId")
			return var13 == LocalPlayer_upvr.UserId
		end
		if Value and isValidDraggableObject_upvr(Value) and not INLINED() and INLINED_2() and (not INLINED_3() or INLINED_4()) then
			var7_upvw = Value
		else
			var13 = nil
			var7_upvw = var13
		end
		if var7_upvw == nil then
			var13 = false
		else
			var13 = true
		end
		if var13 and not var8_upvw then
			._____Controllers_ActionController_upvr.bindAction("EquipObjectAction", equipObjectActionCallback_upvr, tbl_upvr, Enum.KeyCode.E, Enum.KeyCode.DPadLeft, 3)
			var8_upvw = true
			return
		end
		if not var13 and var8_upvw then
			._____Controllers_ActionController_upvr.unbindAction("EquipObjectAction")
			var8_upvw = false
		end
	end
end
local function onCharacterAdded(arg1) -- Line 91
	--[[ Upvalues[3]:
		[1]: update_upvr (readonly)
		[2]: var8_upvw (read and write)
		[3]: ._____Controllers_ActionController_upvr (readonly)
	]]
	local function handleChildChanged() -- Line 92
		--[[ Upvalues[1]:
			[1]: update_upvr (copied, readonly)
		]]
		update_upvr()
	end
	local any_Connect_result1_upvr = arg1.ChildAdded:Connect(handleChildChanged)
	local any_Connect_result1_upvr_2 = arg1.ChildRemoved:Connect(handleChildChanged)
	arg1.Destroying:Once(function() -- Line 99
		--[[ Upvalues[4]:
			[1]: any_Connect_result1_upvr (readonly)
			[2]: any_Connect_result1_upvr_2 (readonly)
			[3]: var8_upvw (copied, read and write)
			[4]: ._____Controllers_ActionController_upvr (copied, readonly)
		]]
		any_Connect_result1_upvr:Disconnect()
		any_Connect_result1_upvr_2:Disconnect()
		if var8_upvw then
			._____Controllers_ActionController_upvr.unbindAction("EquipObjectAction")
			var8_upvw = false
		end
	end)
	update_upvr()
end
if LocalPlayer_upvr.Character then
	onCharacterAdded(LocalPlayer_upvr.Character)
end
HoveringObject_upvr.Changed:Connect(update_upvr)
LocalPlayer_upvr.CharacterAdded:Connect(onCharacterAdded)