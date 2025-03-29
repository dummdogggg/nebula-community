--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VRBaseCamera
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:50
-- Luau version 6, Types version 3
-- Time taken: 0.007616 seconds

local pcall_result1, pcall_result2 = pcall(function() -- Line 17
	return UserSettings():IsUserFeatureEnabled("UserVRVehicleCamera2")
end)
local VRService_upvr = game:GetService("VRService")
local Lighting_upvr = game:GetService("Lighting")
local UserGameSettings_upvr = UserSettings():GetService("UserGameSettings")
local module_upvr_3 = require(script.Parent:WaitForChild("CameraInput"))
local module_upvr_2 = require(script.Parent:WaitForChild("BaseCamera"))
local setmetatable_result1_2_upvr = setmetatable({}, module_upvr_2)
setmetatable_result1_2_upvr.__index = setmetatable_result1_2_upvr
function setmetatable_result1_2_upvr.new() -- Line 41
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: setmetatable_result1_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr_2.new(), setmetatable_result1_2_upvr)
	setmetatable_result1.gamepadZoomLevels = {0, 7}
	setmetatable_result1.headScale = 1
	setmetatable_result1:SetCameraToSubjectDistance(7)
	setmetatable_result1.VRFadeResetTimer = 0
	setmetatable_result1.VREdgeBlurTimer = 0
	setmetatable_result1.gamepadResetConnection = nil
	setmetatable_result1.needsReset = true
	setmetatable_result1.recentered = false
	setmetatable_result1:Reset()
	return setmetatable_result1
end
function setmetatable_result1_2_upvr.Reset(arg1) -- Line 67
	arg1.stepRotateTimeout = 0
end
function setmetatable_result1_2_upvr.GetModuleName(arg1) -- Line 71
	return "VRBaseCamera"
end
function setmetatable_result1_2_upvr.GamepadZoomPress(arg1) -- Line 75
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	module_upvr_2.GamepadZoomPress(arg1)
	arg1:GamepadReset()
	arg1:ResetZoom()
end
function setmetatable_result1_2_upvr.GamepadReset(arg1) -- Line 83
	arg1.stepRotateTimeout = 0
	arg1.needsReset = true
end
local module_upvr = require(script.Parent:WaitForChild("ZoomController"))
function setmetatable_result1_2_upvr.ResetZoom(arg1) -- Line 88
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	module_upvr.SetZoomParameters(arg1.currentSubjectDistance, 0)
	module_upvr.ReleaseSpring()
end
local var13_upvw = pcall_result1 and pcall_result2
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
function setmetatable_result1_2_upvr.OnEnabledChanged(arg1) -- Line 93
	--[[ Upvalues[6]:
		[1]: module_upvr_2 (readonly)
		[2]: module_upvr_3 (readonly)
		[3]: VRService_upvr (readonly)
		[4]: var13_upvw (read and write)
		[5]: LocalPlayer_upvr (readonly)
		[6]: Lighting_upvr (readonly)
	]]
	module_upvr_2.OnEnabledChanged(arg1)
	if arg1.enabled then
		arg1.gamepadResetConnection = module_upvr_3.gamepadReset:Connect(function() -- Line 97
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:GamepadReset()
		end)
		arg1.thirdPersonOptionChanged = VRService_upvr:GetPropertyChangedSignal("ThirdPersonFollowCamEnabled"):Connect(function() -- Line 102
			--[[ Upvalues[2]:
				[1]: var13_upvw (copied, read and write)
				[2]: arg1 (readonly)
			]]
			if var13_upvw then
				arg1:Reset()
			elseif not arg1:IsInFirstPerson() then
				arg1:Reset()
			end
		end)
		arg1.vrRecentered = VRService_upvr.UserCFrameChanged:Connect(function(arg1_2, arg2) -- Line 113
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if arg1_2 == Enum.UserCFrame.Floor then
				arg1.recentered = true
			end
		end)
	else
		if arg1.inFirstPerson then
			arg1:GamepadZoomPress()
		end
		if arg1.thirdPersonOptionChanged then
			arg1.thirdPersonOptionChanged:Disconnect()
			arg1.thirdPersonOptionChanged = nil
		end
		if arg1.vrRecentered then
			arg1.vrRecentered:Disconnect()
			arg1.vrRecentered = nil
		end
		if arg1.cameraHeadScaleChangedConn then
			arg1.cameraHeadScaleChangedConn:Disconnect()
			arg1.cameraHeadScaleChangedConn = nil
		end
		if arg1.gamepadResetConnection then
			arg1.gamepadResetConnection:Disconnect()
			arg1.gamepadResetConnection = nil
		end
		arg1.VREdgeBlurTimer = 0
		arg1:UpdateEdgeBlur(LocalPlayer_upvr, 1)
		local VRFade = Lighting_upvr:FindFirstChild("VRFade")
		if VRFade then
			VRFade.Brightness = 0
		end
	end
end
function setmetatable_result1_2_upvr.OnCurrentCameraChanged(arg1) -- Line 155
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	module_upvr_2.OnCurrentCameraChanged(arg1)
	if arg1.cameraHeadScaleChangedConn then
		arg1.cameraHeadScaleChangedConn:Disconnect()
		arg1.cameraHeadScaleChangedConn = nil
	end
	local CurrentCamera = workspace.CurrentCamera
	if CurrentCamera then
		arg1.cameraHeadScaleChangedConn = CurrentCamera:GetPropertyChangedSignal("HeadScale"):Connect(function() -- Line 167
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:OnHeadScaleChanged()
		end)
		arg1:OnHeadScaleChanged()
	end
end
function setmetatable_result1_2_upvr.OnHeadScaleChanged(arg1) -- Line 172
	local HeadScale = workspace.CurrentCamera.HeadScale
	for i, v in arg1.gamepadZoomLevels do
		arg1.gamepadZoomLevels[i] = v * HeadScale / arg1.headScale
	end
	arg1:SetCameraToSubjectDistance(arg1:GetCameraToSubjectDistance() * HeadScale / arg1.headScale)
	arg1.headScale = HeadScale
end
function setmetatable_result1_2_upvr.GetVRFocus(arg1, arg2, arg3) -- Line 188
	arg1.cameraTranslationConstraints = Vector3.new(arg1.cameraTranslationConstraints.x, math.min(1, arg1.cameraTranslationConstraints.y + arg3), arg1.cameraTranslationConstraints.z)
	return CFrame.new(Vector3.new(arg2.x, (arg1.lastCameraFocus or arg2).y, arg2.z):Lerp(arg2 + Vector3.new(0, arg1:GetCameraHeight(), 0), arg1.cameraTranslationConstraints.y))
end
function setmetatable_result1_2_upvr.StartFadeFromBlack(arg1) -- Line 204
	--[[ Upvalues[2]:
		[1]: UserGameSettings_upvr (readonly)
		[2]: Lighting_upvr (readonly)
	]]
	if UserGameSettings_upvr.VignetteEnabled == false then
	else
		if not Lighting_upvr:FindFirstChild("VRFade") then
			local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
			ColorCorrectionEffect.Name = "VRFade"
			ColorCorrectionEffect.Parent = Lighting_upvr
		end
		ColorCorrectionEffect.Brightness = -1
		arg1.VRFadeResetTimer = 0.1
	end
end
function setmetatable_result1_2_upvr.UpdateFadeFromBlack(arg1, arg2) -- Line 219
	--[[ Upvalues[1]:
		[1]: Lighting_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local VRFade_2 = Lighting_upvr:FindFirstChild("VRFade")
	local VRFadeResetTimer = arg1.VRFadeResetTimer
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [32] 23. Error Block 4 start (CF ANALYSIS FAILED)
	VRFadeResetTimer.Brightness = math.min(VRFadeResetTimer.Brightness + arg2 * 10, 0)
	do
		return
	end
	-- KONSTANTERROR: [32] 23. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [45] 32. Error Block 8 start (CF ANALYSIS FAILED)
	if VRFade_2 then
		VRFade_2.Brightness = 0
	end
	-- KONSTANTERROR: [45] 32. Error Block 8 end (CF ANALYSIS FAILED)
end
local RunService_upvr = game:GetService("RunService")
function setmetatable_result1_2_upvr.StartVREdgeBlur(arg1, arg2) -- Line 235
	--[[ Upvalues[3]:
		[1]: UserGameSettings_upvr (readonly)
		[2]: RunService_upvr (readonly)
		[3]: VRService_upvr (readonly)
	]]
	if UserGameSettings_upvr.VignetteEnabled == false then
	else
		if not workspace.CurrentCamera:FindFirstChild("VRBlurPart") then
			local Part_upvw = Instance.new("Part")
			Part_upvw.Name = "VRBlurPart"
			Part_upvw.Parent = workspace.CurrentCamera
			Part_upvw.CanTouch = false
			Part_upvw.CanCollide = false
			Part_upvw.CanQuery = false
			Part_upvw.Anchored = true
			Part_upvw.Size = Vector3.new(0.43999, 0.46999, 1)
			Part_upvw.Transparency = 1
			Part_upvw.CastShadow = false
			RunService_upvr.RenderStepped:Connect(function(arg1_3) -- Line 255
				--[[ Upvalues[2]:
					[1]: VRService_upvr (copied, readonly)
					[2]: Part_upvw (read and write)
				]]
				local any_GetUserCFrame_result1 = VRService_upvr:GetUserCFrame(Enum.UserCFrame.Head)
				local var33 = (workspace.CurrentCamera.CFrame) * (CFrame.new(any_GetUserCFrame_result1.p * workspace.CurrentCamera.HeadScale) * (any_GetUserCFrame_result1 - any_GetUserCFrame_result1.p))
				Part_upvw.CFrame = var33 * CFrame.Angles(0, math.pi, 0) + (var33.LookVector) * (1.05 * workspace.CurrentCamera.HeadScale)
				Part_upvw.Size = Vector3.new(0.43999, 0.46999, 1) * workspace.CurrentCamera.HeadScale
			end)
		end
		local VRBlurScreen = arg2.PlayerGui:FindFirstChild("VRBlurScreen")
		local var35
		if VRBlurScreen then
			var35 = VRBlurScreen:FindFirstChild("VRBlur")
			local var36
		end
		if not var35 then
			if not var36 then
				local SurfaceGui = Instance.new("SurfaceGui")
				if not SurfaceGui then
					SurfaceGui = Instance.new("ScreenGui")
				end
				var36 = SurfaceGui
			end
			var36.Name = "VRBlurScreen"
			var36.Parent = arg2.PlayerGui
			var36.Adornee = Part_upvw
			local ImageLabel = Instance.new("ImageLabel")
			ImageLabel.Name = "VRBlur"
			ImageLabel.Parent = var36
			ImageLabel.Image = "rbxasset://textures/ui/VR/edgeBlur.png"
			ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			ImageLabel.Size = UDim2.fromScale(workspace.CurrentCamera.ViewportSize.X * 2.3 / 512, workspace.CurrentCamera.ViewportSize.Y * 2.3 / 512)
			ImageLabel.BackgroundTransparency = 1
			ImageLabel.Active = true
			ImageLabel.ScaleType = Enum.ScaleType.Stretch
		end
		ImageLabel.Visible = true
		ImageLabel.ImageTransparency = 0
		arg1.VREdgeBlurTimer = 0.14
	end
end
function setmetatable_result1_2_upvr.UpdateEdgeBlur(arg1, arg2, arg3) -- Line 304
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local VRBlurScreen_2 = arg2.PlayerGui:FindFirstChild("VRBlurScreen")
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [13] 11. Error Block 3 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [13] 11. Error Block 3 end (CF ANALYSIS FAILED)
end
function setmetatable_result1_2_upvr.GetCameraHeight(arg1) -- Line 329
	if not arg1.inFirstPerson then
		return 0.25881904510252074 * arg1.currentSubjectDistance
	end
	return 0
end
function setmetatable_result1_2_upvr.GetSubjectCFrame(arg1) -- Line 336
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local CurrentCamera_3 = workspace.CurrentCamera
	local var41 = CurrentCamera_3
	if var41 then
		var41 = CurrentCamera_3.CameraSubject
	end
	if not var41 then
		return module_upvr_2.GetSubjectCFrame(arg1)
	end
	local var42
	if var42 then
		if var41:GetState() ~= Enum.HumanoidStateType.Dead then
			var42 = false
		else
			var42 = true
		end
		if var42 and var41 == arg1.lastSubject then
			local lastSubjectCFrame = arg1.lastSubjectCFrame
		end
	end
	if lastSubjectCFrame then
		arg1.lastSubjectCFrame = lastSubjectCFrame
	end
	return lastSubjectCFrame
end
function setmetatable_result1_2_upvr.GetSubjectPosition(arg1) -- Line 362
	--[[ Upvalues[1]:
		[1]: module_upvr_2 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 26 start (CF ANALYSIS FAILED)
	local CurrentCamera_2 = game.Workspace.CurrentCamera
	local var45 = CurrentCamera_2
	if var45 then
		var45 = CurrentCamera_2.CameraSubject
	end
	if var45 then
		local var46
		if var46 then
			if var45:GetState() ~= Enum.HumanoidStateType.Dead then
				var46 = false
			else
				var46 = true
			end
			if var46 and var45 == arg1.lastSubject then
				local lastSubjectPosition = arg1.lastSubjectPosition
				-- KONSTANTWARNING: GOTO [57] #41
			end
		else
			var46 = var45:IsA("VehicleSeat")
			if var46 then
				var46 = var45.CFrame.p
				-- KONSTANTWARNING: GOTO [57] #41
			end
		end
	else
		var46 = nil
		return var46
	end
	-- KONSTANTERROR: [0] 1. Error Block 26 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [57] 41. Error Block 16 start (CF ANALYSIS FAILED)
	arg1.lastSubjectPosition = var46 + var45.CFrame:vectorToWorldSpace(Vector3.new(0, 4, 0))
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	do
		return var46 + var45.CFrame:vectorToWorldSpace(Vector3.new(0, 4, 0))
	end
	-- KONSTANTERROR: [57] 41. Error Block 16 end (CF ANALYSIS FAILED)
end
local any_getUserFlag_result1_upvr = require(script.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil")).getUserFlag("UserCameraInputDt")
function setmetatable_result1_2_upvr.getRotation(arg1, arg2) -- Line 391
	--[[ Upvalues[3]:
		[1]: module_upvr_3 (readonly)
		[2]: UserGameSettings_upvr (readonly)
		[3]: any_getUserFlag_result1_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local any_getRotation_result1 = module_upvr_3.getRotation(arg2)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 18 start (CF ANALYSIS FAILED)
	if any_getUserFlag_result1_upvr then
		return any_getRotation_result1.X
	end
	do
		return any_getRotation_result1.X * 40 * arg2
	end
	-- KONSTANTERROR: [10] 9. Error Block 18 end (CF ANALYSIS FAILED)
end
return setmetatable_result1_2_upvr