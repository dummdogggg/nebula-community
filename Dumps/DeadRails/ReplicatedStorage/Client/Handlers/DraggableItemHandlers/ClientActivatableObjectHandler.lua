--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientActivatableObjectHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:43
-- Luau version 6, Types version 3
-- Time taken: 0.002827 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemotePromise_upvr = require(ReplicatedStorage.Packages.RemotePromise)
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local Client = script:FindFirstAncestor("Client")
local HoveringObject_upvr = Client.Handlers:FindFirstChild("ClientDraggableObjectHandler", true).HoveringObject
local var8_upvw
local any_new_result1_upvr = RemotePromise_upvr.new("ActivateObject")
local ClientActivatableObjectCallbacks_upvr = require(Client.DataBanks.ClientActivatableObjectCallbacks)
local function activateObjectActionCallback_upvr(arg1, arg2) -- Line 35, Named "activateObjectActionCallback"
	--[[ Upvalues[4]:
		[1]: var8_upvw (read and write)
		[2]: any_new_result1_upvr (readonly)
		[3]: ClientActivatableObjectCallbacks_upvr (readonly)
		[4]: RemotePromise_upvr (readonly)
	]]
	if arg2 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	if var8_upvw then
		any_new_result1_upvr:InvokeServer(var8_upvw):andThen(function(arg1_2, ...) -- Line 41
			--[[ Upvalues[2]:
				[1]: ClientActivatableObjectCallbacks_upvr (copied, readonly)
				[2]: var8_upvw (copied, read and write)
			]]
			if arg1_2 then
				local var13 = ClientActivatableObjectCallbacks_upvr[var8_upvw.Name]
				if var13 then
					var13(var8_upvw, ...)
				end
			end
		end):timeout(10):catch(function(arg1_3) -- Line 49
			--[[ Upvalues[1]:
				[1]: RemotePromise_upvr (copied, readonly)
			]]
			if RemotePromise_upvr.Error.isKind(arg1_3, RemotePromise_upvr.Error.Kind.TimedOut) then return end
		end)
	end
	return Enum.ContextActionResult.Sink
end
local var15_upvw = false
local ActionController_upvr = require(Client.Controllers.ActionController)
local ActionData_upvr = require(ReplicatedStorage.Client.DataBanks.ActionData)
local function updateBind_upvr(arg1) -- Line 61, Named "updateBind"
	--[[ Upvalues[5]:
		[1]: var15_upvw (read and write)
		[2]: ActionController_upvr (readonly)
		[3]: ActionData_upvr (readonly)
		[4]: activateObjectActionCallback_upvr (readonly)
		[5]: var8_upvw (read and write)
	]]
	if arg1 and not var15_upvw then
		ActionController_upvr.bindAction(ActionData_upvr.Action.ActivateObject, activateObjectActionCallback_upvr, ActionData_upvr.ActionContext[ActionData_upvr.Action.ActivateObject], Enum.KeyCode.E, Enum.KeyCode.DPadLeft, 3)
		var15_upvw = true
	elseif not arg1 and var15_upvw then
		ActionController_upvr.unbindAction(ActionData_upvr.Action.ActivateObject)
		var15_upvw = false
	end
	if var15_upvw and var8_upvw then
		ActionController_upvr.setButtonText(ActionData_upvr.Action.ActivateObject, var8_upvw:GetAttribute("ActivateText") or "Activate")
	end
end
local isValidDraggableObject_upvr = require(ReplicatedStorage.Shared.Utils.DraggableObjectUtil).isValidDraggableObject
local Tag_upvr = require(ReplicatedStorage.Shared.SharedConstants.Tag)
local function update_upvr() -- Line 84, Named "update"
	--[[ Upvalues[6]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: updateBind_upvr (readonly)
		[3]: HoveringObject_upvr (readonly)
		[4]: isValidDraggableObject_upvr (readonly)
		[5]: Tag_upvr (readonly)
		[6]: var8_upvw (read and write)
	]]
	if not LocalPlayer_upvr.Character then
		updateBind_upvr(false)
	else
		local Value = HoveringObject_upvr.Value
		local function INLINED() -- Internal function, doesn't exist in bytecode
			local var21
			return isValidDraggableObject_upvr(Value)
		end
		local function INLINED_2() -- Internal function, doesn't exist in bytecode
			var21 = LocalPlayer_upvr.UserId
			return Value:GetAttribute("OwnerId") == var21
		end
		if Value and INLINED() and Value:HasTag(Tag_upvr.Activatable) and (not Value:GetAttribute("OwnerId") or INLINED_2()) then
			var8_upvw = Value
		else
			var8_upvw = nil
		end
		if var8_upvw == nil then
			var21 = false
		else
			var21 = true
		end
		updateBind_upvr(var21)
	end
end
local function onCharacterAdded(arg1) -- Line 108
	--[[ Upvalues[2]:
		[1]: update_upvr (readonly)
		[2]: updateBind_upvr (readonly)
	]]
	local function handleChildChanged() -- Line 109
		--[[ Upvalues[1]:
			[1]: update_upvr (copied, readonly)
		]]
		update_upvr()
	end
	local any_Connect_result1_upvr = arg1.ChildAdded:Connect(handleChildChanged)
	local any_Connect_result1_upvr_2 = arg1.ChildRemoved:Connect(handleChildChanged)
	arg1.Destroying:Once(function() -- Line 116
		--[[ Upvalues[3]:
			[1]: any_Connect_result1_upvr (readonly)
			[2]: any_Connect_result1_upvr_2 (readonly)
			[3]: updateBind_upvr (copied, readonly)
		]]
		any_Connect_result1_upvr:Disconnect()
		any_Connect_result1_upvr_2:Disconnect()
		updateBind_upvr(false)
	end)
	update_upvr()
end
if LocalPlayer_upvr.Character then
	onCharacterAdded(LocalPlayer_upvr.Character)
end
HoveringObject_upvr.Changed:Connect(update_upvr)
LocalPlayer_upvr.CharacterAdded:Connect(onCharacterAdded)