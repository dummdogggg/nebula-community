--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:24
-- Luau version 6, Types version 3
-- Time taken: 0.017219 seconds

local module_upvr = {}
module_upvr.__index = module_upvr
local Players_upvr = game:GetService("Players")
local UserInputService_upvr = game:GetService("UserInputService")
local GuiService_upvr = game:GetService("GuiService")
local UserGameSettings_upvr = UserSettings():GetService("UserGameSettings")
local VRService_upvr = game:GetService("VRService")
local module_upvr_4 = require(script:WaitForChild("Keyboard"))
local module_upvr_3 = require(script:WaitForChild("Gamepad"))
local module_upvr_2 = require(script:WaitForChild("DynamicThumbstick"))
local pcall_result1, pcall_result2 = pcall(function() -- Line 35
	return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate")
end)
local any_getUserFlag_result1_upvr = require(script.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil")).getUserFlag("UserControlModuleEnableIdempotent")
local module_upvr_6 = require(script:WaitForChild("TouchThumbstick"))
local module_upvr_7 = require(script:WaitForChild("ClickToMoveController"))
local Value_upvr = Enum.ContextActionPriority.Medium.Value
local tbl_upvr_2 = {
	[Enum.TouchMovementMode.DPad] = module_upvr_2;
	[Enum.DevTouchMovementMode.DPad] = module_upvr_2;
	[Enum.TouchMovementMode.Thumbpad] = module_upvr_2;
	[Enum.DevTouchMovementMode.Thumbpad] = module_upvr_2;
	[Enum.TouchMovementMode.Thumbstick] = module_upvr_6;
	[Enum.DevTouchMovementMode.Thumbstick] = module_upvr_6;
	[Enum.TouchMovementMode.DynamicThumbstick] = module_upvr_2;
	[Enum.DevTouchMovementMode.DynamicThumbstick] = module_upvr_2;
	[Enum.TouchMovementMode.ClickToMove] = module_upvr_7;
	[Enum.DevTouchMovementMode.ClickToMove] = module_upvr_7;
	[Enum.TouchMovementMode.Default] = module_upvr_2;
	[Enum.ComputerMovementMode.Default] = module_upvr_4;
	[Enum.ComputerMovementMode.KeyboardMouse] = module_upvr_4;
	[Enum.DevComputerMovementMode.KeyboardMouse] = module_upvr_4;
	[Enum.DevComputerMovementMode.Scriptable] = nil;
	[Enum.ComputerMovementMode.ClickToMove] = module_upvr_7;
	[Enum.DevComputerMovementMode.ClickToMove] = module_upvr_7;
}
local tbl_upvr = {
	[Enum.UserInputType.Keyboard] = module_upvr_4;
	[Enum.UserInputType.MouseButton1] = module_upvr_4;
	[Enum.UserInputType.MouseButton2] = module_upvr_4;
	[Enum.UserInputType.MouseButton3] = module_upvr_4;
	[Enum.UserInputType.MouseWheel] = module_upvr_4;
	[Enum.UserInputType.MouseMovement] = module_upvr_4;
	[Enum.UserInputType.Gamepad1] = module_upvr_3;
	[Enum.UserInputType.Gamepad2] = module_upvr_3;
	[Enum.UserInputType.Gamepad3] = module_upvr_3;
	[Enum.UserInputType.Gamepad4] = module_upvr_3;
}
local var19_upvw
local module_upvr_8 = require(script:WaitForChild("VehicleController"))
local RunService_upvr = game:GetService("RunService")
function module_upvr.new() -- Line 95
	--[[ Upvalues[8]:
		[1]: module_upvr (readonly)
		[2]: Players_upvr (readonly)
		[3]: module_upvr_8 (readonly)
		[4]: Value_upvr (readonly)
		[5]: RunService_upvr (readonly)
		[6]: UserInputService_upvr (readonly)
		[7]: UserGameSettings_upvr (readonly)
		[8]: GuiService_upvr (readonly)
	]]
	local setmetatable_result1_upvr = setmetatable({}, module_upvr)
	setmetatable_result1_upvr.controllers = {}
	setmetatable_result1_upvr.activeControlModule = nil
	setmetatable_result1_upvr.activeController = nil
	setmetatable_result1_upvr.touchJumpController = nil
	setmetatable_result1_upvr.moveFunction = Players_upvr.LocalPlayer.Move
	setmetatable_result1_upvr.humanoid = nil
	setmetatable_result1_upvr.lastInputType = Enum.UserInputType.None
	setmetatable_result1_upvr.controlsEnabled = true
	setmetatable_result1_upvr.humanoidSeatedConn = nil
	setmetatable_result1_upvr.vehicleController = nil
	setmetatable_result1_upvr.touchControlFrame = nil
	setmetatable_result1_upvr.currentTorsoAngle = 0
	setmetatable_result1_upvr.inputMoveVector = Vector3.new(0, 0, 0)
	setmetatable_result1_upvr.vehicleController = module_upvr_8.new(Value_upvr)
	Players_upvr.LocalPlayer.CharacterAdded:Connect(function(arg1) -- Line 121
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:OnCharacterAdded(arg1)
	end)
	Players_upvr.LocalPlayer.CharacterRemoving:Connect(function(arg1) -- Line 122
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:OnCharacterRemoving(arg1)
	end)
	if Players_upvr.LocalPlayer.Character then
		setmetatable_result1_upvr:OnCharacterAdded(Players_upvr.LocalPlayer.Character)
	end
	RunService_upvr:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(arg1) -- Line 127
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:OnRenderStepped(arg1)
	end)
	UserInputService_upvr.LastInputTypeChanged:Connect(function(arg1) -- Line 131
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:OnLastInputTypeChanged(arg1)
	end)
	UserGameSettings_upvr:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() -- Line 136
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:OnTouchMovementModeChange()
	end)
	Players_upvr.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() -- Line 139
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:OnTouchMovementModeChange()
	end)
	UserGameSettings_upvr:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function() -- Line 143
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:OnComputerMovementModeChange()
	end)
	Players_upvr.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() -- Line 146
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:OnComputerMovementModeChange()
	end)
	setmetatable_result1_upvr.playerGui = nil
	setmetatable_result1_upvr.touchGui = nil
	setmetatable_result1_upvr.playerGuiAddedConn = nil
	GuiService_upvr:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function() -- Line 155
		--[[ Upvalues[1]:
			[1]: setmetatable_result1_upvr (readonly)
		]]
		setmetatable_result1_upvr:UpdateTouchGuiVisibility()
		setmetatable_result1_upvr:UpdateActiveControlModuleEnabled()
	end)
	if UserInputService_upvr.TouchEnabled then
		setmetatable_result1_upvr.playerGui = Players_upvr.LocalPlayer:FindFirstChildOfClass("PlayerGui")
		if setmetatable_result1_upvr.playerGui then
			setmetatable_result1_upvr:CreateTouchGuiContainer()
			setmetatable_result1_upvr:OnLastInputTypeChanged(UserInputService_upvr:GetLastInputType())
			return setmetatable_result1_upvr
		end
		setmetatable_result1_upvr.playerGuiAddedConn = Players_upvr.LocalPlayer.ChildAdded:Connect(function(arg1) -- Line 166
			--[[ Upvalues[2]:
				[1]: setmetatable_result1_upvr (readonly)
				[2]: UserInputService_upvr (copied, readonly)
			]]
			if arg1:IsA("PlayerGui") then
				setmetatable_result1_upvr.playerGui = arg1
				setmetatable_result1_upvr:CreateTouchGuiContainer()
				setmetatable_result1_upvr.playerGuiAddedConn:Disconnect()
				setmetatable_result1_upvr.playerGuiAddedConn = nil
				setmetatable_result1_upvr:OnLastInputTypeChanged(UserInputService_upvr:GetLastInputType())
			end
		end)
		return setmetatable_result1_upvr
	end
	setmetatable_result1_upvr:OnLastInputTypeChanged(UserInputService_upvr:GetLastInputType())
	return setmetatable_result1_upvr
end
function module_upvr.GetMoveVector(arg1) -- Line 186
	if arg1.activeController then
		return arg1.activeController:GetMoveVector()
	end
	return Vector3.new(0, 0, 0)
end
local function _(arg1) -- Line 193, Named "NormalizeAngle"
	arg1 = (arg1 + 12.566370614359172) % (-math.pi*2)
	local var33 = arg1
	if math.pi < var33 then
		var33 -= (-math.pi*2)
	end
	return var33
end
local function _(arg1, arg2) -- Line 201, Named "AverageAngle"
	local var34 = (arg2 - arg1 + 12.566370614359172) % (-math.pi*2)
	if math.pi < var34 then
		var34 -= (-math.pi*2)
	end
	local var35 = (arg1 + var34 / 2 + 12.566370614359172) % (-math.pi*2)
	if math.pi < var35 then
		var35 -= (-math.pi*2)
	end
	return var35
end
function module_upvr.GetEstimatedVRTorsoFrame(arg1) -- Line 206
	--[[ Upvalues[1]:
		[1]: VRService_upvr (readonly)
	]]
	local any_GetUserCFrame_result1 = VRService_upvr:GetUserCFrame(Enum.UserCFrame.Head)
	local _, any_ToEulerAnglesYXZ_result2_2, _ = any_GetUserCFrame_result1:ToEulerAnglesYXZ()
	local var40
	if not VRService_upvr:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or not VRService_upvr:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
		arg1.currentTorsoAngle = -any_ToEulerAnglesYXZ_result2_2
	else
		local var41 = any_GetUserCFrame_result1.Position - VRService_upvr:GetUserCFrame(Enum.UserCFrame.LeftHand).Position
		local _ = any_GetUserCFrame_result1.Position - VRService_upvr:GetUserCFrame(Enum.UserCFrame.RightHand).Position
		local _ = -math.atan2(var41.X, var41.Z)
		var40 = _.Z
		var40 = -math.atan2(_.X, var40) - _
		var40 = (var40 + 12.566370614359172) % (-math.pi*2)
		if math.pi < var40 then
			var40 -= (-math.pi*2)
		end
		var40 = _ + var40 / 2
		var40 = (var40 + 12.566370614359172) % (-math.pi*2)
		if math.pi < var40 then
			var40 -= (-math.pi*2)
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if math.pi < (-any_ToEulerAnglesYXZ_result2_2 - arg1.currentTorsoAngle + 12.566370614359172) % (-math.pi*2) then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		end
		local var44 = (-any_ToEulerAnglesYXZ_result2_2 - arg1.currentTorsoAngle + 12.566370614359172) % (-math.pi*2) - (-math.pi*2)
		local var45 = (var40 - arg1.currentTorsoAngle + 12.566370614359172) % (-math.pi*2)
		if math.pi < var45 then
			var45 -= (-math.pi*2)
		end
		var45 = false
		local var46 = var45
		if (-math.pi/2) < var45 then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if var45 >= (math.pi/2) then
				var46 = false
			else
				var46 = true
			end
		end
		if not var46 then
		end
		local minimum = math.min(var44, var44)
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		local maximum = math.max(var44, var44)
		local var49 = 0
		if 0 < minimum then
			var49 = minimum
		elseif maximum < 0 then
			var49 = maximum
		end
		arg1.currentTorsoAngle = var49 + arg1.currentTorsoAngle
	end
	return CFrame.new(any_GetUserCFrame_result1.Position) * CFrame.fromEulerAnglesYXZ(0, -arg1.currentTorsoAngle, 0)
end
function module_upvr.GetActiveController(arg1) -- Line 250
	return arg1.activeController
end
local module_upvr_5 = require(script:WaitForChild("TouchJump"))
function module_upvr.UpdateActiveControlModuleEnabled(arg1) -- Line 255
	--[[ Upvalues[7]:
		[1]: Players_upvr (readonly)
		[2]: module_upvr_7 (readonly)
		[3]: module_upvr_6 (readonly)
		[4]: module_upvr_2 (readonly)
		[5]: module_upvr_5 (readonly)
		[6]: GuiService_upvr (readonly)
		[7]: UserInputService_upvr (readonly)
	]]
	local function _() -- Line 257
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: Players_upvr (copied, readonly)
		]]
		arg1.activeController:Enable(false)
		if arg1.touchJumpController then
			arg1.touchJumpController:Enable(false)
		end
		if arg1.moveFunction then
			arg1.moveFunction(Players_upvr.LocalPlayer, Vector3.new(0, 0, 0), true)
		end
	end
	if not arg1.activeController then
	else
		if not arg1.controlsEnabled then
			arg1.activeController:Enable(false)
			if arg1.touchJumpController then
				arg1.touchJumpController:Enable(false)
			end
			if arg1.moveFunction then
				arg1.moveFunction(Players_upvr.LocalPlayer, Vector3.new(0, 0, 0), true)
			end
			return
		end
		if not GuiService_upvr.TouchControlsEnabled and UserInputService_upvr.TouchEnabled and (arg1.activeControlModule == module_upvr_7 or arg1.activeControlModule == module_upvr_6 or arg1.activeControlModule == module_upvr_2) then
			arg1.activeController:Enable(false)
			if arg1.touchJumpController then
				arg1.touchJumpController:Enable(false)
			end
			if arg1.moveFunction then
				arg1.moveFunction(Players_upvr.LocalPlayer, Vector3.new(0, 0, 0), true)
			end
			return
		end
		;(function() -- Line 268
			--[[ Upvalues[6]:
				[1]: arg1 (readonly)
				[2]: module_upvr_7 (copied, readonly)
				[3]: module_upvr_6 (copied, readonly)
				[4]: module_upvr_2 (copied, readonly)
				[5]: module_upvr_5 (copied, readonly)
				[6]: Players_upvr (copied, readonly)
			]]
			if arg1.touchControlFrame and (arg1.activeControlModule == module_upvr_7 or arg1.activeControlModule == module_upvr_6 or arg1.activeControlModule == module_upvr_2) then
				if not arg1.controllers[module_upvr_5] then
					arg1.controllers[module_upvr_5] = module_upvr_5.new()
				end
				arg1.touchJumpController = arg1.controllers[module_upvr_5]
				arg1.touchJumpController:Enable(true, arg1.touchControlFrame)
			elseif arg1.touchJumpController then
				arg1.touchJumpController:Enable(false)
			end
			local var53
			if arg1.activeControlModule == module_upvr_7 then
				if Players_upvr.LocalPlayer.DevComputerMovementMode ~= Enum.DevComputerMovementMode.UserChoice then
					var53 = false
				else
					var53 = true
				end
				arg1.activeController:Enable(true, var53, arg1.touchJumpController)
			else
				if arg1.touchControlFrame then
					var53 = arg1.touchControlFrame
					arg1.activeController:Enable(true, var53)
					return
				end
				arg1.activeController:Enable(true)
			end
		end)()
	end
end
function module_upvr.Enable(arg1, arg2) -- Line 327
	--[[ Upvalues[1]:
		[1]: any_getUserFlag_result1_upvr (readonly)
	]]
	if arg2 == nil then
	end
	if any_getUserFlag_result1_upvr and arg1.controlsEnabled == true then
	else
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		arg1.controlsEnabled = true
		if not arg1.activeController then return end
		arg1:UpdateActiveControlModuleEnabled()
	end
end
function module_upvr.Disable(arg1) -- Line 344
	--[[ Upvalues[1]:
		[1]: any_getUserFlag_result1_upvr (readonly)
	]]
	if any_getUserFlag_result1_upvr then
		arg1:Enable(false)
	else
		arg1.controlsEnabled = false
		arg1:UpdateActiveControlModuleEnabled()
	end
end
function module_upvr.SelectComputerMovementModule(arg1) -- Line 356
	--[[ Upvalues[8]:
		[1]: UserInputService_upvr (readonly)
		[2]: Players_upvr (readonly)
		[3]: tbl_upvr (readonly)
		[4]: var19_upvw (read and write)
		[5]: UserGameSettings_upvr (readonly)
		[6]: module_upvr_4 (readonly)
		[7]: module_upvr_7 (readonly)
		[8]: tbl_upvr_2 (readonly)
	]]
	if not UserInputService_upvr.KeyboardEnabled and not UserInputService_upvr.GamepadEnabled then
		return nil, false
	end
	local var54
	local DevComputerMovementMode = Players_upvr.LocalPlayer.DevComputerMovementMode
	if DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice then
		var54 = tbl_upvr[var19_upvw]
		if UserGameSettings_upvr.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and var54 == module_upvr_4 then
			var54 = module_upvr_7
			-- KONSTANTWARNING: GOTO [48] #36
		end
	else
		var54 = tbl_upvr_2[DevComputerMovementMode]
		if not var54 and DevComputerMovementMode ~= Enum.DevComputerMovementMode.Scriptable then
			warn("No character control module is associated with DevComputerMovementMode ", DevComputerMovementMode)
		end
	end
	if var54 then
		return var54, true
	end
	if DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable then
		return nil, true
	end
	return nil, false
end
function module_upvr.SelectTouchModule(arg1) -- Line 394
	--[[ Upvalues[4]:
		[1]: UserInputService_upvr (readonly)
		[2]: Players_upvr (readonly)
		[3]: tbl_upvr_2 (readonly)
		[4]: UserGameSettings_upvr (readonly)
	]]
	if not UserInputService_upvr.TouchEnabled then
		return nil, false
	end
	local var56
	local DevTouchMovementMode = Players_upvr.LocalPlayer.DevTouchMovementMode
	if DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
		var56 = tbl_upvr_2[UserGameSettings_upvr.TouchMovementMode]
	else
		if DevTouchMovementMode == Enum.DevTouchMovementMode.Scriptable then
			return nil, true
		end
		var56 = tbl_upvr_2[DevTouchMovementMode]
	end
	return var56, true
end
local function getGamepadRightThumbstickPosition_upvr() -- Line 410, Named "getGamepadRightThumbstickPosition"
	--[[ Upvalues[1]:
		[1]: UserInputService_upvr (readonly)
	]]
	for _, v in pairs(UserInputService_upvr:GetGamepadState(Enum.UserInputType.Gamepad1)) do
		if v.KeyCode == Enum.KeyCode.Thumbstick2 then
			return v.Position
		end
	end
	return Vector3.new(0, 0, 0)
end
local Workspace_upvr = game:GetService("Workspace")
function module_upvr.calculateRawMoveVector(arg1, arg2, arg3) -- Line 420
	--[[ Upvalues[3]:
		[1]: Workspace_upvr (readonly)
		[2]: VRService_upvr (readonly)
		[3]: getGamepadRightThumbstickPosition_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local CurrentCamera = Workspace_upvr.CurrentCamera
	if not CurrentCamera then
		return arg3
	end
	local var65
	if VRService_upvr.VREnabled and arg2.RootPart then
		local any_GetEstimatedVRTorsoFrame_result1 = arg1:GetEstimatedVRTorsoFrame()
		if (CurrentCamera.Focus.Position - var65.Position).Magnitude < 3 then
			var65 *= any_GetEstimatedVRTorsoFrame_result1
		else
			var65 = CurrentCamera.CFrame * (any_GetEstimatedVRTorsoFrame_result1.Rotation + any_GetEstimatedVRTorsoFrame_result1.Position * CurrentCamera.HeadScale)
		end
	end
	if arg2:GetState() == Enum.HumanoidStateType.Swimming then
		if VRService_upvr.VREnabled then
			local vector3 = Vector3.new(arg3.X, 0, arg3.Z)
			if vector3.Magnitude < 0.01 then
				return Vector3.new(0, 0, 0)
			end
			local _, any_ToEulerAnglesYXZ_result2, _ = var65:ToEulerAnglesYXZ()
			return CFrame.fromEulerAnglesYXZ(-getGamepadRightThumbstickPosition_upvr().Y * 1.3962634015954636, math.atan2(-vector3.X, -vector3.Z) + any_ToEulerAnglesYXZ_result2, 0).LookVector
		end
		return var65:VectorToWorldSpace(vector3)
	end
	local _, _, _, any_GetComponents_result4, any_GetComponents_result5, any_GetComponents_result6, _, _, any_GetComponents_result9, _, _, any_GetComponents_result12 = var65:GetComponents()
	local var83
	if any_GetComponents_result9 < 1 and -1 < any_GetComponents_result9 then
		var83 = any_GetComponents_result12
		local _ = any_GetComponents_result6
	else
		var83 = any_GetComponents_result4
	end
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	local squareroot = math.sqrt(var83 * var83 + (-any_GetComponents_result5 * math.sign(any_GetComponents_result9)) * (-any_GetComponents_result5 * math.sign(any_GetComponents_result9)))
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect (x2)
	return Vector3.new((var83 * vector3.X + -any_GetComponents_result5 * math.sign(any_GetComponents_result9) * vector3.Z) / squareroot, 0, (var83 * vector3.Z - -any_GetComponents_result5 * math.sign(any_GetComponents_result9) * vector3.X) / squareroot)
end
function module_upvr.OnRenderStepped(arg1, arg2) -- Line 479
	--[[ Upvalues[3]:
		[1]: module_upvr_3 (readonly)
		[2]: VRService_upvr (readonly)
		[3]: Players_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	local var93
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 3. Error Block 2 start (CF ANALYSIS FAILED)
	var93 = arg1.activeController.enabled
	-- KONSTANTERROR: [3] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 6. Error Block 3 start (CF ANALYSIS FAILED)
	var93 = arg1.humanoid
	-- KONSTANTERROR: [8] 6. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [33] 22. Error Block 41 start (CF ANALYSIS FAILED)
	if 0 < var93.magnitude then
		-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [38.4]
		nil:CleanupPath()
	else
		nil:OnRenderStepped(arg2)
		var93 = nil:GetMoveVector()
		local any_IsMoveVectorCameraRelative_result1 = nil:IsMoveVectorCameraRelative()
	end
	local var95
	if arg1.vehicleController then
		if arg1.activeControlModule ~= module_upvr_3 then
			var95 = false
		else
			var95 = true
		end
		local any_Update_result1_2, _ = arg1.vehicleController:Update(var93, any_IsMoveVectorCameraRelative_result1, var95)
		var93 = any_Update_result1_2
	end
	if any_IsMoveVectorCameraRelative_result1 then
		var93 = arg1:calculateRawMoveVector(arg1.humanoid, var93)
	end
	arg1.inputMoveVector = var93
	if VRService_upvr.VREnabled then
		var93 = arg1:updateVRMoveVector(var93)
	end
	arg1.moveFunction(Players_upvr.LocalPlayer, var93, false)
	local any_GetIsJumping_result1 = arg1.activeController:GetIsJumping()
	if not any_GetIsJumping_result1 then
		any_GetIsJumping_result1 = arg1.touchJumpController
		if any_GetIsJumping_result1 then
			any_GetIsJumping_result1 = arg1.touchJumpController:GetIsJumping()
		end
	end
	arg1.humanoid.Jump = any_GetIsJumping_result1
	-- KONSTANTERROR: [33] 22. Error Block 41 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [119] 83. Error Block 25 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [119] 83. Error Block 25 end (CF ANALYSIS FAILED)
end
function module_upvr.updateVRMoveVector(arg1, arg2) -- Line 528
	--[[ Upvalues[1]:
		[1]: VRService_upvr (readonly)
	]]
	local CurrentCamera_2 = workspace.CurrentCamera
	local var100
	if (CurrentCamera_2.Focus.Position - CurrentCamera_2.CFrame.Position).Magnitude < 5 then
		var100 = true
	end
	if arg2.Magnitude == 0 and var100 and VRService_upvr.AvatarGestures and arg1.humanoid and not arg1.humanoid.Sit then
		local any_GetUserCFrame_result1_2 = VRService_upvr:GetUserCFrame(Enum.UserCFrame.Head)
		local var102 = (CurrentCamera_2.CFrame * (any_GetUserCFrame_result1_2.Rotation + any_GetUserCFrame_result1_2.Position * CurrentCamera_2.HeadScale) * CFrame.new(0, -0.7 * arg1.humanoid.RootPart.Size.Y / 2, 0)).Position - arg1.humanoid.RootPart.CFrame.Position
		return Vector3.new(var102.x, 0, var102.z)
	end
	return arg2
end
function module_upvr.OnHumanoidSeated(arg1, arg2, arg3) -- Line 553
	--[[ Upvalues[1]:
		[1]: Value_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [7] 7. Error Block 12 start (CF ANALYSIS FAILED)
	if not arg1.vehicleController then
		arg1.vehicleController = arg1.vehicleController.new(Value_upvr)
	end
	arg1.vehicleController:Enable(true, arg3)
	do
		return
	end
	-- KONSTANTERROR: [7] 7. Error Block 12 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [26] 20. Error Block 10 start (CF ANALYSIS FAILED)
	if arg1.vehicleController then
		arg1.vehicleController:Enable(false, arg3)
	end
	-- KONSTANTERROR: [26] 20. Error Block 10 end (CF ANALYSIS FAILED)
end
function module_upvr.OnCharacterAdded(arg1, arg2) -- Line 568
	arg1.humanoid = arg2:FindFirstChildOfClass("Humanoid")
	while not arg1.humanoid do
		arg2.ChildAdded:wait()
		arg1.humanoid = arg2:FindFirstChildOfClass("Humanoid")
	end
	arg1:UpdateTouchGuiVisibility()
	if arg1.humanoidSeatedConn then
		arg1.humanoidSeatedConn:Disconnect()
		arg1.humanoidSeatedConn = nil
	end
	arg1.humanoidSeatedConn = arg1.humanoid.Seated:Connect(function(arg1_2, arg2_2) -- Line 581
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:OnHumanoidSeated(arg1_2, arg2_2)
	end)
end
function module_upvr.OnCharacterRemoving(arg1, arg2) -- Line 586
	arg1.humanoid = nil
	arg1:UpdateTouchGuiVisibility()
end
function module_upvr.UpdateTouchGuiVisibility(arg1) -- Line 592
	--[[ Upvalues[1]:
		[1]: GuiService_upvr (readonly)
	]]
	if arg1.touchGui then
		local humanoid = arg1.humanoid
		if humanoid then
			humanoid = GuiService_upvr.TouchControlsEnabled
		end
		arg1.touchGui.Enabled = not not humanoid
	end
end
function module_upvr.SwitchToController(arg1, arg2) -- Line 606
	--[[ Upvalues[1]:
		[1]: Value_upvr (readonly)
	]]
	if not arg2 then
		if arg1.activeController then
			arg1.activeController:Enable(false)
		end
		arg1.activeController = nil
		arg1.activeControlModule = nil
	else
		if not arg1.controllers[arg2] then
			arg1.controllers[arg2] = arg2.new(Value_upvr)
		end
		if arg1.activeController ~= arg1.controllers[arg2] then
			if arg1.activeController then
				arg1.activeController:Enable(false)
			end
			arg1.activeController = arg1.controllers[arg2]
			arg1.activeControlModule = arg2
			arg1:UpdateActiveControlModuleEnabled()
		end
	end
end
function module_upvr.OnLastInputTypeChanged(arg1, arg2) -- Line 634
	--[[ Upvalues[2]:
		[1]: var19_upvw (read and write)
		[2]: tbl_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 28 start (CF ANALYSIS FAILED)
	if var19_upvw == arg2 then
		warn("LastInputType Change listener called with current type.")
	end
	var19_upvw = arg2
	if var19_upvw == Enum.UserInputType.Touch then
		local any_SelectTouchModule_result1_2, any_SelectTouchModule_result2_3 = arg1:SelectTouchModule()
		if any_SelectTouchModule_result2_3 then
			while not arg1.touchControlFrame do
				wait()
			end
			arg1:SwitchToController(any_SelectTouchModule_result1_2)
			-- KONSTANTWARNING: GOTO [42] #32
		end
	elseif tbl_upvr[var19_upvw] ~= nil then
		local any_SelectComputerMovementModule_result1 = arg1:SelectComputerMovementModule()
		if any_SelectComputerMovementModule_result1 then
			arg1:SwitchToController(any_SelectComputerMovementModule_result1)
		end
	end
	-- KONSTANTERROR: [0] 1. Error Block 28 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [42] 32. Error Block 14 start (CF ANALYSIS FAILED)
	arg1:UpdateTouchGuiVisibility()
	-- KONSTANTERROR: [42] 32. Error Block 14 end (CF ANALYSIS FAILED)
end
function module_upvr.OnComputerMovementModeChange(arg1) -- Line 661
	local any_SelectComputerMovementModule_result1_3, any_SelectComputerMovementModule_result2 = arg1:SelectComputerMovementModule()
	if any_SelectComputerMovementModule_result2 then
		arg1:SwitchToController(any_SelectComputerMovementModule_result1_3)
	end
end
function module_upvr.OnTouchMovementModeChange(arg1) -- Line 668
	local any_SelectTouchModule_result1, any_SelectTouchModule_result2 = arg1:SelectTouchModule()
	if any_SelectTouchModule_result2 then
		while not arg1.touchControlFrame do
			wait()
		end
		arg1:SwitchToController(any_SelectTouchModule_result1)
	end
end
local var115_upvw = pcall_result1 and pcall_result2
function module_upvr.CreateTouchGuiContainer(arg1) -- Line 678
	--[[ Upvalues[1]:
		[1]: var115_upvw (read and write)
	]]
	if arg1.touchGui then
		arg1.touchGui:Destroy()
	end
	arg1.touchGui = Instance.new("ScreenGui")
	arg1.touchGui.Name = "TouchGui"
	arg1.touchGui.ResetOnSpawn = false
	arg1.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	arg1:UpdateTouchGuiVisibility()
	if var115_upvw then
		arg1.touchGui.ClipToDeviceSafeArea = false
	end
	arg1.touchControlFrame = Instance.new("Frame")
	arg1.touchControlFrame.Name = "TouchControlFrame"
	arg1.touchControlFrame.Size = UDim2.new(1, 0, 1, 0)
	arg1.touchControlFrame.BackgroundTransparency = 1
	arg1.touchControlFrame.Parent = arg1.touchGui
	arg1.touchGui.Parent = arg1.playerGui
end
function module_upvr.GetClickToMoveController(arg1) -- Line 701
	--[[ Upvalues[2]:
		[1]: module_upvr_7 (readonly)
		[2]: Value_upvr (readonly)
	]]
	if not arg1.controllers[module_upvr_7] then
		arg1.controllers[module_upvr_7] = module_upvr_7.new(Value_upvr)
	end
	return arg1.controllers[module_upvr_7]
end
return module_upvr.new()