--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraInput
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:10
-- Luau version 6, Types version 3
-- Time taken: 0.013131 seconds

local UserInputService_upvr = game:GetService("UserInputService")
local VRService_upvr = game:GetService("VRService")
local any_getUserFlag_result1_upvr = require(script.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil")).getUserFlag("UserCameraInputDt")
local var4_upvw = Vector2.new(1, 0.77) * 0.06981317007977318
local var5_upvr
if any_getUserFlag_result1_upvr then
	var4_upvw *= 60
end
local pcall_result1, pcall_result2 = pcall(function() -- Line 41
	return UserSettings():IsUserFeatureEnabled("UserResetTouchStateOnMenuOpen")
end)
local var9_upvw = pcall_result1 and pcall_result2
local pcall_result1_2, pcall_result2_3 = pcall(function() -- Line 49
	return UserSettings():IsUserFeatureEnabled("UserClearPanOnCameraDisable")
end)
local pcall_result1_3, pcall_result2_2 = pcall(function() -- Line 57
	return UserSettings():IsUserFeatureEnabled("UserFixGamepadSensitivity")
end)
local BindableEvent_upvw = Instance.new("BindableEvent")
local BindableEvent_upvr = Instance.new("BindableEvent")
UserInputService_upvr.InputBegan:Connect(function(arg1, arg2) -- Line 71
	--[[ Upvalues[1]:
		[1]: BindableEvent_upvw (readonly)
	]]
	if not arg2 and arg1.UserInputType == Enum.UserInputType.MouseButton2 then
		BindableEvent_upvw:Fire()
	end
end)
UserInputService_upvr.InputEnded:Connect(function(arg1, arg2) -- Line 77
	--[[ Upvalues[1]:
		[1]: BindableEvent_upvr (readonly)
	]]
	if arg1.UserInputType == Enum.UserInputType.MouseButton2 then
		BindableEvent_upvr:Fire()
	end
end)
BindableEvent_upvw = nil
function BindableEvent_upvw(arg1) -- Line 88, Named "thumbstickCurve"
	return math.sign(arg1) * math.clamp((math.exp((math.abs(arg1) - 0.1) / 0.9 * 2) - 1) / 6.38905609893065, 0, 1)
end
function BindableEvent_upvr(arg1) -- Line 102, Named "adjustTouchPitchSensitivity"
	local CurrentCamera = workspace.CurrentCamera
	if not CurrentCamera then
		return arg1
	end
	local any_ToEulerAnglesYXZ_result1 = CurrentCamera.CFrame:ToEulerAnglesYXZ()
	if 0 <= arg1.Y * any_ToEulerAnglesYXZ_result1 then
		return arg1
	end
	return Vector2.new(1, (1 - (math.abs(any_ToEulerAnglesYXZ_result1) * 2 / math.pi) ^ 0.75) * 0.75 + 0.25) * arg1
end
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local function isInDynamicThumbstickArea_upvr(arg1) -- Line 128, Named "isInDynamicThumbstickArea"
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	local var37 = LocalPlayer_upvr:FindFirstChildOfClass("PlayerGui")
	if var37 then
		var37 = LocalPlayer_upvr:FindFirstChildOfClass("PlayerGui"):FindFirstChild("TouchGui")
	end
	local var38 = var37
	if var38 then
		var38 = var37:FindFirstChild("TouchControlFrame")
	end
	local var39 = var38
	if var39 then
		var39 = var38:FindFirstChild("DynamicThumbstickFrame")
	end
	if not var39 then
		return false
	end
	if not var37.Enabled then
		return false
	end
	local AbsolutePosition_3 = var39.AbsolutePosition
	local var41 = AbsolutePosition_3 + var39.AbsoluteSize
	local var42 = false
	if AbsolutePosition_3.X <= arg1.X then
		var42 = false
		if AbsolutePosition_3.Y <= arg1.Y then
			var42 = false
			if arg1.X <= var41.X then
				if arg1.Y > var41.Y then
					var42 = false
				else
					var42 = true
				end
			end
		end
	end
	return var42
end
local var43_upvw = (1/60)
game:GetService("RunService").Stepped:Connect(function(arg1, arg2) -- Line 153
	--[[ Upvalues[1]:
		[1]: var43_upvw (read and write)
	]]
	var43_upvw = arg2
end)
local module = {}
local var46_upvw = 0
local function _() -- Line 163, Named "incPanInputCount"
	--[[ Upvalues[1]:
		[1]: var46_upvw (read and write)
	]]
	var46_upvw = math.max(0, var46_upvw + 1)
end
local function _() -- Line 167, Named "decPanInputCount"
	--[[ Upvalues[1]:
		[1]: var46_upvw (read and write)
	]]
	var46_upvw = math.max(0, var46_upvw - 1)
end
local function _() -- Line 171, Named "resetPanInputCount"
	--[[ Upvalues[1]:
		[1]: var46_upvw (read and write)
	]]
	var46_upvw = 0
end
local tbl_upvr_3 = {
	Thumbstick2 = Vector2.new();
}
local tbl_upvr_2 = {
	Left = 0;
	Right = 0;
	I = 0;
	O = 0;
}
local tbl_upvr = {
	Movement = Vector2.new();
	Wheel = 0;
	Pan = Vector2.new();
	Pinch = 0;
}
local tbl_upvr_4 = {
	Move = Vector2.new();
	Pinch = 0;
}
var5_upvr = "BindableEvent"
local any_upvr = Instance.new(var5_upvr)
var5_upvr = any_upvr.Event
module.gamepadZoomPress = var5_upvr
local function INLINED() -- Internal function, doesn't exist in bytecode
	var5_upvr = Instance.new("BindableEvent")
	return var5_upvr
end
if not VRService_upvr.VREnabled or not INLINED() then
	var5_upvr = nil
end
if VRService_upvr.VREnabled then
	module.gamepadReset = var5_upvr.Event
end
function module.getRotationActivated() -- Line 204
	--[[ Upvalues[2]:
		[1]: var46_upvw (read and write)
		[2]: tbl_upvr_3 (readonly)
	]]
	local var52 = true
	if 0 >= var46_upvw then
		if 0 >= tbl_upvr_3.Thumbstick2.Magnitude then
			var52 = false
		else
			var52 = true
		end
	end
	return var52
end
local UserGameSettings_upvr = UserSettings():GetService("UserGameSettings")
local var54_upvw = pcall_result1_3 and pcall_result2_2
local var55_upvr = Vector2.new(1, 0.77) * 0.008726646259971648
local var56_upvr = Vector2.new(1, 0.77) * 0.12217304763960307
local var57_upvr = Vector2.new(1, 0.66) * 0.017453292519943295
function module.getRotation(arg1, arg2) -- Line 208
	--[[ Upvalues[13]:
		[1]: UserGameSettings_upvr (readonly)
		[2]: any_getUserFlag_result1_upvr (readonly)
		[3]: tbl_upvr_2 (readonly)
		[4]: var43_upvw (read and write)
		[5]: var54_upvw (read and write)
		[6]: tbl_upvr_3 (readonly)
		[7]: tbl_upvr (readonly)
		[8]: BindableEvent_upvr (readonly)
		[9]: tbl_upvr_4 (readonly)
		[10]: var4_upvw (read and write)
		[11]: var55_upvr (readonly)
		[12]: var56_upvr (readonly)
		[13]: var57_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var58
	if var58 then
		var58 = Vector2.new(tbl_upvr_2.Right - tbl_upvr_2.Left, 0)
	else
		var58 = Vector2.new(tbl_upvr_2.Right - tbl_upvr_2.Left, 0)
	end
	var58 = nil
	if var54_upvw then
		var58 = tbl_upvr_3.Thumbstick2 * UserGameSettings_upvr.GamepadCameraSensitivity
	else
		var58 = tbl_upvr_3.Thumbstick2
	end
	if any_getUserFlag_result1_upvr then
		var58 *= arg1
	end
	if arg2 then
	end
	return (Vector2.new() * 2.0943951023931953 + var58 * var4_upvw + tbl_upvr.Movement * var55_upvr + tbl_upvr.Pan * var56_upvr + BindableEvent_upvr(tbl_upvr_4.Move) * var57_upvr) * Vector2.new(1, UserGameSettings_upvr:GetCameraYInvertValue())
end
function module.getZoomDelta() -- Line 248
	--[[ Upvalues[3]:
		[1]: tbl_upvr_2 (readonly)
		[2]: tbl_upvr (readonly)
		[3]: tbl_upvr_4 (readonly)
	]]
	return (tbl_upvr_2.O - tbl_upvr_2.I) * 0.1 + (-tbl_upvr.Wheel + tbl_upvr.Pinch) * 1 + -tbl_upvr_4.Pinch * 0.04
end
local function thumbstick_upvr(arg1, arg2, arg3) -- Line 256, Named "thumbstick"
	--[[ Upvalues[2]:
		[1]: tbl_upvr_3 (readonly)
		[2]: BindableEvent_upvw (read and write)
	]]
	local Position = arg3.Position
	tbl_upvr_3[arg3.KeyCode.Name] = Vector2.new(BindableEvent_upvw(Position.X), -BindableEvent_upvw(Position.Y))
	return Enum.ContextActionResult.Pass
end
local function _(arg1) -- Line 262, Named "mouseMovement"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local Delta = arg1.Delta
	tbl_upvr.Movement = Vector2.new(Delta.X, Delta.Y)
end
local function _(arg1, arg2, arg3) -- Line 267, Named "mouseWheel"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	tbl_upvr.Wheel = arg3.Position.Z
	return Enum.ContextActionResult.Pass
end
local function keypress_upvr(arg1, arg2, arg3) -- Line 272, Named "keypress"
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	local KeyCode = arg3.KeyCode
	if arg2 == Enum.UserInputState.Begin then
		KeyCode = 1
	else
		KeyCode = 0
	end
	tbl_upvr_2[KeyCode.Name] = KeyCode
end
local function gamepadZoomPress_upvr(arg1, arg2, arg3) -- Line 276, Named "gamepadZoomPress"
	--[[ Upvalues[1]:
		[1]: any_upvr (readonly)
	]]
	if arg2 == Enum.UserInputState.Begin then
		any_upvr:Fire()
	end
end
local function gamepadReset_upvr(arg1, arg2, arg3) -- Line 282, Named "gamepadReset"
	--[[ Upvalues[1]:
		[1]: var5_upvr (readonly)
	]]
	if arg2 == Enum.UserInputState.Begin then
		var5_upvr:Fire()
	end
end
local var62_upvw = pcall_result1_2 and pcall_result2_3
local function resetInputDevices_upvr() -- Line 288, Named "resetInputDevices"
	--[[ Upvalues[6]:
		[1]: tbl_upvr_3 (readonly)
		[2]: tbl_upvr_2 (readonly)
		[3]: tbl_upvr (readonly)
		[4]: tbl_upvr_4 (readonly)
		[5]: var62_upvw (read and write)
		[6]: var46_upvw (read and write)
	]]
	for _, v in pairs({tbl_upvr_3, tbl_upvr_2, tbl_upvr, tbl_upvr_4}) do
		for i_2, v_2 in pairs(v) do
			if type(v_2) == "boolean" then
				v[i_2] = false
			else
				v[i_2] *= 0
			end
		end
	end
	if var62_upvw then
		var46_upvw = 0
	end
end
local tbl_upvw_2 = {}
local var75_upvw
local var76_upvw
local function touchBegan_upvw(arg1, arg2) -- Line 316, Named "touchBegan"
	--[[ Upvalues[4]:
		[1]: var75_upvw (read and write)
		[2]: isInDynamicThumbstickArea_upvr (readonly)
		[3]: var46_upvw (read and write)
		[4]: tbl_upvw_2 (read and write)
	]]
	local var78
	if arg1.UserInputType ~= Enum.UserInputType.Touch then
		var78 = false
	else
		var78 = true
	end
	assert(var78)
	if arg1.UserInputState ~= Enum.UserInputState.Begin then
		var78 = false
	else
		var78 = true
	end
	assert(var78)
	if var75_upvw == nil then
		var78 = arg1.Position
		if isInDynamicThumbstickArea_upvr(var78) and not arg2 then
			var75_upvw = arg1
			return
		end
	end
	if not arg2 then
		var78 = 0
		var46_upvw = math.max(var78, var46_upvw + 1)
	end
	tbl_upvw_2[arg1] = arg2
end
local function touchEnded_upvw(arg1, arg2) -- Line 336, Named "touchEnded"
	--[[ Upvalues[4]:
		[1]: var75_upvw (read and write)
		[2]: tbl_upvw_2 (read and write)
		[3]: var76_upvw (read and write)
		[4]: var46_upvw (read and write)
	]]
	local var79
	if arg1.UserInputType ~= Enum.UserInputType.Touch then
		var79 = false
	else
		var79 = true
	end
	assert(var79)
	if arg1.UserInputState ~= Enum.UserInputState.End then
		var79 = false
	else
		var79 = true
	end
	assert(var79)
	if arg1 == var75_upvw then
		var75_upvw = nil
	end
	var79 = tbl_upvw_2
	if var79[arg1] == false then
		var76_upvw = nil
		var79 = 0
		var46_upvw = math.max(var79, var46_upvw - 1)
	end
	var79 = nil
	tbl_upvw_2[arg1] = var79
end
local function touchChanged_upvw(arg1, arg2) -- Line 355, Named "touchChanged"
	--[[ Upvalues[4]:
		[1]: var75_upvw (read and write)
		[2]: tbl_upvw_2 (read and write)
		[3]: tbl_upvr_4 (readonly)
		[4]: var76_upvw (read and write)
	]]
	local var95
	if arg1.UserInputType ~= Enum.UserInputType.Touch then
		var95 = false
	else
		var95 = true
	end
	assert(var95)
	if arg1.UserInputState ~= Enum.UserInputState.Change then
		var95 = false
	else
		var95 = true
	end
	assert(var95)
	if arg1 == var75_upvw then
	else
		var95 = tbl_upvw_2
		if var95[arg1] == nil then
			tbl_upvw_2[arg1] = arg2
		end
		local tbl_2 = {}
		var95 = pairs(tbl_upvw_2)
		local pairs_result1_2, pairs_result2, pairs_result3_3 = pairs(tbl_upvw_2)
		for i_3, v_3 in pairs_result1_2, pairs_result2, pairs_result3_3 do
			if not v_3 then
				table.insert(tbl_2, i_3)
			end
		end
		pairs_result1_2 = #tbl_2
		if pairs_result1_2 == 1 then
			pairs_result1_2 = tbl_upvw_2[arg1]
			if pairs_result1_2 == false then
				pairs_result1_2 = arg1.Delta
				local var100 = tbl_upvr_4
				i_3 = Vector2.new
				v_3 = pairs_result1_2.X
				i_3 = i_3(v_3, pairs_result1_2.Y)
				var100.Move += i_3
			end
		end
		pairs_result1_2 = #tbl_2
		if pairs_result1_2 == 2 then
			i_3 = tbl_2[1]
			v_3 = tbl_2[2]
			i_3 = v_3.Position
			pairs_result1_2 = (i_3.Position - i_3).Magnitude
			if var76_upvw then
				local var101 = tbl_upvr_4
				v_3 = var76_upvw
				i_3 = pairs_result1_2 - v_3
				var101.Pinch += i_3
			end
			var76_upvw = pairs_result1_2
			return
		end
		pairs_result1_2 = nil
		var76_upvw = pairs_result1_2
	end
end
local function resetTouchState_upvw() -- Line 399, Named "resetTouchState"
	--[[ Upvalues[5]:
		[1]: tbl_upvw_2 (read and write)
		[2]: var75_upvw (read and write)
		[3]: var76_upvw (read and write)
		[4]: var9_upvw (read and write)
		[5]: var46_upvw (read and write)
	]]
	tbl_upvw_2 = {}
	var75_upvw = nil
	var76_upvw = nil
	if var9_upvw then
		var46_upvw = 0
	end
end
local function pointerAction_upvr(arg1, arg2, arg3, arg4) -- Line 409, Named "pointerAction"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	if not arg4 then
		tbl_upvr.Wheel = arg1
		tbl_upvr.Pan = arg2
		tbl_upvr.Pinch = -arg3
	end
end
local function inputBegan_upvr(arg1, arg2) -- Line 417, Named "inputBegan"
	--[[ Upvalues[2]:
		[1]: touchBegan_upvw (read and write)
		[2]: var46_upvw (read and write)
	]]
	if arg1.UserInputType == Enum.UserInputType.Touch then
		touchBegan_upvw(arg1, arg2)
	elseif arg1.UserInputType == Enum.UserInputType.MouseButton2 and not arg2 then
		var46_upvw = math.max(0, var46_upvw + 1)
	end
end
local function inputChanged_upvr(arg1, arg2) -- Line 426, Named "inputChanged"
	--[[ Upvalues[2]:
		[1]: touchChanged_upvw (read and write)
		[2]: tbl_upvr (readonly)
	]]
	if arg1.UserInputType == Enum.UserInputType.Touch then
		touchChanged_upvw(arg1, arg2)
	elseif arg1.UserInputType == Enum.UserInputType.MouseMovement then
		local Delta_2 = arg1.Delta
		tbl_upvr.Movement = Vector2.new(Delta_2.X, Delta_2.Y)
	end
end
local function inputEnded_upvr(arg1, arg2) -- Line 435, Named "inputEnded"
	--[[ Upvalues[2]:
		[1]: touchEnded_upvw (read and write)
		[2]: var46_upvw (read and write)
	]]
	if arg1.UserInputType == Enum.UserInputType.Touch then
		touchEnded_upvw(arg1, arg2)
	elseif arg1.UserInputType == Enum.UserInputType.MouseButton2 then
		var46_upvw = math.max(0, var46_upvw - 1)
	end
end
local var103_upvw = false
local ContextActionService_upvr = game:GetService("ContextActionService")
local Value_upvr = Enum.ContextActionPriority.Medium.Value
local tbl_upvw = {}
function module.setInputEnabled(arg1) -- Line 446
	--[[ Upvalues[17]:
		[1]: var103_upvw (read and write)
		[2]: resetInputDevices_upvr (readonly)
		[3]: resetTouchState_upvw (read and write)
		[4]: ContextActionService_upvr (readonly)
		[5]: thumbstick_upvr (readonly)
		[6]: Value_upvr (readonly)
		[7]: keypress_upvr (readonly)
		[8]: VRService_upvr (readonly)
		[9]: gamepadReset_upvr (readonly)
		[10]: gamepadZoomPress_upvr (readonly)
		[11]: tbl_upvw (read and write)
		[12]: UserInputService_upvr (readonly)
		[13]: inputBegan_upvr (readonly)
		[14]: inputChanged_upvr (readonly)
		[15]: inputEnded_upvr (readonly)
		[16]: pointerAction_upvr (readonly)
		[17]: var9_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 3. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [3] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 4. Error Block 3 start (CF ANALYSIS FAILED)
	var103_upvw = arg1
	resetInputDevices_upvr()
	resetTouchState_upvw()
	-- KONSTANTERROR: [4] 4. Error Block 3 end (CF ANALYSIS FAILED)
end
function module.getInputEnabled() -- Line 518
	--[[ Upvalues[1]:
		[1]: var103_upvw (read and write)
	]]
	return var103_upvw
end
function module.resetInputForFrameEnd() -- Line 522
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: tbl_upvr_4 (readonly)
	]]
	tbl_upvr.Movement = Vector2.new()
	tbl_upvr_4.Move = Vector2.new()
	tbl_upvr_4.Pinch = 0
	tbl_upvr.Wheel = 0
	tbl_upvr.Pan = Vector2.new()
	tbl_upvr.Pinch = 0
end
UserInputService_upvr.WindowFocused:Connect(resetInputDevices_upvr)
UserInputService_upvr.WindowFocusReleased:Connect(resetInputDevices_upvr)
local var107_upvw = false
local var108_upvw = false
function module.getHoldPan() -- Line 543
	--[[ Upvalues[1]:
		[1]: var107_upvw (read and write)
	]]
	return var107_upvw
end
function module.getTogglePan() -- Line 547
	--[[ Upvalues[1]:
		[1]: var108_upvw (read and write)
	]]
	return var108_upvw
end
function module.getPanning() -- Line 551
	--[[ Upvalues[2]:
		[1]: var108_upvw (read and write)
		[2]: var107_upvw (read and write)
	]]
	local var109 = var108_upvw
	if not var109 then
		var109 = var107_upvw
	end
	return var109
end
function module.setTogglePan(arg1) -- Line 555
	--[[ Upvalues[1]:
		[1]: var108_upvw (read and write)
	]]
	var108_upvw = arg1
end
local var110_upvw = false
local var111_upvw
local var112_upvw
local Event_upvw_2 = BindableEvent_upvw.Event
local var114_upvw = 0
local Event_upvw = BindableEvent_upvr.Event
function module.enableCameraToggleInput() -- Line 563
	--[[ Upvalues[9]:
		[1]: var110_upvw (read and write)
		[2]: var107_upvw (read and write)
		[3]: var108_upvw (read and write)
		[4]: var111_upvw (read and write)
		[5]: var112_upvw (read and write)
		[6]: Event_upvw_2 (read and write)
		[7]: var114_upvw (read and write)
		[8]: Event_upvw (read and write)
		[9]: UserInputService_upvr (readonly)
	]]
	if var110_upvw then
	else
		var110_upvw = true
		var107_upvw = false
		var108_upvw = false
		if var111_upvw then
			var111_upvw:Disconnect()
		end
		if var112_upvw then
			var112_upvw:Disconnect()
		end
		var111_upvw = Event_upvw_2:Connect(function() -- Line 580
			--[[ Upvalues[2]:
				[1]: var107_upvw (copied, read and write)
				[2]: var114_upvw (copied, read and write)
			]]
			var107_upvw = true
			var114_upvw = tick()
		end)
		var112_upvw = Event_upvw:Connect(function() -- Line 585
			--[[ Upvalues[4]:
				[1]: var107_upvw (copied, read and write)
				[2]: var114_upvw (copied, read and write)
				[3]: var108_upvw (copied, read and write)
				[4]: UserInputService_upvr (copied, readonly)
			]]
			var107_upvw = false
			if tick() - var114_upvw < 0.3 and (var108_upvw or UserInputService_upvr:GetMouseDelta().Magnitude < 2) then
				var108_upvw = not var108_upvw
			end
		end)
	end
end
function module.disableCameraToggleInput() -- Line 593
	--[[ Upvalues[3]:
		[1]: var110_upvw (read and write)
		[2]: var111_upvw (read and write)
		[3]: var112_upvw (read and write)
	]]
	if not var110_upvw then
	else
		var110_upvw = false
		if var111_upvw then
			var111_upvw:Disconnect()
			var111_upvw = nil
		end
		if var112_upvw then
			var112_upvw:Disconnect()
			var112_upvw = nil
		end
	end
end
return module