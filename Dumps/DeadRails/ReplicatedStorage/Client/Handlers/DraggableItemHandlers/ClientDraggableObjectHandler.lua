--[[
    Script: ReplicatedStorage.Client.Handlers.DraggableItemHandlers.ClientDraggableObjectHandler
    Type: Script
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:46:34
-- Luau version 6, Types version 3
-- Time taken: 0.008008 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = require(ReplicatedStorage.Shared.Remotes)
local RequestStartDrag_upvr = Remotes.Events.RequestStartDrag
local RequestWeld_upvr = Remotes.Events.RequestWeld
local RequestUnweld_upvr = Remotes.Events.RequestUnweld
local FeatureFlags_upvr = require(ReplicatedStorage.Shared.SharedConstants.FeatureFlags)
local HoveringObject_upvr = script:FindFirstChild("HoveringObject")
local ._____Controllers_ActionController_upvr = require("../../Controllers/ActionController")
local DraggableObjectUtil = require(ReplicatedStorage.Shared.Utils.DraggableObjectUtil)
local Tag_upvr = require(ReplicatedStorage.Shared.SharedConstants.Tag)
local ActionData_upvr = require(ReplicatedStorage.Client.DataBanks.ActionData)
local isValidDraggableObject_upvr = DraggableObjectUtil.isValidDraggableObject
local isDraggableObjectWelded_upvr = DraggableObjectUtil.isDraggableObjectWelded
local findFirstAncestorOfClassWithTag_upvr = require(ReplicatedStorage.Shared.Utils.TagUtil).findFirstAncestorOfClassWithTag
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local CurrentCamera_upvr = workspace.CurrentCamera
local DragHighlight_upvr = script:FindFirstChild("DragHighlight")
DragHighlight_upvr.Parent = script
local var18_upvw = false
local var19_upvw
local var20_upvw
local var21_upvw
local var22_upvw = false
local var23_upvw = 0
local X_upvw = Enum.Axis.X
local var25_upvw
local var26_upvw
local var27_upvw
local var28_upvw
local var29_upvw
local function raycastInFrontOfCamera_upvr() -- Line 78, Named "raycastInFrontOfCamera"
	--[[ Upvalues[2]:
		[1]: CurrentCamera_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
	]]
	local RaycastParams_new_result1 = RaycastParams.new()
	RaycastParams_new_result1.FilterType = Enum.RaycastFilterType.Exclude
	RaycastParams_new_result1.FilterDescendantsInstances = {LocalPlayer_upvr.Character}
	return workspace:Raycast(CurrentCamera_upvr.CFrame.Position, CurrentCamera_upvr.CFrame.LookVector * 10, RaycastParams_new_result1)
end
local var32_upvw
local function getDraggableObjectInFrontOfCamera_upvr() -- Line 88, Named "getDraggableObjectInFrontOfCamera"
	--[[ Upvalues[7]:
		[1]: raycastInFrontOfCamera_upvr (readonly)
		[2]: findFirstAncestorOfClassWithTag_upvr (readonly)
		[3]: Tag_upvr (readonly)
		[4]: isValidDraggableObject_upvr (readonly)
		[5]: var18_upvw (read and write)
		[6]: var32_upvw (read and write)
		[7]: HoveringObject_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 26 start (CF ANALYSIS FAILED)
	local raycastInFrontOfCamera_upvr_result1_3 = raycastInFrontOfCamera_upvr()
	if raycastInFrontOfCamera_upvr_result1_3 and raycastInFrontOfCamera_upvr_result1_3.Instance then
		local findFirstAncestorOfClassWithTag_upvr_result1 = findFirstAncestorOfClassWithTag_upvr(raycastInFrontOfCamera_upvr_result1_3.Instance, "Model", Tag_upvr.DraggableObject)
		if findFirstAncestorOfClassWithTag_upvr_result1 then
			local var38 = findFirstAncestorOfClassWithTag_upvr_result1
			if isValidDraggableObject_upvr(var38) then
				if not var18_upvw and var32_upvw then
					if HoveringObject_upvr.Value ~= findFirstAncestorOfClassWithTag_upvr_result1 then
						var38 = false
					else
						var38 = true
					end
					var32_upvw.Enabled = var38
				end
				var32_upvw = findFirstAncestorOfClassWithTag_upvr_result1:FindFirstChild("ObjectInfo")
				do
					return findFirstAncestorOfClassWithTag_upvr_result1
				end
				-- KONSTANTWARNING: GOTO [48] #41
			end
			-- KONSTANTWARNING: GOTO [48] #41
		end
	elseif var32_upvw then
		var32_upvw.Enabled = false
		var32_upvw = nil
	end
	-- KONSTANTERROR: [0] 1. Error Block 26 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [48] 41. Error Block 16 start (CF ANALYSIS FAILED)
	do
		return nil
	end
	-- KONSTANTERROR: [48] 41. Error Block 16 end (CF ANALYSIS FAILED)
end
local isValidWeldTarget_upvr = DraggableObjectUtil.isValidWeldTarget
local function getWeldTargetTouchingObject_upvr(arg1) -- Line 112, Named "getWeldTargetTouchingObject"
	--[[ Upvalues[1]:
		[1]: isValidWeldTarget_upvr (readonly)
	]]
	if not arg1 then
		return nil
	end
	local OverlapParams_new_result1 = OverlapParams.new()
	OverlapParams_new_result1.FilterType = Enum.RaycastFilterType.Exclude
	local tbl = {}
	tbl[1] = arg1
	OverlapParams_new_result1.FilterDescendantsInstances = tbl
	for _, v in workspace:GetPartBoundsInBox(arg1:GetBoundingBox(), arg1:GetExtentsSize() * 1.05, OverlapParams_new_result1), nil do
		if v:IsA("BasePart") and isValidWeldTarget_upvr(v) then
			return v
		end
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return v
end
local function _() -- Line 140, Named "getWeldedObjectInFrontOfCamera"
	--[[ Upvalues[4]:
		[1]: raycastInFrontOfCamera_upvr (readonly)
		[2]: findFirstAncestorOfClassWithTag_upvr (readonly)
		[3]: Tag_upvr (readonly)
		[4]: isValidDraggableObject_upvr (readonly)
	]]
	local raycastInFrontOfCamera_upvr_result1 = raycastInFrontOfCamera_upvr()
	if raycastInFrontOfCamera_upvr_result1 and raycastInFrontOfCamera_upvr_result1.Instance then
		local var14_result1 = findFirstAncestorOfClassWithTag_upvr(raycastInFrontOfCamera_upvr_result1.Instance, "Model", Tag_upvr.WeldedObject)
		if var14_result1 then
			if isValidDraggableObject_upvr(var14_result1) then
				return var14_result1
			end
		end
		return nil
	end
	return nil
end
local function _(arg1) -- Line 153, Named "requestStartDrag"
	--[[ Upvalues[3]:
		[1]: var18_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: RequestStartDrag_upvr (readonly)
	]]
	if var18_upvw then
	else
		if not LocalPlayer_upvr.Character then return end
		RequestStartDrag_upvr:FireServer(arg1)
	end
end
local RequestStopDrag_upvr = Remotes.Events.RequestStopDrag
local function requestStopDrag_upvr() -- Line 164, Named "requestStopDrag"
	--[[ Upvalues[11]:
		[1]: var19_upvw (read and write)
		[2]: RequestStopDrag_upvr (readonly)
		[3]: var28_upvw (read and write)
		[4]: var29_upvw (read and write)
		[5]: var27_upvw (read and write)
		[6]: DragHighlight_upvr (readonly)
		[7]: var18_upvw (read and write)
		[8]: var22_upvw (read and write)
		[9]: var23_upvw (read and write)
		[10]: var25_upvw (read and write)
		[11]: var26_upvw (read and write)
	]]
	if var19_upvw and var19_upvw.PrimaryPart then
		RequestStopDrag_upvr:FireServer()
		if var28_upvw then
			var28_upvw:Destroy()
		end
		if var29_upvw then
			var29_upvw:Destroy()
		end
		if var27_upvw then
			var27_upvw:Destroy()
		end
	end
	if DragHighlight_upvr then
		DragHighlight_upvr.Adornee = nil
	end
	var18_upvw = false
	var19_upvw = nil
	var28_upvw = nil
	var29_upvw = nil
	var27_upvw = nil
	var22_upvw = false
	var23_upvw = 0
	var25_upvw = nil
	if var26_upvw then
		var26_upvw:destroy()
	end
end
local function _() -- Line 200, Named "requestUnweldObject"
	--[[ Upvalues[2]:
		[1]: var20_upvw (read and write)
		[2]: RequestUnweld_upvr (readonly)
	]]
	if not var20_upvw then
	else
		RequestUnweld_upvr:FireServer(var20_upvw)
	end
end
local ._____Controllers_ActionController_InputCategorizer_upvr = require("../../Controllers/ActionController/InputCategorizer")
local function handleDragAction_upvr(arg1, arg2, arg3) -- Line 209, Named "handleDragAction"
	--[[ Upvalues[7]:
		[1]: ._____Controllers_ActionController_InputCategorizer_upvr (readonly)
		[2]: var20_upvw (read and write)
		[3]: isDraggableObjectWelded_upvr (readonly)
		[4]: var18_upvw (read and write)
		[5]: LocalPlayer_upvr (readonly)
		[6]: RequestStartDrag_upvr (readonly)
		[7]: requestStopDrag_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 32 start (CF ANALYSIS FAILED)
	if ._____Controllers_ActionController_InputCategorizer_upvr.getLastInputCategory() == "Gamepad" and arg3.UserInputType == Enum.UserInputType.MouseButton1 then
		return Enum.ContextActionResult.Pass
	end
	if arg2 == Enum.UserInputState.Begin then
		if var20_upvw then
			if isDraggableObjectWelded_upvr(var20_upvw) then
				return Enum.ContextActionResult.Pass
			end
			if var18_upvw then
			elseif not LocalPlayer_upvr.Character then
			else
				RequestStartDrag_upvr:FireServer(var20_upvw)
			end
			do
				return Enum.ContextActionResult.Sink
			end
			-- KONSTANTWARNING: GOTO [57] #43
		end
	elseif arg2 == Enum.UserInputState.End and var18_upvw then
		requestStopDrag_upvr()
		return Enum.ContextActionResult.Sink
	end
	-- KONSTANTERROR: [0] 1. Error Block 32 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [57] 43. Error Block 20 start (CF ANALYSIS FAILED)
	do
		return Enum.ContextActionResult.Pass
	end
	-- KONSTANTERROR: [57] 43. Error Block 20 end (CF ANALYSIS FAILED)
end
local function handleWeldAction_upvr(arg1, arg2) -- Line 240, Named "handleWeldAction"
	--[[ Upvalues[6]:
		[1]: var18_upvw (read and write)
		[2]: var21_upvw (read and write)
		[3]: RequestWeld_upvr (readonly)
		[4]: var19_upvw (read and write)
		[5]: var20_upvw (read and write)
		[6]: RequestUnweld_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 19 start (CF ANALYSIS FAILED)
	if arg2 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	if var18_upvw then
		if var21_upvw then
			RequestWeld_upvr:FireServer(var19_upvw, var21_upvw)
			-- KONSTANTWARNING: GOTO [29] #24
		end
		-- KONSTANTWARNING: GOTO [29] #24
	end
	-- KONSTANTERROR: [0] 1. Error Block 19 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [18] 15. Error Block 20 start (CF ANALYSIS FAILED)
	if not var20_upvw then
	else
		RequestUnweld_upvr:FireServer(var20_upvw)
	end
	do
		return Enum.ContextActionResult.Sink
	end
	-- KONSTANTERROR: [18] 15. Error Block 20 end (CF ANALYSIS FAILED)
end
local function handleSwitchAxisAction_upvr(arg1, arg2) -- Line 258, Named "handleSwitchAxisAction"
	--[[ Upvalues[3]:
		[1]: X_upvw (read and write)
		[2]: var26_upvw (read and write)
		[3]: var23_upvw (read and write)
	]]
	if arg2 == Enum.UserInputState.Begin then
		if X_upvw == Enum.Axis.X then
			X_upvw = Enum.Axis.Y
		elseif X_upvw == Enum.Axis.Y then
			X_upvw = Enum.Axis.Z
		elseif X_upvw == Enum.Axis.Z then
			X_upvw = Enum.Axis.X
		end
		if var26_upvw then
			var26_upvw:setCurrentAxis(X_upvw)
		end
		var23_upvw = tick()
		return Enum.ContextActionResult.Sink
	end
	return Enum.ContextActionResult.Pass
end
local UpdateDrag_upvr = Remotes.Events.UpdateDrag
local function updateDrag_upvr(arg1) -- Line 280, Named "updateDrag"
	--[[ Upvalues[14]:
		[1]: var18_upvw (read and write)
		[2]: var19_upvw (read and write)
		[3]: CurrentCamera_upvr (readonly)
		[4]: ._____Controllers_ActionController_upvr (readonly)
		[5]: ActionData_upvr (readonly)
		[6]: var22_upvw (read and write)
		[7]: var23_upvw (read and write)
		[8]: var25_upvw (read and write)
		[9]: X_upvw (read and write)
		[10]: FeatureFlags_upvr (readonly)
		[11]: Tag_upvr (readonly)
		[12]: UpdateDrag_upvr (readonly)
		[13]: var28_upvw (read and write)
		[14]: var29_upvw (read and write)
	]]
	if not var18_upvw or not var19_upvw or not var19_upvw.PrimaryPart then
	else
		local CFrame = CurrentCamera_upvr.CFrame
		local LookVector = CFrame.LookVector
		local var53 = CFrame.Position + LookVector * 10
		local any_GetPivot_result1 = var19_upvw:GetPivot()
		if ._____Controllers_ActionController_upvr.isBound(ActionData_upvr.Action.RotateObject) and ._____Controllers_ActionController_upvr.isPressed(ActionData_upvr.Action.RotateObject) then
			var22_upvw = true
			var23_upvw = tick()
			if not var25_upvw then
				var25_upvw = any_GetPivot_result1 - any_GetPivot_result1.Position
			elseif var25_upvw then
				if X_upvw == Enum.Axis.X then
					var25_upvw *= CFrame.Angles(arg1 * 4, 0, 0)
				elseif X_upvw == Enum.Axis.Y then
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					var25_upvw *= CFrame.Angles(0, arg1 * 4, 0)
				elseif X_upvw == Enum.Axis.Z then
					-- KONSTANTERROR: Expression was reused, decompilation is incorrect
					var25_upvw *= CFrame.Angles(0, 0, arg1 * 4)
				end
			end
		end
		if FeatureFlags_upvr.Experimental.ServerOwnedDragging or var19_upvw:HasTag(Tag_upvr.RopedObject) then
			UpdateDrag_upvr:FireServer(LookVector, var53)
			return
		end
		if var28_upvw and var29_upvw then
			var28_upvw.Position = var53
			if not var22_upvw then
				var29_upvw.CFrame = CFrame.new(var53, var53 + LookVector)
				return
			end
			var29_upvw.CFrame = CFrame.new(var53) * var25_upvw
		end
	end
end
local RotationGizmo_upvr = require(script.RotationGizmo)
local function onServerDragRequestResponse_upvr(arg1, arg2, arg3) -- Line 333, Named "onServerDragRequestResponse"
	--[[ Upvalues[11]:
		[1]: isValidDraggableObject_upvr (readonly)
		[2]: var18_upvw (read and write)
		[3]: var19_upvw (read and write)
		[4]: var22_upvw (read and write)
		[5]: var26_upvw (read and write)
		[6]: RotationGizmo_upvr (readonly)
		[7]: FeatureFlags_upvr (readonly)
		[8]: Tag_upvr (readonly)
		[9]: var27_upvw (read and write)
		[10]: var28_upvw (read and write)
		[11]: var29_upvw (read and write)
	]]
	if not arg1 or not isValidDraggableObject_upvr(arg3) then
		var18_upvw = false
		var19_upvw = nil
	else
		var18_upvw = true
		var19_upvw = arg3
		var22_upvw = false
		var26_upvw = RotationGizmo_upvr.new(arg3)
		if not FeatureFlags_upvr.Experimental.ServerOwnedDragging then
			if arg3:HasTag(Tag_upvr.RopedObject) then return end
			var27_upvw = Instance.new("Attachment")
			var28_upvw = Instance.new("AlignPosition")
			var29_upvw = Instance.new("AlignOrientation")
			if var19_upvw and var27_upvw and var28_upvw and var29_upvw then
				var27_upvw.Name = "DragAttachment"
				var27_upvw.Parent = var19_upvw.PrimaryPart
				var28_upvw.Name = "DragAlignPosition"
				var28_upvw.Mode = Enum.PositionAlignmentMode.OneAttachment
				var28_upvw.ApplyAtCenterOfMass = false
				var28_upvw.MaxForce = 100000
				var28_upvw.Responsiveness = 50
				var28_upvw.Attachment0 = var27_upvw
				var28_upvw.Parent = var19_upvw.PrimaryPart
				var28_upvw.Position = var19_upvw.PrimaryPart.Position
				var29_upvw.Name = "DragAlignOrientation"
				var29_upvw.Mode = Enum.OrientationAlignmentMode.OneAttachment
				var29_upvw.MaxTorque = 10000
				var29_upvw.Responsiveness = 50
				var29_upvw.Attachment0 = var27_upvw
				var29_upvw.Parent = var19_upvw.PrimaryPart
			end
		end
	end
end
local function onServerUnweldRequestResponse_upvr(arg1, arg2) -- Line 375, Named "onServerUnweldRequestResponse"
end
local function updateInteractionText_upvr() -- Line 379, Named "updateInteractionText"
	--[[ Upvalues[10]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: var18_upvw (read and write)
		[3]: var21_upvw (read and write)
		[4]: var20_upvw (read and write)
		[5]: isDraggableObjectWelded_upvr (readonly)
		[6]: ._____Controllers_ActionController_upvr (readonly)
		[7]: ActionData_upvr (readonly)
		[8]: handleDragAction_upvr (readonly)
		[9]: handleSwitchAxisAction_upvr (readonly)
		[10]: handleWeldAction_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 50 start (CF ANALYSIS FAILED)
	local Character = LocalPlayer_upvr.Character
	if not Character then return end
	local class_Humanoid = Character:FindFirstChildOfClass("Humanoid")
	if not class_Humanoid or class_Humanoid and class_Humanoid.Sit then return end
	-- KONSTANTERROR: [0] 1. Error Block 50 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [22] 20. Error Block 73 start (CF ANALYSIS FAILED)
	if var21_upvw then
		-- KONSTANTWARNING: GOTO [39] #37
	end
	-- KONSTANTERROR: [22] 20. Error Block 73 end (CF ANALYSIS FAILED)
end
local function updateVisuals_upvr() -- Line 491, Named "updateVisuals"
	--[[ Upvalues[7]:
		[1]: var18_upvw (read and write)
		[2]: var19_upvw (read and write)
		[3]: DragHighlight_upvr (readonly)
		[4]: var26_upvw (read and write)
		[5]: CurrentCamera_upvr (readonly)
		[6]: var20_upvw (read and write)
		[7]: var23_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [2] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [16] 15. Error Block 20 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [16] 15. Error Block 20 end (CF ANALYSIS FAILED)
end
local RunService_upvr = game:GetService("RunService")
local DraggingObject_upvr = script:FindFirstChild("DraggingObject")
;(function() -- Line 524, Named "initialize"
	--[[ Upvalues[17]:
		[1]: RequestStartDrag_upvr (readonly)
		[2]: onServerDragRequestResponse_upvr (readonly)
		[3]: RequestWeld_upvr (readonly)
		[4]: requestStopDrag_upvr (readonly)
		[5]: RequestUnweld_upvr (readonly)
		[6]: onServerUnweldRequestResponse_upvr (readonly)
		[7]: RunService_upvr (readonly)
		[8]: var20_upvw (read and write)
		[9]: getDraggableObjectInFrontOfCamera_upvr (readonly)
		[10]: var21_upvw (read and write)
		[11]: getWeldTargetTouchingObject_upvr (readonly)
		[12]: DraggingObject_upvr (readonly)
		[13]: updateDrag_upvr (readonly)
		[14]: updateInteractionText_upvr (readonly)
		[15]: updateVisuals_upvr (readonly)
		[16]: HoveringObject_upvr (readonly)
		[17]: var19_upvw (read and write)
	]]
	RequestStartDrag_upvr.OnClientEvent:Connect(onServerDragRequestResponse_upvr)
	RequestWeld_upvr.OnClientEvent:Connect(function(arg1) -- Line 526
		--[[ Upvalues[1]:
			[1]: requestStopDrag_upvr (copied, readonly)
		]]
		if arg1 then
			requestStopDrag_upvr()
		end
	end)
	RequestUnweld_upvr.OnClientEvent:Connect(onServerUnweldRequestResponse_upvr)
	RunService_upvr.RenderStepped:Connect(function(arg1) -- Line 531
		--[[ Upvalues[10]:
			[1]: var20_upvw (copied, read and write)
			[2]: getDraggableObjectInFrontOfCamera_upvr (copied, readonly)
			[3]: var21_upvw (copied, read and write)
			[4]: getWeldTargetTouchingObject_upvr (copied, readonly)
			[5]: DraggingObject_upvr (copied, readonly)
			[6]: updateDrag_upvr (copied, readonly)
			[7]: updateInteractionText_upvr (copied, readonly)
			[8]: updateVisuals_upvr (copied, readonly)
			[9]: HoveringObject_upvr (copied, readonly)
			[10]: var19_upvw (copied, read and write)
		]]
		var20_upvw = getDraggableObjectInFrontOfCamera_upvr()
		var21_upvw = getWeldTargetTouchingObject_upvr(DraggingObject_upvr.Value)
		local var62 = arg1
		updateDrag_upvr(var62)
		updateInteractionText_upvr()
		updateVisuals_upvr()
		if var20_upvw ~= var19_upvw then
			var62 = var20_upvw
		else
			var62 = nil
		end
		HoveringObject_upvr.Value = var62
		DraggingObject_upvr.Value = var19_upvw
	end)
end)()