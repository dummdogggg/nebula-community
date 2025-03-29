--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VRCamera
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:52
-- Luau version 6, Types version 3
-- Time taken: 0.010622 seconds

local Players_upvr = game:GetService("Players")
local VRService_upvr = game:GetService("VRService")
local module_upvr = require(script.Parent:WaitForChild("VRBaseCamera"))
local setmetatable_result1_upvr = setmetatable({}, module_upvr)
setmetatable_result1_upvr.__index = setmetatable_result1_upvr
function setmetatable_result1_upvr.new() -- Line 28
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: setmetatable_result1_upvr (readonly)
		[3]: Players_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr.new(), setmetatable_result1_upvr)
	setmetatable_result1.lastUpdate = tick()
	setmetatable_result1.focusOffset = CFrame.new()
	setmetatable_result1:Reset()
	setmetatable_result1.controlModule = require(Players_upvr.LocalPlayer:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule"))
	setmetatable_result1.savedAutoRotate = true
	return setmetatable_result1
end
function setmetatable_result1_upvr.Reset(arg1) -- Line 41
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	arg1.needsReset = true
	arg1.needsBlackout = true
	arg1.motionDetTime = 0
	arg1.blackOutTimer = 0
	arg1.lastCameraResetPosition = nil
	module_upvr.Reset(arg1)
end
function setmetatable_result1_upvr.Update(arg1, arg2) -- Line 50
	--[[ Upvalues[2]:
		[1]: Players_upvr (readonly)
		[2]: VRService_upvr (readonly)
	]]
	local LocalPlayer = Players_upvr.LocalPlayer
	if arg1.lastUpdate == nil or 1 < arg2 then
		arg1.lastCameraTransform = nil
	end
	arg1:UpdateFadeFromBlack(arg2)
	arg1:UpdateEdgeBlur(LocalPlayer, arg2)
	local any_GetSubjectPosition_result1 = arg1:GetSubjectPosition()
	if arg1.needsBlackout then
		arg1:StartFadeFromBlack()
		arg1.blackOutTimer += math.clamp(arg2, 0.0001, 0.1)
		if 0.1 < arg1.blackOutTimer and game:IsLoaded() then
			arg1.needsBlackout = false
			arg1.needsReset = true
			local var23
		end
	end
	if any_GetSubjectPosition_result1 and LocalPlayer and workspace.CurrentCamera then
		local any_GetVRFocus_result1_3 = arg1:GetVRFocus(any_GetSubjectPosition_result1, arg2)
		if arg1:IsInFirstPerson() then
			if VRService_upvr.AvatarGestures then
				local any_UpdateImmersionCamera_result1_2, any_UpdateImmersionCamera_result2 = arg1:UpdateImmersionCamera(arg2, var23, any_GetVRFocus_result1_3, arg1.lastSubjectPosition, any_GetSubjectPosition_result1)
				var23 = any_UpdateImmersionCamera_result1_2
				any_GetVRFocus_result1_3 = any_UpdateImmersionCamera_result2
				local var27 = any_GetVRFocus_result1_3
			else
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				local any_UpdateFirstPersonTransform_result1, any_UpdateFirstPersonTransform_result2_2 = arg1:UpdateFirstPersonTransform(arg2, var23, var27, arg1.lastSubjectPosition, any_GetSubjectPosition_result1)
				var23 = any_UpdateFirstPersonTransform_result1
				var27 = any_UpdateFirstPersonTransform_result2_2
			end
		elseif VRService_upvr.ThirdPersonFollowCamEnabled then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			local any_UpdateThirdPersonFollowTransform_result1_2, any_UpdateThirdPersonFollowTransform_result2 = arg1:UpdateThirdPersonFollowTransform(arg2, var23, var27, arg1.lastSubjectPosition, any_GetSubjectPosition_result1)
			var23 = any_UpdateThirdPersonFollowTransform_result1_2
			var27 = any_UpdateThirdPersonFollowTransform_result2
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			local any_UpdateThirdPersonComfortTransform_result1_2, any_UpdateThirdPersonComfortTransform_result2_2 = arg1:UpdateThirdPersonComfortTransform(arg2, var23, var27, arg1.lastSubjectPosition, any_GetSubjectPosition_result1)
			var23 = any_UpdateThirdPersonComfortTransform_result1_2
			var27 = any_UpdateThirdPersonComfortTransform_result2_2
		end
		arg1.lastCameraTransform = var23
		arg1.lastCameraFocus = var27
	end
	arg1.lastUpdate = tick()
	return var23, var27
end
function setmetatable_result1_upvr.GetAvatarFeetWorldYValue(arg1) -- Line 112
	local CameraSubject = workspace.CurrentCamera.CameraSubject
	if not CameraSubject then
		return nil
	end
	if CameraSubject:IsA("Humanoid") and CameraSubject.RootPart then
		local RootPart = CameraSubject.RootPart
		return RootPart.Position.Y - RootPart.Size.Y / 2 - CameraSubject.HipHeight
	end
	return nil
end
function setmetatable_result1_upvr.UpdateFirstPersonTransform(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 127
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	if arg1.needsReset then
		arg1:StartFadeFromBlack()
		arg1.needsReset = false
	end
	if 0.01 < (arg5 - arg6).magnitude then
		arg1:StartVREdgeBlur(Players_upvr.LocalPlayer)
	end
	local p = arg4.p
	local any_GetCameraLookVector_result1 = arg1:GetCameraLookVector()
	return CFrame.new(p - 0.5 * arg1:CalculateNewLookVectorFromArg(Vector3.new(any_GetCameraLookVector_result1.X, 0, any_GetCameraLookVector_result1.Z).Unit, Vector2.new(arg1:getRotation(arg2), 0)), p), arg4
end
function setmetatable_result1_upvr.UpdateImmersionCamera(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 153
	--[[ Upvalues[2]:
		[1]: Players_upvr (readonly)
		[2]: VRService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 51 start (CF ANALYSIS FAILED)
	local CurrentCamera = workspace.CurrentCamera
	local Character = Players_upvr.LocalPlayer.Character
	local any_GetHumanoid_result1_3 = arg1:GetHumanoid()
	local var41
	if not any_GetHumanoid_result1_3 then
		return CurrentCamera.CFrame, CurrentCamera.Focus
	end
	local HumanoidRootPart_2 = Character:FindFirstChild("HumanoidRootPart")
	if not HumanoidRootPart_2 then
		return CurrentCamera.CFrame, CurrentCamera.Focus
	end
	arg1.characterOrientation = HumanoidRootPart_2:FindFirstChild("CharacterAlignOrientation")
	if not arg1.characterOrientation then
		local RootAttachment = HumanoidRootPart_2:FindFirstChild("RootAttachment")
		if not RootAttachment then return end
		arg1.characterOrientation = Instance.new("AlignOrientation")
		arg1.characterOrientation.Name = "CharacterAlignOrientation"
		arg1.characterOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
		arg1.characterOrientation.Attachment0 = RootAttachment
		arg1.characterOrientation.RigidityEnabled = true
		arg1.characterOrientation.Parent = HumanoidRootPart_2
	end
	if arg1.characterOrientation.Enabled == false then
		arg1.characterOrientation.Enabled = true
	end
	if arg1.needsReset then
		arg1.needsReset = false
		arg1.savedAutoRotate = any_GetHumanoid_result1_3.AutoRotate
		any_GetHumanoid_result1_3.AutoRotate = false
		if arg1.NoRecenter then
			arg1.NoRecenter = false
			VRService_upvr:RecenterUserHeadCFrame()
		end
		arg1:StartFadeFromBlack()
	elseif any_GetHumanoid_result1_3.Sit then
		if 0.01 < (arg1:GetSubjectCFrame().Position - CurrentCamera.CFrame.Position).Magnitude then
			arg1:StartVREdgeBlur(Players_upvr.LocalPlayer)
			-- KONSTANTWARNING: GOTO [341] #221
		end
	else
		arg1.characterOrientation.CFrame = CurrentCamera.CFrame * arg1.controlModule:GetEstimatedVRTorsoFrame()
		if 0 < arg1.controlModule.inputMoveVector.Magnitude then
			arg1.motionDetTime = 0.1
		end
		if 0 < arg1.controlModule.inputMoveVector.Magnitude or 0 < arg1.motionDetTime then
			arg1.motionDetTime -= arg2
			arg1:StartVREdgeBlur(Players_upvr.LocalPlayer)
			local any_GetUserCFrame_result1_2 = VRService_upvr:GetUserCFrame(Enum.UserCFrame.Head)
			local HumanoidRootPart = Character.HumanoidRootPart
			local LookVector = HumanoidRootPart.CFrame.LookVector
			local _ = arg6 - (CurrentCamera.CFrame * (any_GetUserCFrame_result1_2.Rotation + any_GetUserCFrame_result1_2.Position * CurrentCamera.HeadScale) * CFrame.new(0, -0.7 * HumanoidRootPart.Size.Y / 2, 0) - Vector3.new(LookVector.X, 0, LookVector.Z).Unit * HumanoidRootPart.Size.Y * 0.125).Position + CurrentCamera.CFrame.Position
		else
		end
		local any_getRotation_result1_2 = arg1:getRotation(arg2)
		if 0 < math.abs(any_getRotation_result1_2) then
			local any_GetUserCFrame_result1 = VRService_upvr:GetUserCFrame(Enum.UserCFrame.Head)
			local var50 = any_GetUserCFrame_result1.Rotation + any_GetUserCFrame_result1.Position * CurrentCamera.HeadScale
			local var51 = (CurrentCamera.CFrame.Rotation + Vector3.new(CurrentCamera.CFrame.Position.X, arg6.Y, CurrentCamera.CFrame.Position.Z)) * var50
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 51 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [341] 221. Error Block 30 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	do
		return CFrame.new(var51.Position) * CFrame.Angles(0, -math.rad(any_getRotation_result1_2 * 90), 0) * var51.Rotation * var50:Inverse(), CFrame.new(var51.Position) * CFrame.Angles(0, -math.rad(any_getRotation_result1_2 * 90), 0) * var51.Rotation * var50:Inverse() * CFrame.new(0, 0, -0.5)
	end
	-- KONSTANTERROR: [341] 221. Error Block 30 end (CF ANALYSIS FAILED)
end
function setmetatable_result1_upvr.UpdateThirdPersonComfortTransform(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 265
	--[[ Upvalues[2]:
		[1]: Players_upvr (readonly)
		[2]: VRService_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var61
	if var61 < 0.5 then
		var61 = 0.5
	end
	if arg5 ~= nil then
		local var62
		if arg1.lastCameraFocus ~= nil then
			var62 = true
			if 0.01 >= (arg5 - arg6).magnitude then
				if 0.01 >= arg1.controlModule:GetMoveVector().magnitude then
					var62 = false
				else
					var62 = true
				end
			end
			if var62 then
				arg1.motionDetTime = 0.1
			end
			arg1.motionDetTime -= arg2
			if 0 < arg1.motionDetTime then
				local var63
			end
			if true and not arg1.needsReset then
				var63 = arg1.lastCameraFocus
				arg1.VRCameraFocusFrozen = true
				return arg3, var63
			end
			local var64 = true
			if arg1.lastCameraResetPosition ~= nil then
				if 1 >= (arg6 - arg1.lastCameraResetPosition).Magnitude then
					var64 = false
				else
					var64 = true
				end
			end
			if 0 < math.abs(arg1:getRotation(arg2)) then
			end
			local var66
			if arg1.VRCameraFocusFrozen and var64 or arg1.needsReset then
				VRService_upvr:RecenterUserHeadCFrame()
				arg1.VRCameraFocusFrozen = false
				arg1.needsReset = false
				arg1.lastCameraResetPosition = arg6
				arg1:ResetZoom()
				arg1:StartFadeFromBlack()
				local any_GetHumanoid_result1_4 = arg1:GetHumanoid()
				local function INLINED_2() -- Internal function, doesn't exist in bytecode
					var66 = any_GetHumanoid_result1_4.Torso.CFrame.lookVector
					return var66
				end
				if not any_GetHumanoid_result1_4.Torso or not INLINED_2() then
					var66 = Vector3.new(1, 0, 0)
				end
				local var68 = var63.Position - Vector3.new(var66.X, 0, var66.Z) * var61
			end
		end
	end
	return CFrame.new(var68, Vector3.new(var63.Position.X, var68.Y, var63.Position.Z)), var63
end
function setmetatable_result1_upvr.UpdateThirdPersonFollowTransform(arg1, arg2, arg3, arg4, arg5, arg6) -- Line 332
	--[[ Upvalues[2]:
		[1]: VRService_upvr (readonly)
		[2]: Players_upvr (readonly)
	]]
	local CurrentCamera_2 = workspace.CurrentCamera
	local any_GetCameraToSubjectDistance_result1 = arg1:GetCameraToSubjectDistance()
	local any_GetVRFocus_result1_2 = arg1:GetVRFocus(arg6, arg2)
	local var72
	if arg1.needsReset then
		arg1.needsReset = false
		VRService_upvr:RecenterUserHeadCFrame()
		arg1:ResetZoom()
		arg1:StartFadeFromBlack()
	end
	if arg1.recentered then
		local any_GetSubjectCFrame_result1 = arg1:GetSubjectCFrame()
		if not any_GetSubjectCFrame_result1 then
			return CurrentCamera_2.CFrame, CurrentCamera_2.Focus
		end
		var72 = any_GetVRFocus_result1_2 * any_GetSubjectCFrame_result1.Rotation * CFrame.new(0, 0, any_GetCameraToSubjectDistance_result1)
		arg1.focusOffset = any_GetVRFocus_result1_2:ToObjectSpace(var72)
		arg1.recentered = false
		return var72, any_GetVRFocus_result1_2
	end
	local any_ToWorldSpace_result1 = any_GetVRFocus_result1_2:ToWorldSpace(arg1.focusOffset)
	local controlModule = arg1.controlModule
	if 0.01 < (arg5 - arg6).magnitude or 0 < controlModule:GetMoveVector().magnitude then
		local any_GetEstimatedVRTorsoFrame_result1 = controlModule:GetEstimatedVRTorsoFrame()
		local var77 = CurrentCamera_2.CFrame * (any_GetEstimatedVRTorsoFrame_result1.Rotation + any_GetEstimatedVRTorsoFrame_result1.Position * CurrentCamera_2.HeadScale)
		local LookVector_2 = var77.LookVector
		var72 = any_ToWorldSpace_result1:Lerp(CFrame.new((CurrentCamera_2.CFrame.Position) + (any_GetVRFocus_result1_2.Position - Vector3.new(LookVector_2.X, 0, LookVector_2.Z).Unit * any_GetCameraToSubjectDistance_result1) - var77.Position) * any_ToWorldSpace_result1.Rotation, 0.01)
	else
		var72 = any_ToWorldSpace_result1
	end
	local any_getRotation_result1 = arg1:getRotation(arg2)
	if 0 < math.abs(any_getRotation_result1) then
		var72 = any_GetVRFocus_result1_2 * CFrame.Angles(0, -any_getRotation_result1, 0) * any_GetVRFocus_result1_2:ToObjectSpace(var72)
	end
	arg1.focusOffset = any_GetVRFocus_result1_2:ToObjectSpace(var72)
	local var80 = var72 * CFrame.new(0, 0, -any_GetCameraToSubjectDistance_result1)
	if 0.01 < (var80.Position - CurrentCamera_2.Focus.Position).Magnitude then
		arg1:StartVREdgeBlur(Players_upvr.LocalPlayer)
	end
	return var72, var80
end
function setmetatable_result1_upvr.LeaveFirstPerson(arg1) -- Line 410
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr.LeaveFirstPerson(arg1)
	arg1.needsReset = true
	if arg1.VRBlur then
		arg1.VRBlur.Visible = false
	end
	if arg1.characterOrientation then
		arg1.characterOrientation.Enabled = false
	end
	local any_GetHumanoid_result1_2 = arg1:GetHumanoid()
	if any_GetHumanoid_result1_2 then
		any_GetHumanoid_result1_2.AutoRotate = arg1.savedAutoRotate
	end
end
return setmetatable_result1_upvr