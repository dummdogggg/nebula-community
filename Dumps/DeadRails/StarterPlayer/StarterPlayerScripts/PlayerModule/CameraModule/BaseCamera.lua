--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.BaseCamera
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:12
-- Luau version 6, Types version 3
-- Time taken: 0.022583 seconds

local UserInputService_upvr = game:GetService("UserInputService")
local UserGameSettings_upvr = UserSettings():GetService("UserGameSettings")
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local module = require(CommonUtils:WaitForChild("FlagUtil"))
local module_2_upvr = require(script.Parent:WaitForChild("CameraUtils"))
local module_3_upvr = require(script.Parent:WaitForChild("ZoomController"))
local module_upvr_2 = require(script.Parent:WaitForChild("CameraInput"))
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local pcall_result1, pcall_result2 = pcall(function() -- Line 24
	return UserSettings():IsUserFeatureEnabled("UserFixGamepadMaxZoom")
end)
local any_getUserFlag_result1_upvr_2 = module.getUserFlag("UserFixCameraOffsetJitter2")
local any_getUserFlag_result1_upvr = module.getUserFlag("UserOrganizeBaseCameraConnections")
local tbl_upvr = {
	CHARACTER_ADDED = "CHARACTER_ADDED";
	CAMERA_MODE_CHANGED = "CAMERA_MODE_CHANGED";
	CAMERA_MIN_DISTANCE_CHANGED = "CAMERA_MIN_DISTANCE_CHANGED";
	CAMERA_MAX_DISTANCE_CHANGED = "CAMERA_MAX_DISTANCE_CHANGED";
}
local module_4_upvr = {}
module_4_upvr.__index = module_4_upvr
local module_upvr = require(CommonUtils:WaitForChild("ConnectionUtil"))
function module_4_upvr.new() -- Line 80
	--[[ Upvalues[5]:
		[1]: module_4_upvr (readonly)
		[2]: module_upvr (readonly)
		[3]: LocalPlayer_upvr (readonly)
		[4]: any_getUserFlag_result1_upvr (readonly)
		[5]: UserGameSettings_upvr (readonly)
	]]
	local setmetatable_result1_upvr = setmetatable({}, module_4_upvr)
	setmetatable_result1_upvr._connections = module_upvr.new()
	setmetatable_result1_upvr.gamepadZoomLevels = {0, 10, 20}
	setmetatable_result1_upvr.FIRST_PERSON_DISTANCE_THRESHOLD = 1
	setmetatable_result1_upvr.cameraType = nil
	setmetatable_result1_upvr.cameraMovementMode = nil
	setmetatable_result1_upvr.lastCameraTransform = nil
	setmetatable_result1_upvr.lastUserPanCamera = tick()
	setmetatable_result1_upvr.humanoidRootPart = nil
	setmetatable_result1_upvr.humanoidCache = {}
	setmetatable_result1_upvr.lastSubject = nil
	setmetatable_result1_upvr.lastSubjectPosition = Vector3.new(0, 5, 0)
	setmetatable_result1_upvr.lastSubjectCFrame = CFrame.new(setmetatable_result1_upvr.lastSubjectPosition)
	setmetatable_result1_upvr.currentSubjectDistance = math.clamp(12.5, LocalPlayer_upvr.CameraMinZoomDistance, LocalPlayer_upvr.CameraMaxZoomDistance)
	setmetatable_result1_upvr.inFirstPerson = false
	setmetatable_result1_upvr.inMouseLockedMode = false
	setmetatable_result1_upvr.portraitMode = false
	setmetatable_result1_upvr.isSmallTouchScreen = false
	setmetatable_result1_upvr.resetCameraAngle = true
	setmetatable_result1_upvr.enabled = false
	setmetatable_result1_upvr.PlayerGui = nil
	setmetatable_result1_upvr.cameraChangedConn = nil
	setmetatable_result1_upvr.viewportSizeChangedConn = nil
	setmetatable_result1_upvr.shouldUseVRRotation = false
	setmetatable_result1_upvr.VRRotationIntensityAvailable = false
	setmetatable_result1_upvr.lastVRRotationIntensityCheckTime = 0
	setmetatable_result1_upvr.lastVRRotationTime = 0
	setmetatable_result1_upvr.vrRotateKeyCooldown = {}
	setmetatable_result1_upvr.cameraTranslationConstraints = Vector3.new(1, 1, 1)
	setmetatable_result1_upvr.humanoidJumpOrigin = nil
	setmetatable_result1_upvr.trackingHumanoid = nil
	setmetatable_result1_upvr.cameraFrozen = false
	setmetatable_result1_upvr.subjectStateChangedConn = nil
	setmetatable_result1_upvr.gamepadZoomPressConnection = nil
	setmetatable_result1_upvr.mouseLockOffset = Vector3.new(0, 0, 0)
	if not any_getUserFlag_result1_upvr then
		if LocalPlayer_upvr.Character then
			setmetatable_result1_upvr:OnCharacterAdded(LocalPlayer_upvr.Character)
		end
		LocalPlayer_upvr.CharacterAdded:Connect(function(arg1) -- Line 145
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:OnCharacterAdded(arg1)
		end)
		if setmetatable_result1_upvr.playerCameraModeChangeConn then
			setmetatable_result1_upvr.playerCameraModeChangeConn:Disconnect()
		end
		setmetatable_result1_upvr.playerCameraModeChangeConn = LocalPlayer_upvr:GetPropertyChangedSignal("CameraMode"):Connect(function() -- Line 150
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:OnPlayerCameraPropertyChange()
		end)
		if setmetatable_result1_upvr.minDistanceChangeConn then
			setmetatable_result1_upvr.minDistanceChangeConn:Disconnect()
		end
		setmetatable_result1_upvr.minDistanceChangeConn = LocalPlayer_upvr:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function() -- Line 155
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:OnPlayerCameraPropertyChange()
		end)
		if setmetatable_result1_upvr.maxDistanceChangeConn then
			setmetatable_result1_upvr.maxDistanceChangeConn:Disconnect()
		end
		setmetatable_result1_upvr.maxDistanceChangeConn = LocalPlayer_upvr:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function() -- Line 160
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:OnPlayerCameraPropertyChange()
		end)
		if setmetatable_result1_upvr.playerDevTouchMoveModeChangeConn then
			setmetatable_result1_upvr.playerDevTouchMoveModeChangeConn:Disconnect()
		end
		setmetatable_result1_upvr.playerDevTouchMoveModeChangeConn = LocalPlayer_upvr:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() -- Line 165
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:OnDevTouchMovementModeChanged()
		end)
		setmetatable_result1_upvr:OnDevTouchMovementModeChanged()
		if setmetatable_result1_upvr.gameSettingsTouchMoveMoveChangeConn then
			setmetatable_result1_upvr.gameSettingsTouchMoveMoveChangeConn:Disconnect()
		end
		setmetatable_result1_upvr.gameSettingsTouchMoveMoveChangeConn = UserGameSettings_upvr:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() -- Line 171
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:OnGameSettingsTouchMovementModeChanged()
		end)
		setmetatable_result1_upvr:OnGameSettingsTouchMovementModeChanged()
		setmetatable_result1_upvr.hasGameLoaded = game:IsLoaded()
		if not setmetatable_result1_upvr.hasGameLoaded then
			setmetatable_result1_upvr.gameLoadedConn = game.Loaded:Connect(function() -- Line 179
				--[[ Upvalues[1]:
					[1]: setmetatable_result1_upvr (readonly)
				]]
				setmetatable_result1_upvr.hasGameLoaded = true
				setmetatable_result1_upvr.gameLoadedConn:Disconnect()
				setmetatable_result1_upvr.gameLoadedConn = nil
			end)
		end
		setmetatable_result1_upvr:OnPlayerCameraPropertyChange()
	end
	UserGameSettings_upvr:SetCameraYInvertVisible()
	UserGameSettings_upvr:SetGamepadCameraSensitivityVisible()
	return setmetatable_result1_upvr
end
function module_4_upvr.GetModuleName(arg1) -- Line 196
	return "BaseCamera"
end
if any_getUserFlag_result1_upvr then
	function module_4_upvr._setUpConfigurations(arg1) -- Line 201
		--[[ Upvalues[2]:
			[1]: tbl_upvr (readonly)
			[2]: LocalPlayer_upvr (readonly)
		]]
		arg1._connections:trackConnection(tbl_upvr.CHARACTER_ADDED, LocalPlayer_upvr.CharacterAdded:Connect(function(arg1_2) -- Line 202
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:OnCharacterAdded(arg1_2)
		end))
		if LocalPlayer_upvr.Character then
			arg1:OnCharacterAdded(LocalPlayer_upvr.Character)
		end
		arg1._connections:trackConnection(tbl_upvr.CAMERA_MODE_CHANGED, LocalPlayer_upvr:GetPropertyChangedSignal("CameraMode"):Connect(function() -- Line 209
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:OnPlayerCameraPropertyChange()
		end))
		arg1._connections:trackConnection(tbl_upvr.CAMERA_MIN_DISTANCE_CHANGED, LocalPlayer_upvr:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function() -- Line 212
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:OnPlayerCameraPropertyChange()
		end))
		arg1._connections:trackConnection(tbl_upvr.CAMERA_MAX_DISTANCE_CHANGED, LocalPlayer_upvr:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function() -- Line 215
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:OnPlayerCameraPropertyChange()
		end))
		arg1:OnPlayerCameraPropertyChange()
	end
end
function module_4_upvr.OnCharacterAdded(arg1, arg2) -- Line 222
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
	]]
	local resetCameraAngle = arg1.resetCameraAngle
	if not resetCameraAngle then
		resetCameraAngle = arg1:GetEnabled()
	end
	arg1.resetCameraAngle = resetCameraAngle
	arg1.humanoidRootPart = nil
	if UserInputService_upvr.TouchEnabled then
		arg1.PlayerGui = LocalPlayer_upvr:WaitForChild("PlayerGui")
		for _, v in ipairs(arg2:GetChildren()) do
			if v:IsA("Tool") then
				arg1.isAToolEquipped = true
			end
		end
		arg2.ChildAdded:Connect(function(arg1_3) -- Line 232
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if arg1_3:IsA("Tool") then
				arg1.isAToolEquipped = true
			end
		end)
		arg2.ChildRemoved:Connect(function(arg1_4) -- Line 237
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			if arg1_4:IsA("Tool") then
				arg1.isAToolEquipped = false
			end
		end)
	end
end
function module_4_upvr.GetHumanoidRootPart(arg1) -- Line 245
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	if not arg1.humanoidRootPart then
		if LocalPlayer_upvr.Character then
			local class_Humanoid = LocalPlayer_upvr.Character:FindFirstChildOfClass("Humanoid")
			if class_Humanoid then
				arg1.humanoidRootPart = class_Humanoid.RootPart
			end
		end
	end
	return arg1.humanoidRootPart
end
function module_4_upvr.GetBodyPartToFollow(arg1, arg2, arg3) -- Line 257
	if arg2:GetState() == Enum.HumanoidStateType.Dead then
		local Parent_2 = arg2.Parent
		if Parent_2 and Parent_2:IsA("Model") then
			local Head_2 = Parent_2:FindFirstChild("Head")
			if not Head_2 then
				Head_2 = arg2.RootPart
			end
			return Head_2
		end
	end
	return arg2.RootPart
end
function module_4_upvr.GetSubjectCFrame(arg1) -- Line 269
	--[[ Upvalues[1]:
		[1]: any_getUserFlag_result1_upvr_2 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local CurrentCamera_4 = workspace.CurrentCamera
	local var54 = CurrentCamera_4
	if var54 then
		var54 = CurrentCamera_4.CameraSubject
	end
	if not var54 then
		return arg1.lastSubjectCFrame
	end
	if var54:IsA("Humanoid") then
		local var55
		if var54:GetState() ~= Enum.HumanoidStateType.Dead then
			var55 = false
		else
			var55 = true
		end
		if any_getUserFlag_result1_upvr_2 and arg1:GetIsMouseLocked() then
		end
		local RootPart_4 = var54.RootPart
		if var55 and var54.Parent and var54.Parent:IsA("Model") then
			RootPart_4 = var54.Parent:FindFirstChild("Head") or RootPart_4
		end
		if RootPart_4 then
			local var57
			if var57 then
				var57 = nil
				if var54.RigType == Enum.HumanoidRigType.R15 then
					if var54.AutomaticScalingEnabled then
						var57 = Vector3.new(0, 1.5, 0)
						local RootPart_5 = var54.RootPart
						if RootPart_4 == RootPart_5 then
							var57 += Vector3.new(0, (RootPart_5.Size.Y - Vector3.new(2, 2, 1).Y) / 2, 0)
							-- KONSTANTWARNING: GOTO [102] #74
						end
					else
						var57 = Vector3.new(0, 2, 0)
					end
				else
					var57 = Vector3.new(0, 1.5, 0)
				end
				if var55 then
					var57 = Vector3.new(0, 0, 0)
				end
				local _ = RootPart_4.CFrame * CFrame.new(var57 + Vector3.new())
				-- KONSTANTWARNING: GOTO [137] #101
			end
			-- KONSTANTWARNING: GOTO [137] #101
		end
	else
		RootPart_4 = "BasePart"
		var55 = var54:IsA(RootPart_4)
		if var55 then
		else
			RootPart_4 = "Model"
			var55 = var54:IsA(RootPart_4)
			if var55 then
				var55 = var54.PrimaryPart
				if var55 then
					var55 = var54:GetPrimaryPartCFrame()
				else
					var55 = CFrame.new()
				end
			end
		end
	end
	if var55 then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		arg1.lastSubjectCFrame = var55
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	return var55
end
function module_4_upvr.GetSubjectVelocity(arg1) -- Line 343
	-- KONSTANTERROR: [0] 1. Error Block 23 start (CF ANALYSIS FAILED)
	local CurrentCamera_2 = workspace.CurrentCamera
	local var65 = CurrentCamera_2
	if var65 then
		var65 = CurrentCamera_2.CameraSubject
	end
	if not var65 then
		return Vector3.new(0, 0, 0)
	end
	if var65:IsA("BasePart") then
		return var65.Velocity
	end
	if var65:IsA("Humanoid") then
		local RootPart_6 = var65.RootPart
		if RootPart_6 then
			do
				return RootPart_6.Velocity
			end
			-- KONSTANTWARNING: GOTO [42] #32
		end
	elseif var65:IsA("Model") then
		local PrimaryPart = var65.PrimaryPart
		if PrimaryPart then
			return PrimaryPart.Velocity
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 23 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [42] 32. Error Block 14 start (CF ANALYSIS FAILED)
	do
		return Vector3.new(0, 0, 0)
	end
	-- KONSTANTERROR: [42] 32. Error Block 14 end (CF ANALYSIS FAILED)
end
function module_4_upvr.GetSubjectRotVelocity(arg1) -- Line 372
	-- KONSTANTERROR: [0] 1. Error Block 23 start (CF ANALYSIS FAILED)
	local CurrentCamera_7 = workspace.CurrentCamera
	local var69 = CurrentCamera_7
	if var69 then
		var69 = CurrentCamera_7.CameraSubject
	end
	if not var69 then
		return Vector3.new(0, 0, 0)
	end
	if var69:IsA("BasePart") then
		return var69.RotVelocity
	end
	if var69:IsA("Humanoid") then
		local RootPart_3 = var69.RootPart
		if RootPart_3 then
			do
				return RootPart_3.RotVelocity
			end
			-- KONSTANTWARNING: GOTO [42] #32
		end
	elseif var69:IsA("Model") then
		local PrimaryPart_3 = var69.PrimaryPart
		if PrimaryPart_3 then
			return PrimaryPart_3.RotVelocity
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 23 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [42] 32. Error Block 14 start (CF ANALYSIS FAILED)
	do
		return Vector3.new(0, 0, 0)
	end
	-- KONSTANTERROR: [42] 32. Error Block 14 end (CF ANALYSIS FAILED)
end
function module_4_upvr.StepZoom(arg1) -- Line 401
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: module_3_upvr (readonly)
	]]
	local _ = arg1.currentSubjectDistance
	local var74
	if 0 < var74 then
		var74 = nil
		if 0 < module_upvr_2.getZoomDelta() then
			var74 = _ + module_upvr_2.getZoomDelta() * (_ * 0.5 + 1)
			var74 = math.max(var74, arg1.FIRST_PERSON_DISTANCE_THRESHOLD)
		else
			var74 = (_ + module_upvr_2.getZoomDelta()) / (1 - module_upvr_2.getZoomDelta() * 0.5)
			var74 = math.max(var74, 0.5)
		end
		if var74 < arg1.FIRST_PERSON_DISTANCE_THRESHOLD then
		end
		arg1:SetCameraToSubjectDistance(0.5)
	end
	return module_3_upvr.GetZoomRadius()
end
function module_4_upvr.GetSubjectPosition(arg1) -- Line 426
	--[[ Upvalues[1]:
		[1]: any_getUserFlag_result1_upvr_2 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 75 start (CF ANALYSIS FAILED)
	local CurrentCamera_9 = game.Workspace.CurrentCamera
	local var76 = CurrentCamera_9
	if var76 then
		var76 = CurrentCamera_9.CameraSubject
	end
	if var76 then
		if var76:IsA("Humanoid") then
			local var77
			if var76:GetState() ~= Enum.HumanoidStateType.Dead then
				var77 = false
			else
				var77 = true
			end
			if any_getUserFlag_result1_upvr_2 and arg1:GetIsMouseLocked() then
			end
			local RootPart_7 = var76.RootPart
			if var77 and var76.Parent and var76.Parent:IsA("Model") then
				RootPart_7 = var76.Parent:FindFirstChild("Head") or RootPart_7
			end
			if RootPart_7 then
				local var79
				if var79 then
					var79 = nil
					if var76.RigType == Enum.HumanoidRigType.R15 then
						if var76.AutomaticScalingEnabled then
							var79 = Vector3.new(0, 1.5, 0)
							if RootPart_7 == var76.RootPart then
								var79 += Vector3.new(0, var76.RootPart.Size.Y / 2 - Vector3.new(2, 2, 1).Y / 2, 0)
								-- KONSTANTWARNING: GOTO [106] #76
							end
						else
							var79 = Vector3.new(0, 2, 0)
						end
					else
						var79 = Vector3.new(0, 1.5, 0)
					end
					if var77 then
						var79 = Vector3.new(0, 0, 0)
					end
					local _ = RootPart_7.CFrame.p + RootPart_7.CFrame:vectorToWorldSpace(var79 + Vector3.new())
					-- KONSTANTWARNING: GOTO [181] #130
				end
				-- KONSTANTWARNING: GOTO [181] #130
			end
		else
			RootPart_7 = "VehicleSeat"
			var77 = var76:IsA(RootPart_7)
			if var77 then
				var77 = var76.CFrame.p
				var79 = Vector3.new(0, 5, 0)
			else
				RootPart_7 = "SkateboardPlatform"
				var77 = var76:IsA(RootPart_7)
				if var77 then
					var77 = var76.CFrame.p
				else
					RootPart_7 = "BasePart"
					var77 = var76:IsA(RootPart_7)
					if var77 then
						var77 = var76.CFrame
					else
						RootPart_7 = "Model"
						var77 = var76:IsA(RootPart_7)
						if var77 then
							var77 = var76.PrimaryPart
							if var77 then
								var77 = var76:GetPrimaryPartCFrame()
							else
								var77 = var76:GetModelCFrame()
							end
							-- KONSTANTWARNING: GOTO [181] #130
						end
					end
				end
			end
		end
	else
		var77 = nil
		return var77
	end
	-- KONSTANTERROR: [0] 1. Error Block 75 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [181] 130. Error Block 45 start (CF ANALYSIS FAILED)
	arg1.lastSubject = var76
	arg1.lastSubjectPosition = var77.p
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	do
		return var77.p
	end
	-- KONSTANTERROR: [181] 130. Error Block 45 end (CF ANALYSIS FAILED)
end
function module_4_upvr.OnViewportSizeChanged(arg1) -- Line 503
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	local game = game
	local ViewportSize_2 = game.Workspace.CurrentCamera.ViewportSize
	if ViewportSize_2.X >= ViewportSize_2.Y then
		game = false
	else
		game = true
	end
	arg1.portraitMode = game
	game = UserInputService_upvr.TouchEnabled
	if game then
		game = true
		if ViewportSize_2.Y >= 500 then
			if ViewportSize_2.X >= 700 then
				game = false
			else
				game = true
			end
		end
	end
	arg1.isSmallTouchScreen = game
end
function module_4_upvr.OnCurrentCameraChanged(arg1) -- Line 511
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	if UserInputService_upvr.TouchEnabled then
		if arg1.viewportSizeChangedConn then
			arg1.viewportSizeChangedConn:Disconnect()
			arg1.viewportSizeChangedConn = nil
		end
		local CurrentCamera_5 = game.Workspace.CurrentCamera
		if CurrentCamera_5 then
			arg1:OnViewportSizeChanged()
			arg1.viewportSizeChangedConn = CurrentCamera_5:GetPropertyChangedSignal("ViewportSize"):Connect(function() -- Line 522
				--[[ Upvalues[1]:
					[1]: arg1 (readonly)
				]]
				arg1:OnViewportSizeChanged()
			end)
		end
	end
	if arg1.cameraSubjectChangedConn then
		arg1.cameraSubjectChangedConn:Disconnect()
		arg1.cameraSubjectChangedConn = nil
	end
	local CurrentCamera_8 = game.Workspace.CurrentCamera
	if CurrentCamera_8 then
		arg1.cameraSubjectChangedConn = CurrentCamera_8:GetPropertyChangedSignal("CameraSubject"):Connect(function() -- Line 536
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:OnNewCameraSubject()
		end)
		arg1:OnNewCameraSubject()
	end
end
if not any_getUserFlag_result1_upvr then
	function module_4_upvr.OnDynamicThumbstickEnabled(arg1) -- Line 544
		--[[ Upvalues[1]:
			[1]: UserInputService_upvr (readonly)
		]]
		if UserInputService_upvr.TouchEnabled then
			arg1.isDynamicThumbstickEnabled = true
		end
	end
	function module_4_upvr.OnDynamicThumbstickDisabled(arg1) -- Line 550
		arg1.isDynamicThumbstickEnabled = false
	end
	function module_4_upvr.OnGameSettingsTouchMovementModeChanged(arg1) -- Line 554
		--[[ Upvalues[2]:
			[1]: LocalPlayer_upvr (readonly)
			[2]: UserGameSettings_upvr (readonly)
		]]
		if LocalPlayer_upvr.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
			if UserGameSettings_upvr.TouchMovementMode == Enum.TouchMovementMode.DynamicThumbstick or UserGameSettings_upvr.TouchMovementMode == Enum.TouchMovementMode.Default then
				arg1:OnDynamicThumbstickEnabled()
				return
			end
			arg1:OnDynamicThumbstickDisabled()
		end
	end
	function module_4_upvr.OnDevTouchMovementModeChanged(arg1) -- Line 565
		--[[ Upvalues[1]:
			[1]: LocalPlayer_upvr (readonly)
		]]
		if LocalPlayer_upvr.DevTouchMovementMode == Enum.DevTouchMovementMode.DynamicThumbstick then
			arg1:OnDynamicThumbstickEnabled()
		else
			arg1:OnGameSettingsTouchMovementModeChanged()
		end
	end
end
function module_4_upvr.OnPlayerCameraPropertyChange(arg1) -- Line 574
	arg1:SetCameraToSubjectDistance(arg1.currentSubjectDistance)
end
function module_4_upvr.InputTranslationToCameraAngleChange(arg1, arg2, arg3) -- Line 579
	return arg2 * arg3
end
local var90_upvw = pcall_result1 and pcall_result2
function module_4_upvr.GamepadZoomPress(arg1) -- Line 585
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: var90_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local _ = #arg1.gamepadZoomLevels
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [44] 33. Error Block 13 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [44] 33. Error Block 13 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [12] 10. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [44.2147485261]
	-- KONSTANTERROR: [12] 10. Error Block 2 end (CF ANALYSIS FAILED)
end
function module_4_upvr.Enable(arg1, arg2) -- Line 630
	if arg1.enabled ~= arg2 then
		arg1.enabled = arg2
		arg1:OnEnabledChanged()
	end
end
function module_4_upvr.OnEnabledChanged(arg1) -- Line 638
	--[[ Upvalues[3]:
		[1]: any_getUserFlag_result1_upvr (readonly)
		[2]: module_upvr_2 (readonly)
		[3]: LocalPlayer_upvr (readonly)
	]]
	if arg1.enabled then
		if any_getUserFlag_result1_upvr then
			arg1:_setUpConfigurations()
		end
		module_upvr_2.setInputEnabled(true)
		arg1.gamepadZoomPressConnection = module_upvr_2.gamepadZoomPress:Connect(function() -- Line 646
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:GamepadZoomPress()
		end)
		if LocalPlayer_upvr.CameraMode == Enum.CameraMode.LockFirstPerson then
			arg1.currentSubjectDistance = 0.5
			if not arg1.inFirstPerson then
				arg1:EnterFirstPerson()
			end
		end
		if arg1.cameraChangedConn then
			arg1.cameraChangedConn:Disconnect()
			arg1.cameraChangedConn = nil
		end
		arg1.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() -- Line 658
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			arg1:OnCurrentCameraChanged()
		end)
		arg1:OnCurrentCameraChanged()
	else
		if any_getUserFlag_result1_upvr then
			arg1._connections:disconnectAll()
		end
		module_upvr_2.setInputEnabled(false)
		if arg1.gamepadZoomPressConnection then
			arg1.gamepadZoomPressConnection:Disconnect()
			arg1.gamepadZoomPressConnection = nil
		end
		arg1:Cleanup()
	end
end
function module_4_upvr.GetEnabled(arg1) -- Line 678
	return arg1.enabled
end
function module_4_upvr.Cleanup(arg1) -- Line 682
	--[[ Upvalues[1]:
		[1]: module_2_upvr (readonly)
	]]
	if arg1.subjectStateChangedConn then
		arg1.subjectStateChangedConn:Disconnect()
		arg1.subjectStateChangedConn = nil
	end
	if arg1.viewportSizeChangedConn then
		arg1.viewportSizeChangedConn:Disconnect()
		arg1.viewportSizeChangedConn = nil
	end
	if arg1.cameraChangedConn then
		arg1.cameraChangedConn:Disconnect()
		arg1.cameraChangedConn = nil
	end
	arg1.lastCameraTransform = nil
	arg1.lastSubjectCFrame = nil
	module_2_upvr.restoreMouseBehavior()
end
local module_5_upvr = require(script.Parent:WaitForChild("CameraUI"))
local module_6_upvr = require(script.Parent:WaitForChild("CameraToggleStateController"))
function module_4_upvr.UpdateMouseBehavior(arg1) -- Line 703
	--[[ Upvalues[5]:
		[1]: UserGameSettings_upvr (readonly)
		[2]: module_5_upvr (readonly)
		[3]: module_upvr_2 (readonly)
		[4]: module_6_upvr (readonly)
		[5]: module_2_upvr (readonly)
	]]
	local var98
	if UserGameSettings_upvr.ComputerMovementMode ~= Enum.ComputerMovementMode.ClickToMove then
		var98 = false
	else
		var98 = true
	end
	if arg1.isCameraToggle and var98 == false then
		module_5_upvr.setCameraModeToastEnabled(true)
		module_upvr_2.enableCameraToggleInput()
		module_6_upvr(arg1.inFirstPerson)
	else
		module_5_upvr.setCameraModeToastEnabled(false)
		module_upvr_2.disableCameraToggleInput()
		if arg1.inFirstPerson or arg1.inMouseLockedMode then
			module_2_upvr.setRotationTypeOverride(Enum.RotationType.CameraRelative)
			return
		end
		module_2_upvr.restoreRotationType()
		if module_upvr_2.getRotationActivated() then
			module_2_upvr.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition)
			return
		end
		module_2_upvr.restoreMouseBehavior()
	end
end
function module_4_upvr.UpdateForDistancePropertyChange(arg1) -- Line 731
	arg1:SetCameraToSubjectDistance(arg1.currentSubjectDistance)
end
function module_4_upvr.SetCameraToSubjectDistance(arg1, arg2) -- Line 737
	--[[ Upvalues[2]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: module_3_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 6. Error Block 16 start (CF ANALYSIS FAILED)
	arg1.currentSubjectDistance = 0.5
	if not arg1.inFirstPerson then
		arg1:EnterFirstPerson()
		-- KONSTANTWARNING: GOTO [52] #35
	end
	-- KONSTANTERROR: [9] 6. Error Block 16 end (CF ANALYSIS FAILED)
end
function module_4_upvr.SetCameraType(arg1, arg2) -- Line 771
	arg1.cameraType = arg2
end
function module_4_upvr.GetCameraType(arg1) -- Line 776
	return arg1.cameraType
end
function module_4_upvr.SetCameraMovementMode(arg1, arg2) -- Line 781
	arg1.cameraMovementMode = arg2
end
function module_4_upvr.GetCameraMovementMode(arg1) -- Line 785
	return arg1.cameraMovementMode
end
function module_4_upvr.SetIsMouseLocked(arg1, arg2) -- Line 789
	arg1.inMouseLockedMode = arg2
end
function module_4_upvr.GetIsMouseLocked(arg1) -- Line 793
	return arg1.inMouseLockedMode
end
function module_4_upvr.SetMouseLockOffset(arg1, arg2) -- Line 797
	arg1.mouseLockOffset = arg2
end
function module_4_upvr.GetMouseLockOffset(arg1) -- Line 801
	return arg1.mouseLockOffset
end
function module_4_upvr.InFirstPerson(arg1) -- Line 805
	return arg1.inFirstPerson
end
function module_4_upvr.EnterFirstPerson(arg1) -- Line 809
	arg1.inFirstPerson = true
	arg1:UpdateMouseBehavior()
end
function module_4_upvr.LeaveFirstPerson(arg1) -- Line 814
	arg1.inFirstPerson = false
	arg1:UpdateMouseBehavior()
end
function module_4_upvr.GetCameraToSubjectDistance(arg1) -- Line 820
	return arg1.currentSubjectDistance
end
function module_4_upvr.GetMeasuredDistanceToFocus(arg1) -- Line 827
	local CurrentCamera_6 = game.Workspace.CurrentCamera
	if CurrentCamera_6 then
		return (CurrentCamera_6.CoordinateFrame.p - CurrentCamera_6.Focus.p).magnitude
	end
	return nil
end
function module_4_upvr.GetCameraLookVector(arg1) -- Line 835
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [7] 5. Error Block 6 start (CF ANALYSIS FAILED)
	local LookVector = game.Workspace.CurrentCamera.CFrame.LookVector
	if not LookVector then
		-- KONSTANTERROR: [18] 11. Error Block 3 start (CF ANALYSIS FAILED)
		LookVector = Vector3.new(0, 0, 1)
		-- KONSTANTERROR: [18] 11. Error Block 3 end (CF ANALYSIS FAILED)
	end
	do
		return LookVector
	end
	-- KONSTANTERROR: [7] 5. Error Block 6 end (CF ANALYSIS FAILED)
end
function module_4_upvr.CalculateNewLookCFrameFromArg(arg1, arg2, arg3) -- Line 839
	local var101 = arg2
	if not var101 then
		var101 = arg1:GetCameraLookVector()
	end
	local arcsine = math.asin(var101.Y)
	local vector2 = Vector2.new(arg3.X, math.clamp(arg3.Y, arcsine + -1.3962634015954636, arcsine + 1.3962634015954636))
	return CFrame.Angles(0, -vector2.X, 0) * CFrame.new(Vector3.new(0, 0, 0), var101) * CFrame.Angles(-vector2.Y, 0, 0)
end
function module_4_upvr.CalculateNewLookVectorFromArg(arg1, arg2, arg3) -- Line 849
	return arg1:CalculateNewLookCFrameFromArg(arg2, arg3).LookVector
end
function module_4_upvr.CalculateNewLookVectorVRFromArg(arg1, arg2) -- Line 854
	local vector2_2 = Vector2.new(arg2.X, 0)
	return ((CFrame.Angles(0, -vector2_2.X, 0) * CFrame.new(Vector3.new(0, 0, 0), ((arg1:GetSubjectPosition() - game.Workspace.CurrentCamera.CFrame.p) * Vector3.new(1, 0, 1)).unit) * CFrame.Angles(-vector2_2.Y, 0, 0)).LookVector * Vector3.new(1, 0, 1)).unit
end
function module_4_upvr.GetHumanoid(arg1) -- Line 864
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	local var105 = LocalPlayer_upvr
	if var105 then
		var105 = LocalPlayer_upvr.Character
	end
	if var105 then
		local var106 = arg1.humanoidCache[LocalPlayer_upvr]
		if var106 and var106.Parent == var105 then
			return var106
		end
		arg1.humanoidCache[LocalPlayer_upvr] = nil
		local class_Humanoid_2 = var105:FindFirstChildOfClass("Humanoid")
		if class_Humanoid_2 then
			arg1.humanoidCache[LocalPlayer_upvr] = class_Humanoid_2
		end
		return class_Humanoid_2
	end
	return nil
end
function module_4_upvr.GetHumanoidPartToFollow(arg1, arg2, arg3) -- Line 882
	if arg3 == Enum.HumanoidStateType.Dead then
		local Parent = arg2.Parent
		if Parent then
			local Head = Parent:FindFirstChild("Head")
			if not Head then
				Head = arg2.Torso
			end
			return Head
		end
		return arg2.Torso
	end
	return arg2.Torso
end
function module_4_upvr.OnNewCameraSubject(arg1) -- Line 896
	if arg1.subjectStateChangedConn then
		arg1.subjectStateChangedConn:Disconnect()
		arg1.subjectStateChangedConn = nil
	end
end
function module_4_upvr.IsInFirstPerson(arg1) -- Line 903
	return arg1.inFirstPerson
end
function module_4_upvr.Update(arg1, arg2) -- Line 907
	error("BaseCamera:Update() This is a virtual function that should never be getting called.", 2)
end
local VRService_upvr = game:GetService("VRService")
function module_4_upvr.GetCameraHeight(arg1) -- Line 911
	--[[ Upvalues[1]:
		[1]: VRService_upvr (readonly)
	]]
	if VRService_upvr.VREnabled and not arg1.inFirstPerson then
		return 0.25881904510252074 * arg1.currentSubjectDistance
	end
	return 0
end
return module_4_upvr