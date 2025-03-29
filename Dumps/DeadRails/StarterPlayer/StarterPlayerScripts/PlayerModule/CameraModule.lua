--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:41
-- Luau version 6, Types version 3
-- Time taken: 0.011500 seconds

local tbl_upvr = {}
tbl_upvr.__index = tbl_upvr
local tbl_upvr_2 = {"CameraMinZoomDistance", "CameraMaxZoomDistance", "CameraMode", "DevCameraOcclusionMode", "DevComputerCameraMode", "DevTouchCameraMode", "DevComputerMovementMode", "DevTouchMovementMode", "DevEnableMouseLock"}
local tbl_upvr_3 = {"ComputerCameraMovementMode", "ComputerMovementMode", "ControlMode", "GamepadCameraSensitivity", "MouseSensitivity", "RotationType", "TouchCameraMovementMode", "TouchMovementMode"}
local Players_upvr = game:GetService("Players")
local UserInputService_upvr = game:GetService("UserInputService")
local UserGameSettings_upvr = UserSettings():GetService("UserGameSettings")
local module_upvr_5 = require(script:WaitForChild("CameraUtils"))
local PlayerScripts = Players_upvr.LocalPlayer:WaitForChild("PlayerScripts")
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default)
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow)
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic)
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default)
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow)
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic)
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle)
local any_getUserFlag_result1_upvr = require(script.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil")).getUserFlag("UserRespectLegacyCameraOptions")
local module_upvr_9 = require(script:WaitForChild("TransparencyController"))
local module_upvr_8 = require(script:WaitForChild("MouseLockController"))
local RunService_upvr = game:GetService("RunService")
function tbl_upvr.new() -- Line 99
	--[[ Upvalues[10]:
		[1]: tbl_upvr (readonly)
		[2]: Players_upvr (readonly)
		[3]: module_upvr_9 (readonly)
		[4]: UserInputService_upvr (readonly)
		[5]: module_upvr_8 (readonly)
		[6]: any_getUserFlag_result1_upvr (readonly)
		[7]: RunService_upvr (readonly)
		[8]: tbl_upvr_2 (readonly)
		[9]: tbl_upvr_3 (readonly)
		[10]: UserGameSettings_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local setmetatable_result1_upvr_2 = setmetatable({}, tbl_upvr)
	setmetatable_result1_upvr_2.activeCameraController = nil
	setmetatable_result1_upvr_2.activeOcclusionModule = nil
	setmetatable_result1_upvr_2.activeTransparencyController = nil
	setmetatable_result1_upvr_2.activeMouseLockController = nil
	setmetatable_result1_upvr_2.currentComputerCameraMovementMode = nil
	setmetatable_result1_upvr_2.cameraSubjectChangedConn = nil
	setmetatable_result1_upvr_2.cameraTypeChangedConn = nil
	for var84, v in pairs(Players_upvr:GetPlayers()) do
		setmetatable_result1_upvr_2:OnPlayerAdded(v)
	end
	Players_upvr.PlayerAdded:Connect(function(arg1) -- Line 120
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr_2 (readonly)
		]]
		setmetatable_result1_upvr_2:OnPlayerAdded(arg1)
	end)
	setmetatable_result1_upvr_2.activeTransparencyController = module_upvr_9.new()
	setmetatable_result1_upvr_2.activeTransparencyController:Enable(true)
	if not UserInputService_upvr.TouchEnabled then
		setmetatable_result1_upvr_2.activeMouseLockController = module_upvr_8.new()
		local any_GetBindableToggleEvent_result1_2 = setmetatable_result1_upvr_2.activeMouseLockController:GetBindableToggleEvent()
		if any_GetBindableToggleEvent_result1_2 then
			function var84() -- Line 131
				--[[ Upvalues[1]:
					[1]: setmetatable_result1_upvr_2 (readonly)
				]]
				setmetatable_result1_upvr_2:OnMouseLockToggled()
			end
			any_GetBindableToggleEvent_result1_2:Connect(var84)
		end
	end
	if any_getUserFlag_result1_upvr then
		setmetatable_result1_upvr_2:ActivateCameraController()
	else
		setmetatable_result1_upvr_2:ActivateCameraController(setmetatable_result1_upvr_2:GetCameraControlChoice())
	end
	setmetatable_result1_upvr_2:ActivateOcclusionModule(Players_upvr.LocalPlayer.DevCameraOcclusionMode)
	setmetatable_result1_upvr_2:OnCurrentCameraChanged()
	RunService_upvr:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(arg1) -- Line 144
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr_2 (readonly)
		]]
		setmetatable_result1_upvr_2:Update(arg1)
	end)
	for _, v_2_upvr in pairs(tbl_upvr_2) do
		Players_upvr.LocalPlayer:GetPropertyChangedSignal(v_2_upvr):Connect(function() -- Line 148
			--[[ Upvalues[2]:
				[1]: setmetatable_result1_upvr_2 (readonly)
				[2]: v_2_upvr (readonly)
			]]
			setmetatable_result1_upvr_2:OnLocalPlayerCameraPropertyChanged(v_2_upvr)
		end)
	end
	for _, v_3_upvr in pairs(tbl_upvr_3) do
		UserGameSettings_upvr:GetPropertyChangedSignal(v_3_upvr):Connect(function() -- Line 154
			--[[ Upvalues[2]:
				[1]: setmetatable_result1_upvr_2 (readonly)
				[2]: v_3_upvr (readonly)
			]]
			setmetatable_result1_upvr_2:OnUserGameSettingsPropertyChanged(v_3_upvr)
		end)
	end
	game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() -- Line 158
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr_2 (readonly)
		]]
		setmetatable_result1_upvr_2:OnCurrentCameraChanged()
	end)
	return setmetatable_result1_upvr_2
end
function tbl_upvr.GetCameraMovementModeFromSettings(arg1) -- Line 165
	--[[ Upvalues[4]:
		[1]: Players_upvr (readonly)
		[2]: module_upvr_5 (readonly)
		[3]: UserInputService_upvr (readonly)
		[4]: UserGameSettings_upvr (readonly)
	]]
	local var95
	if Players_upvr.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
		var95 = module_upvr_5
		var95 = Enum.ComputerCameraMovementMode.Classic
		return var95.ConvertCameraModeEnumToStandard(var95)
	end
	local var96
	var95 = nil
	if UserInputService_upvr.TouchEnabled then
		var96 = module_upvr_5.ConvertCameraModeEnumToStandard(Players_upvr.LocalPlayer.DevTouchCameraMode)
		var95 = module_upvr_5.ConvertCameraModeEnumToStandard(UserGameSettings_upvr.TouchCameraMovementMode)
	else
		var96 = module_upvr_5.ConvertCameraModeEnumToStandard(Players_upvr.LocalPlayer.DevComputerCameraMode)
		var95 = module_upvr_5.ConvertCameraModeEnumToStandard(UserGameSettings_upvr.ComputerCameraMovementMode)
	end
	if var96 == Enum.DevComputerCameraMovementMode.UserChoice then
		return var95
	end
	return var96
end
local module_upvr_12 = require(script:WaitForChild("Poppercam"))
local module_upvr = require(script:WaitForChild("Invisicam"))
local tbl_upvr_5 = {}
function tbl_upvr.ActivateOcclusionModule(arg1, arg2) -- Line 190
	--[[ Upvalues[4]:
		[1]: module_upvr_12 (readonly)
		[2]: module_upvr (readonly)
		[3]: tbl_upvr_5 (readonly)
		[4]: Players_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 51 start (CF ANALYSIS FAILED)
	local var100
	if arg2 == Enum.DevCameraOcclusionMode.Zoom then
		var100 = module_upvr_12
	elseif arg2 == Enum.DevCameraOcclusionMode.Invisicam then
		var100 = module_upvr
	else
		warn("CameraScript ActivateOcclusionModule called with unsupported mode")
		return
	end
	arg1.occlusionMode = arg2
	-- KONSTANTERROR: [0] 1. Error Block 51 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 17. Error Block 9 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [23] 17. Error Block 9 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [30] 21. Error Block 38 start (CF ANALYSIS FAILED)
	if not arg1.activeOcclusionModule:GetEnabled() then
		arg1.activeOcclusionModule:Enable(true)
	end
	do
		return
	end
	-- KONSTANTERROR: [30] 21. Error Block 38 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [43] 30. Error Block 13 start (CF ANALYSIS FAILED)
	arg1.activeOcclusionModule = tbl_upvr_5[var100]
	-- KONSTANTERROR: [43] 30. Error Block 13 end (CF ANALYSIS FAILED)
end
function tbl_upvr.ShouldUseVehicleCamera(arg1) -- Line 269
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local CurrentCamera_3 = workspace.CurrentCamera
	local var108
	if not CurrentCamera_3 then
		return false
	end
	local CameraType_2 = CurrentCamera_3.CameraType
	local var111 = true
	var108 = Enum.CameraType.Custom
	if CameraType_2 ~= var108 then
		var108 = Enum.CameraType.Follow
		if CameraType_2 ~= var108 then
			var111 = false
		else
			var111 = true
		end
	end
	local function INLINED_2() -- Internal function, doesn't exist in bytecode
		var108 = CurrentCamera_3.CameraSubject:IsA("VehicleSeat")
		return var108
	end
	if not CurrentCamera_3.CameraSubject or not INLINED_2() then
		var108 = false
	end
	if arg1.occlusionMode == Enum.DevCameraOcclusionMode.Invisicam then
	else
	end
	if var108 then
		if var111 then
		end
	end
	return true
end
local module_upvr_10 = require(script:WaitForChild("LegacyCamera"))
local VRService_upvr = game:GetService("VRService")
local module_upvr_4 = require(script:WaitForChild("VRCamera"))
local module_upvr_2 = require(script:WaitForChild("ClassicCamera"))
local module_upvr_3 = require(script:WaitForChild("OrbitalCamera"))
local module_upvr_11 = require(script:WaitForChild("VRVehicleCamera"))
local module_upvr_7 = require(script:WaitForChild("VehicleCamera"))
local tbl_upvr_4 = {}
function tbl_upvr.ActivateCameraController(arg1, arg2, arg3) -- Line 285
	--[[ Upvalues[9]:
		[1]: any_getUserFlag_result1_upvr (readonly)
		[2]: module_upvr_10 (readonly)
		[3]: VRService_upvr (readonly)
		[4]: module_upvr_4 (readonly)
		[5]: module_upvr_2 (readonly)
		[6]: module_upvr_3 (readonly)
		[7]: module_upvr_11 (readonly)
		[8]: module_upvr_7 (readonly)
		[9]: tbl_upvr_4 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 105 start (CF ANALYSIS FAILED)
	local var120
	if any_getUserFlag_result1_upvr then
		var120 = workspace.CurrentCamera.CameraType
	end
	if any_getUserFlag_result1_upvr then
		-- KONSTANTWARNING: GOTO [21] #17
	end
	-- KONSTANTERROR: [0] 1. Error Block 105 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [17] 14. Error Block 102 start (CF ANALYSIS FAILED)
	if var120 == nil then
	else
	end
	-- KONSTANTERROR: [17] 14. Error Block 102 end (CF ANALYSIS FAILED)
end
function tbl_upvr.OnCameraSubjectChanged(arg1) -- Line 397
	local CurrentCamera_5 = workspace.CurrentCamera
	local var122
	if var122 then
		var122 = CurrentCamera_5.CameraSubject
	end
	if arg1.activeTransparencyController then
		arg1.activeTransparencyController:SetSubject(var122)
	end
	if arg1.activeOcclusionModule then
		arg1.activeOcclusionModule:OnCameraSubjectChanged(var122)
	end
	arg1:ActivateCameraController(nil, CurrentCamera_5.CameraType)
end
function tbl_upvr.OnCameraTypeChanged(arg1, arg2) -- Line 412
	--[[ Upvalues[2]:
		[1]: UserInputService_upvr (readonly)
		[2]: module_upvr_5 (readonly)
	]]
	if arg2 == Enum.CameraType.Scriptable and UserInputService_upvr.MouseBehavior == Enum.MouseBehavior.LockCenter then
		module_upvr_5.restoreMouseBehavior()
	end
	arg1:ActivateCameraController(nil, arg2)
end
function tbl_upvr.OnCurrentCameraChanged(arg1) -- Line 424
	local CurrentCamera_2_upvr = game.Workspace.CurrentCamera
	if not CurrentCamera_2_upvr then
	else
		if arg1.cameraSubjectChangedConn then
			arg1.cameraSubjectChangedConn:Disconnect()
		end
		if arg1.cameraTypeChangedConn then
			arg1.cameraTypeChangedConn:Disconnect()
		end
		arg1.cameraSubjectChangedConn = CurrentCamera_2_upvr:GetPropertyChangedSignal("CameraSubject"):Connect(function() -- Line 436
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: CurrentCamera_2_upvr (readonly)
			]]
			arg1:OnCameraSubjectChanged(CurrentCamera_2_upvr.CameraSubject)
		end)
		arg1.cameraTypeChangedConn = CurrentCamera_2_upvr:GetPropertyChangedSignal("CameraType"):Connect(function() -- Line 440
			--[[ Upvalues[2]:
				[1]: arg1 (readonly)
				[2]: CurrentCamera_2_upvr (readonly)
			]]
			arg1:OnCameraTypeChanged(CurrentCamera_2_upvr.CameraType)
		end)
		arg1:OnCameraSubjectChanged(CurrentCamera_2_upvr.CameraSubject)
		arg1:OnCameraTypeChanged(CurrentCamera_2_upvr.CameraType)
	end
end
function tbl_upvr.OnLocalPlayerCameraPropertyChanged(arg1, arg2) -- Line 448
	--[[ Upvalues[2]:
		[1]: Players_upvr (readonly)
		[2]: module_upvr_5 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [39] 25. Error Block 34 start (CF ANALYSIS FAILED)
	if Players_upvr.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
		arg1:ActivateCameraController(module_upvr_5.ConvertCameraModeEnumToStandard(arg1:GetCameraMovementModeFromSettings()))
		return
	end
	warn("Unhandled value for property player.CameraMode: ", Players_upvr.LocalPlayer.CameraMode)
	do
		return
	end
	-- KONSTANTERROR: [39] 25. Error Block 34 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [70] 46. Error Block 12 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [70] 46. Error Block 12 end (CF ANALYSIS FAILED)
end
function tbl_upvr.OnUserGameSettingsPropertyChanged(arg1, arg2) -- Line 492
	--[[ Upvalues[1]:
		[1]: module_upvr_5 (readonly)
	]]
	if arg2 == "ComputerCameraMovementMode" then
		arg1:ActivateCameraController(module_upvr_5.ConvertCameraModeEnumToStandard(arg1:GetCameraMovementModeFromSettings()))
	end
end
local module_upvr_6 = require(script:WaitForChild("CameraInput"))
function tbl_upvr.Update(arg1, arg2) -- Line 505
	--[[ Upvalues[1]:
		[1]: module_upvr_6 (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	if arg1.activeCameraController then
		arg1.activeCameraController:UpdateMouseBehavior()
		local any_Update_result1, any_Update_result2 = arg1.activeCameraController:Update(arg2)
		if arg1.activeOcclusionModule then
			local any_Update_result1_2, any_Update_result2_2 = arg1.activeOcclusionModule:Update(arg2, any_Update_result1, any_Update_result2)
			any_Update_result1 = any_Update_result1_2
		end
		local CurrentCamera_4 = game.Workspace.CurrentCamera
		CurrentCamera_4.CFrame = any_Update_result1
		CurrentCamera_4.Focus = any_Update_result2_2
		if arg1.activeTransparencyController then
			arg1.activeTransparencyController:Update(arg2)
		end
		if module_upvr_6.getInputEnabled() then
			module_upvr_6.resetInputForFrameEnd()
		end
	end
end
if not any_getUserFlag_result1_upvr then
	function tbl_upvr.GetCameraControlChoice(arg1) -- Line 534
		--[[ Upvalues[4]:
			[1]: Players_upvr (readonly)
			[2]: UserInputService_upvr (readonly)
			[3]: module_upvr_5 (readonly)
			[4]: UserGameSettings_upvr (readonly)
		]]
		local LocalPlayer = Players_upvr.LocalPlayer
		if LocalPlayer then
			if UserInputService_upvr:GetLastInputType() == Enum.UserInputType.Touch or UserInputService_upvr.TouchEnabled then
				if LocalPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
					return module_upvr_5.ConvertCameraModeEnumToStandard(UserGameSettings_upvr.TouchCameraMovementMode)
				end
				return module_upvr_5.ConvertCameraModeEnumToStandard(LocalPlayer.DevTouchCameraMode)
			end
			if LocalPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice then
				return module_upvr_5.ConvertCameraModeEnumToStandard(module_upvr_5.ConvertCameraModeEnumToStandard(UserGameSettings_upvr.ComputerCameraMovementMode))
			end
			return module_upvr_5.ConvertCameraModeEnumToStandard(LocalPlayer.DevComputerCameraMode)
		end
	end
end
function tbl_upvr.OnCharacterAdded(arg1, arg2, arg3) -- Line 558
	if arg1.activeOcclusionModule then
		arg1.activeOcclusionModule:CharacterAdded(arg2, arg3)
	end
end
function tbl_upvr.OnCharacterRemoving(arg1, arg2, arg3) -- Line 564
	if arg1.activeOcclusionModule then
		arg1.activeOcclusionModule:CharacterRemoving(arg2, arg3)
	end
end
function tbl_upvr.OnPlayerAdded(arg1, arg2) -- Line 570
	arg2.CharacterAdded:Connect(function(arg1_2) -- Line 571
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		arg1:OnCharacterAdded(arg1_2, arg2)
	end)
	arg2.CharacterRemoving:Connect(function(arg1_3) -- Line 574
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: arg2 (readonly)
		]]
		arg1:OnCharacterRemoving(arg1_3, arg2)
	end)
end
function tbl_upvr.OnMouseLockToggled(arg1) -- Line 579
	if arg1.activeMouseLockController and arg1.activeCameraController then
		arg1.activeCameraController:SetIsMouseLocked(arg1.activeMouseLockController:GetIsMouseLocked())
		arg1.activeCameraController:SetMouseLockOffset(arg1.activeMouseLockController:GetMouseLockOffset())
	end
end
return {}