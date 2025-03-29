--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientToolObjectHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:38
-- Luau version 6, Types version 3
-- Time taken: 0.003607 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local HoveringObject_upvr = script.Parent.ClientDraggableObjectHandler.HoveringObject
local .________Shared_Utils_DraggableObjectUtil = require("../../../Shared/Utils/DraggableObjectUtil")
local ._____Controllers_ActionController_upvr = require("../../Controllers/ActionController")
local ActionData_upvr = require(ReplicatedStorage.Client.DataBanks.ActionData)
local var7_upvw
local function getCurrentlyHeldTool_upvr(arg1) -- Line 27, Named "getCurrentlyHeldTool"
	if not arg1 then
		return nil
	end
	for _, v in arg1:GetChildren() do
		if v:IsA("Tool") and v:HasTag("Droppable") then
			return v
		end
	end
	return nil
end
local PickUpTool_upvr = ReplicatedStorage.Remotes.Tool.PickUpTool
local function pickObjectActionCallback_upvr(arg1, arg2) -- Line 41, Named "pickObjectActionCallback"
	--[[ Upvalues[2]:
		[1]: var7_upvw (read and write)
		[2]: PickUpTool_upvr (readonly)
	]]
	if arg2 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	if var7_upvw then
		PickUpTool_upvr:FireServer(var7_upvw)
	end
	return Enum.ContextActionResult.Sink
end
local DropTool_upvr = ReplicatedStorage.Remotes.Tool.DropTool
local function dropObjectActionCallback_upvr(arg1, arg2) -- Line 53, Named "dropObjectActionCallback"
	--[[ Upvalues[3]:
		[1]: getCurrentlyHeldTool_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
		[3]: DropTool_upvr (readonly)
	]]
	if arg2 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	local getCurrentlyHeldTool_upvr_result1 = getCurrentlyHeldTool_upvr(LocalPlayer_upvr.Character)
	if getCurrentlyHeldTool_upvr_result1 then
		DropTool_upvr:FireServer(getCurrentlyHeldTool_upvr_result1)
	end
	return Enum.ContextActionResult.Sink
end
local function updatePickBound_upvr(arg1) -- Line 66, Named "updatePickBound"
	--[[ Upvalues[3]:
		[1]: ._____Controllers_ActionController_upvr (readonly)
		[2]: ActionData_upvr (readonly)
		[3]: pickObjectActionCallback_upvr (readonly)
	]]
	if arg1 and not ._____Controllers_ActionController_upvr.isBound(ActionData_upvr.Action.PickUpObject) then
		._____Controllers_ActionController_upvr.bindAction(ActionData_upvr.Action.PickUpObject, pickObjectActionCallback_upvr, ActionData_upvr.ActionContext[ActionData_upvr.Action.PickUpObject], Enum.KeyCode.E, Enum.KeyCode.DPadLeft, ActionData_upvr.ActionPriority.Low)
	elseif not arg1 then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if ._____Controllers_ActionController_upvr.isBound(ActionData_upvr.Action.PickUpObject) then
			._____Controllers_ActionController_upvr.unbindAction(ActionData_upvr.Action.PickUpObject)
		end
	end
end
local function updateDropBound_upvr(arg1) -- Line 83, Named "updateDropBound"
	--[[ Upvalues[3]:
		[1]: ._____Controllers_ActionController_upvr (readonly)
		[2]: ActionData_upvr (readonly)
		[3]: dropObjectActionCallback_upvr (readonly)
	]]
	if arg1 and not ._____Controllers_ActionController_upvr.isBound(ActionData_upvr.Action.DropObject) then
		._____Controllers_ActionController_upvr.bindAction(ActionData_upvr.Action.DropObject, dropObjectActionCallback_upvr, ActionData_upvr.ActionContext[ActionData_upvr.Action.DropObject], Enum.KeyCode.Backspace, Enum.KeyCode.DPadLeft, ActionData_upvr.ActionPriority.Low)
	elseif not arg1 then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if ._____Controllers_ActionController_upvr.isBound(ActionData_upvr.Action.DropObject) then
			._____Controllers_ActionController_upvr.unbindAction(ActionData_upvr.Action.DropObject)
		end
	end
end
local isValidDraggableObject_upvr = .________Shared_Utils_DraggableObjectUtil.isValidDraggableObject
local isDraggableObjectWelded_upvr = .________Shared_Utils_DraggableObjectUtil.isDraggableObjectWelded
local function update_upvr() -- Line 100, Named "update"
	--[[ Upvalues[8]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: updatePickBound_upvr (readonly)
		[3]: updateDropBound_upvr (readonly)
		[4]: HoveringObject_upvr (readonly)
		[5]: getCurrentlyHeldTool_upvr (readonly)
		[6]: isValidDraggableObject_upvr (readonly)
		[7]: isDraggableObjectWelded_upvr (readonly)
		[8]: var7_upvw (read and write)
	]]
	local Character_2 = LocalPlayer_upvr.Character
	local var22
	if not Character_2 then
		updatePickBound_upvr(false)
		updateDropBound_upvr(false)
	else
		local Value = HoveringObject_upvr.Value
		if Value then
			var22 = Value
			if isValidDraggableObject_upvr(var22) then
				var22 = Value
				if not isDraggableObjectWelded_upvr(var22) and Value:HasTag("ToolObject") then
					local function INLINED_2() -- Internal function, doesn't exist in bytecode
						var22 = LocalPlayer_upvr.UserId
						return Value:GetAttribute("OwnerId") == var22
					end
					if not Value:GetAttribute("OwnerId") or INLINED_2() then
						var7_upvw = Value
						-- KONSTANTWARNING: GOTO [49] #43
					end
				end
			end
		end
		var7_upvw = nil
		if var7_upvw == nil then
			var22 = false
		else
			var22 = true
		end
		updatePickBound_upvr(var22)
		if getCurrentlyHeldTool_upvr(Character_2) == nil then
			var22 = false
		else
			var22 = true
		end
		updateDropBound_upvr(var22)
	end
end
local function onCharacterAdded(arg1) -- Line 126
	--[[ Upvalues[3]:
		[1]: update_upvr (readonly)
		[2]: updatePickBound_upvr (readonly)
		[3]: updateDropBound_upvr (readonly)
	]]
	local function handleChildChanged() -- Line 127
		--[[ Upvalues[1]:
			[1]: update_upvr (copied, readonly)
		]]
		update_upvr()
	end
	local any_Connect_result1_upvr_2 = arg1.ChildAdded:Connect(handleChildChanged)
	local any_Connect_result1_upvr = arg1.ChildRemoved:Connect(handleChildChanged)
	arg1.Destroying:Once(function() -- Line 134
		--[[ Upvalues[4]:
			[1]: any_Connect_result1_upvr_2 (readonly)
			[2]: any_Connect_result1_upvr (readonly)
			[3]: updatePickBound_upvr (copied, readonly)
			[4]: updateDropBound_upvr (copied, readonly)
		]]
		any_Connect_result1_upvr_2:Disconnect()
		any_Connect_result1_upvr:Disconnect()
		updatePickBound_upvr(false)
		updateDropBound_upvr(false)
	end)
	update_upvr()
end
if LocalPlayer_upvr.Character then
	onCharacterAdded(LocalPlayer_upvr.Character)
end
HoveringObject_upvr.Changed:Connect(update_upvr)
LocalPlayer_upvr.CharacterAdded:Connect(onCharacterAdded)