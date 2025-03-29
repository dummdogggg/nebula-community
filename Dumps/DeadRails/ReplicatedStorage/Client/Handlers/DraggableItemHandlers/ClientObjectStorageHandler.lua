--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientObjectStorageHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:36
-- Luau version 6, Types version 3
-- Time taken: 0.002427 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService_upvr = game:GetService("RunService")
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local HoveringObject_upvr = script.Parent.ClientDraggableObjectHandler.HoveringObject
local ._____Controllers_ActionController_upvr = require("../../Controllers/ActionController")
local ActionData_upvr = require(ReplicatedStorage.Client.DataBanks.ActionData)
local DraggableObjectUtil = require(ReplicatedStorage.Shared.Utils.DraggableObjectUtil)
local var9_upvw
local StoreItem_upvr = ReplicatedStorage.Remotes.StoreItem
local DropItem_upvr = ReplicatedStorage.Remotes.DropItem
local function storeObjectActionCallback_upvr(arg1, arg2) -- Line 31, Named "storeObjectActionCallback"
	--[[ Upvalues[3]:
		[1]: var9_upvw (read and write)
		[2]: StoreItem_upvr (readonly)
		[3]: DropItem_upvr (readonly)
	]]
	if arg2 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	if var9_upvw then
		StoreItem_upvr:FireServer(var9_upvw)
	else
		DropItem_upvr:FireServer()
	end
	return Enum.ContextActionResult.Sink
end
local function updateStoreBinding_upvr(arg1) -- Line 45, Named "updateStoreBinding"
	--[[ Upvalues[3]:
		[1]: ._____Controllers_ActionController_upvr (readonly)
		[2]: ActionData_upvr (readonly)
		[3]: storeObjectActionCallback_upvr (readonly)
	]]
	if arg1 ~= ._____Controllers_ActionController_upvr.isBound(ActionData_upvr.Action.StoreObject) then
		if arg1 then
			._____Controllers_ActionController_upvr.bindAction(ActionData_upvr.Action.StoreObject, storeObjectActionCallback_upvr, ActionData_upvr.ActionContext[ActionData_upvr.Action.StoreObject], Enum.KeyCode.F, Enum.KeyCode.ButtonY, ActionData_upvr.ActionPriority.Low)
			return
		end
		._____Controllers_ActionController_upvr.unbindAction(ActionData_upvr.Action.StoreObject)
	end
end
HoveringObject_upvr.Changed:Connect(function() -- Line 63
	--[[ Upvalues[3]:
		[1]: ._____Controllers_ActionController_upvr (readonly)
		[2]: ActionData_upvr (readonly)
		[3]: var9_upvw (read and write)
	]]
	if ._____Controllers_ActionController_upvr.isBound(ActionData_upvr.Action.StoreObject) then
		local Action = ActionData_upvr.Action
		if var9_upvw then
			Action = "Store"
		else
			Action = "Unstore"
		end
		._____Controllers_ActionController_upvr.setButtonText(Action.StoreObject, Action)
	end
end)
local function onCharacterAdded_upvr(arg1) -- Line 70, Named "onCharacterAdded"
	--[[ Upvalues[4]:
		[1]: updateStoreBinding_upvr (readonly)
		[2]: ._____Controllers_ActionController_upvr (readonly)
		[3]: ActionData_upvr (readonly)
		[4]: var9_upvw (read and write)
	]]
	local function updateStoreAction_upvr() -- Line 71, Named "updateStoreAction"
		--[[ Upvalues[5]:
			[1]: arg1 (readonly)
			[2]: updateStoreBinding_upvr (copied, readonly)
			[3]: ._____Controllers_ActionController_upvr (copied, readonly)
			[4]: ActionData_upvr (copied, readonly)
			[5]: var9_upvw (copied, read and write)
		]]
		local class_Tool = arg1:FindFirstChildOfClass("Tool")
		local var15
		if class_Tool and class_Tool.Name == "Sack" then
			var15 = true
		end
		updateStoreBinding_upvr(var15)
		if var15 and ._____Controllers_ActionController_upvr.isBound(ActionData_upvr.Action.StoreObject) then
			local Action_2 = ActionData_upvr.Action
			if var9_upvw then
				Action_2 = "Store"
			else
				Action_2 = "Unstore"
			end
			._____Controllers_ActionController_upvr.setButtonText(Action_2.StoreObject, Action_2)
		end
	end
	updateStoreAction_upvr()
	local function handleChildChanged() -- Line 91
		--[[ Upvalues[1]:
			[1]: updateStoreAction_upvr (readonly)
		]]
		updateStoreAction_upvr()
	end
	local any_Connect_result1_upvr = arg1.ChildAdded:Connect(handleChildChanged)
	local any_Connect_result1_upvr_2 = arg1.ChildRemoved:Connect(handleChildChanged)
	arg1.Destroying:Once(function() -- Line 98
		--[[ Upvalues[3]:
			[1]: any_Connect_result1_upvr (readonly)
			[2]: any_Connect_result1_upvr_2 (readonly)
			[3]: updateStoreBinding_upvr (copied, readonly)
		]]
		any_Connect_result1_upvr:Disconnect()
		any_Connect_result1_upvr_2:Disconnect()
		updateStoreBinding_upvr(false)
	end)
end
local isValidDraggableObject_upvr = DraggableObjectUtil.isValidDraggableObject
local isDraggableObjectWelded_upvr = DraggableObjectUtil.isDraggableObjectWelded
local function onRenderStepped_upvr() -- Line 105, Named "onRenderStepped"
	--[[ Upvalues[4]:
		[1]: var9_upvw (read and write)
		[2]: HoveringObject_upvr (readonly)
		[3]: isValidDraggableObject_upvr (readonly)
		[4]: isDraggableObjectWelded_upvr (readonly)
	]]
	var9_upvw = nil
	local Value = HoveringObject_upvr.Value
	if not Value then
	else
		if not isValidDraggableObject_upvr(Value) then return end
		if isDraggableObjectWelded_upvr(Value) then return end
		var9_upvw = Value
	end
end
local function _() -- Line 125, Named "initialize"
	--[[ Upvalues[4]:
		[1]: RunService_upvr (readonly)
		[2]: onRenderStepped_upvr (readonly)
		[3]: LocalPlayer_upvr (readonly)
		[4]: onCharacterAdded_upvr (readonly)
	]]
	RunService_upvr.RenderStepped:Connect(onRenderStepped_upvr)
	if LocalPlayer_upvr.Character then
		task.spawn(onCharacterAdded_upvr, LocalPlayer_upvr.Character)
	end
	LocalPlayer_upvr.CharacterAdded:Connect(onCharacterAdded_upvr)
end
RunService_upvr.RenderStepped:Connect(onRenderStepped_upvr)
if LocalPlayer_upvr.Character then
	task.spawn(onCharacterAdded_upvr, LocalPlayer_upvr.Character)
end
LocalPlayer_upvr.CharacterAdded:Connect(onCharacterAdded_upvr)