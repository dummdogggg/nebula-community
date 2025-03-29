--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraInput
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:40
-- Luau version 6, Types version 3
-- Time taken: 0.012097 seconds

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
local pcall_result1_2, pcall_result2_2 = pcall(function() -- Line 49
	return UserSettings():IsUserFeatureEnabled("UserClearPanOnCameraDisable")
end)
local BindableEvent_upvw = Instance.new("BindableEvent")
local BindableEvent_upvr = Instance.new("BindableEvent")
UserInputService_upvr.InputBegan:Connect(function(arg1, arg2) -- Line 63
	--[[ Upvalues[1]:
		[1]: BindableEvent_upvw (readonly)
	]]
	if not arg2 and arg1.UserInputType == Enum.UserInputType.MouseButton2 then
		BindableEvent_upvw:Fire()
	end
end)
UserInputService_upvr.InputEnded:Connect(function(arg1, arg2) -- Line 69
	--[[ Upvalues[1]:
		[1]: BindableEvent_upvr (readonly)
	]]
	if arg1.UserInputType == Enum.UserInputType.MouseButton2 then
		BindableEvent_upvr:Fire()
	end
end)
BindableEvent_upvw = nil
function BindableEvent_upvw(arg1) -- Line 80, Named "thumbstickCurve"
	return math.sign(arg1) * math.clamp((math.exp((math.abs(arg1) - 0.1) / 0.9 * 2) - 1) / 6.38905609893065, 0, 1)
end
function BindableEvent_upvr(arg1) -- Line 94, Named "adjustTouchPitchSensitivity"
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
local function isInDynamicThumbstickArea_upvr(arg1) -- Line 120, Named "isInDynamicThumbstickArea"
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	local var34 = LocalPlayer_upvr:FindFirstChildOfClass("PlayerGui")
	if var34 then
		var34 = LocalPlayer_upvr:FindFirstChildOfClass("PlayerGui"):FindFirstChild("TouchGui")
	end
	local var35 = var34
	if var35 then
		var35 = var34:FindFirstChild("TouchControlFrame")
	end
	local var36 = var35
	if var36 then
		var36 = var35:FindFirstChild("DynamicThumbstickFrame")
	end
	if not var36 then
		return false
	end
	if not var34.Enabled then
		return false
	end
	local AbsolutePosition = var36.AbsolutePosition
	local var38 = AbsolutePosition + var36.AbsoluteSize
	local var39 = false
	if AbsolutePosition.X <= arg1.X then
		var39 = false
		if AbsolutePosition.Y <= arg1.Y then
			var39 = false
			if arg1.X <= var38.X then
				if arg1.Y > var38.Y then
					var39 = false
				else
					var39 = true
				end
			end
		end
	end
	return var39
end
local var40_upvw = (1/60)
game:GetService("RunService").Stepped:Connect(function(arg1, arg2) -- Line 145
	--[[ Upvalues[1]:
		[1]: var40_upvw (read and write)
	]]
	var40_upvw = arg2
end)
local module = {}
local var43_upvw = 0
local function _() -- Line 155, Named "incPanInputCount"
	--[[ Upvalues[1]:
		[1]: var43_upvw (read and write)
	]]
	var43_upvw = math.max(0, var43_upvw + 1)
end
local function _() -- Line 159, Named "decPanInputCount"
	--[[ Upvalues[1]:
		[1]: var43_upvw (read and write)
	]]
	var43_upvw = math.max(0, var43_upvw - 1)
end
local function _() -- Line 163, Named "resetPanInputCount"
	--[[ Upvalues[1]:
		[1]: var43_upvw (read and write)
	]]
	var43_upvw = 0
end
local tbl_6_upvr = {
	Thumbstick2 = Vector2.new();
}
local tbl_7_upvr = {
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
local tbl_2_upvr = {
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
function module.getRotationActivated() -- Line 196
	--[[ Upvalues[2]:
		[1]: var43_upvw (read and write)
		[2]: tbl_6_upvr (readonly)
	]]
	local var49 = true
	if 0 >= var43_upvw then
		if 0 >= tbl_6_upvr.Thumbstick2.Magnitude then
			var49 = false
		else
			var49 = true
		end
	end
	return var49
end
local UserGameSettings_upvr = UserSettings():GetService("UserGameSettings")
local var51_upvr = Vector2.new(1, 0.77) * 0.008726646259971648
local var52_upvr = Vector2.new(1, 0.77) * 0.12217304763960307
local var53_upvr = Vector2.new(1, 0.66) * 0.017453292519943295
function module.getRotation(arg1, arg2) -- Line 200
	--[[ Upvalues[12]:
		[1]: UserGameSettings_upvr (readonly)
		[2]: any_getUserFlag_result1_upvr (readonly)
		[3]: tbl_7_upvr (readonly)
		[4]: var40_upvw (read and write)
		[5]: tbl_6_upvr (readonly)
		[6]: tbl_upvr (readonly)
		[7]: BindableEvent_upvr (readonly)
		[8]: tbl_2_upvr (readonly)
		[9]: var4_upvw (read and write)
		[10]: var51_upvr (readonly)
		[11]: var52_upvr (readonly)
		[12]: var53_upvr (readonly)
	]]
	local var54
	if any_getUserFlag_result1_upvr then
		var54 = Vector2.new(tbl_7_upvr.Right - tbl_7_upvr.Left, 0) * arg1
	else
		var54 = Vector2.new(tbl_7_upvr.Right - tbl_7_upvr.Left, 0) * var40_upvw
	end
	local var55 = tbl_6_upvr.Thumbstick2 * UserGameSettings_upvr.GamepadCameraSensitivity
	if any_getUserFlag_result1_upvr then
		var55 *= arg1
	end
	if arg2 then
		var54 = Vector2.new()
	end
	return (var54 * 2.0943951023931953 + var55 * var4_upvw + tbl_upvr.Movement * var51_upvr + tbl_upvr.Pan * var52_upvr + BindableEvent_upvr(tbl_2_upvr.Move) * var53_upvr) * Vector2.new(1, UserGameSettings_upvr:GetCameraYInvertValue())
end
function module.getZoomDelta() -- Line 234
	--[[ Upvalues[3]:
		[1]: tbl_7_upvr (readonly)
		[2]: tbl_upvr (readonly)
		[3]: tbl_2_upvr (readonly)
	]]
	return (tbl_7_upvr.O - tbl_7_upvr.I) * 0.1 + (-tbl_upvr.Wheel + tbl_upvr.Pinch) * 1 + -tbl_2_upvr.Pinch * 0.04
end
local function thumbstick_upvr(arg1, arg2, arg3) -- Line 242, Named "thumbstick"
	--[[ Upvalues[2]:
		[1]: tbl_6_upvr (readonly)
		[2]: BindableEvent_upvw (read and write)
	]]
	local Position = arg3.Position
	tbl_6_upvr[arg3.KeyCode.Name] = Vector2.new(BindableEvent_upvw(Position.X), -BindableEvent_upvw(Position.Y))
	return Enum.ContextActionResult.Pass
end
local function _(arg1) -- Line 248, Named "mouseMovement"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local Delta_2 = arg1.Delta
	tbl_upvr.Movement = Vector2.new(Delta_2.X, Delta_2.Y)
end
local function _(arg1, arg2, arg3) -- Line 253, Named "mouseWheel"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	tbl_upvr.Wheel = arg3.Position.Z
	return Enum.ContextActionResult.Pass
end
local function keypress_upvr(arg1, arg2, arg3) -- Line 258, Named "keypress"
	--[[ Upvalues[1]:
		[1]: tbl_7_upvr (readonly)
	]]
	local KeyCode = arg3.KeyCode
	if arg2 == Enum.UserInputState.Begin then
		KeyCode = 1
	else
		KeyCode = 0
	end
	tbl_7_upvr[KeyCode.Name] = KeyCode
end
local function gamepadZoomPress_upvr(arg1, arg2, arg3) -- Line 262, Named "gamepadZoomPress"
	--[[ Upvalues[1]:
		[1]: any_upvr (readonly)
	]]
	if arg2 == Enum.UserInputState.Begin then
		any_upvr:Fire()
	end
end
local function gamepadReset_upvr(arg1, arg2, arg3) -- Line 268, Named "gamepadReset"
	--[[ Upvalues[1]:
		[1]: var5_upvr (readonly)
	]]
	if arg2 == Enum.UserInputState.Begin then
		var5_upvr:Fire()
	end
end
local var59_upvw = pcall_result1_2 and pcall_result2_2
local function resetInputDevices_upvr() -- Line 274, Named "resetInputDevices"
	--[[ Upvalues[6]:
		[1]: tbl_6_upvr (readonly)
		[2]: tbl_7_upvr (readonly)
		[3]: tbl_upvr (readonly)
		[4]: tbl_2_upvr (readonly)
		[5]: var59_upvw (read and write)
		[6]: var43_upvw (read and write)
	]]
	for _, v in pairs({tbl_6_upvr, tbl_7_upvr, tbl_upvr, tbl_2_upvr}) do
		for i_2, v_2 in pairs(v) do
			if type(v_2) == "boolean" then
				v[i_2] = false
			else
				v[i_2] *= 0
			end
		end
	end
	if var59_upvw then
		var43_upvw = 0
	end
end
local tbl_5_upvw = {}
local var72_upvw
local var73_upvw
local function touchBegan_upvw(arg1, arg2) -- Line 302, Named "touchBegan"
	--[[ Upvalues[4]:
		[1]: var72_upvw (read and write)
		[2]: isInDynamicThumbstickArea_upvr (readonly)
		[3]: var43_upvw (read and write)
		[4]: tbl_5_upvw (read and write)
	]]
	local var75
	if arg1.UserInputType ~= Enum.UserInputType.Touch then
		var75 = false
	else
		var75 = true
	end
	assert(var75)
	if arg1.UserInputState ~= Enum.UserInputState.Begin then
		var75 = false
	else
		var75 = true
	end
	assert(var75)
	if var72_upvw == nil then
		var75 = arg1.Position
		if isInDynamicThumbstickArea_upvr(var75) and not arg2 then
			var72_upvw = arg1
			return
		end
	end
	if not arg2 then
		var75 = 0
		var43_upvw = math.max(var75, var43_upvw + 1)
	end
	tbl_5_upvw[arg1] = arg2
end
local function touchEnded_upvw(arg1, arg2) -- Line 322, Named "touchEnded"
	--[[ Upvalues[4]:
		[1]: var72_upvw (read and write)
		[2]: tbl_5_upvw (read and write)
		[3]: var73_upvw (read and write)
		[4]: var43_upvw (read and write)
	]]
	local var76
	if arg1.UserInputType ~= Enum.UserInputType.Touch then
		var76 = false
	else
		var76 = true
	end
	assert(var76)
	if arg1.UserInputState ~= Enum.UserInputState.End then
		var76 = false
	else
		var76 = true
	end
	assert(var76)
	if arg1 == var72_upvw then
		var72_upvw = nil
	end
	var76 = tbl_5_upvw
	if var76[arg1] == false then
		var73_upvw = nil
		var76 = 0
		var43_upvw = math.max(var76, var43_upvw - 1)
	end
	var76 = nil
	tbl_5_upvw[arg1] = var76
end
local function touchChanged_upvw(arg1, arg2) -- Line 341, Named "touchChanged"
	--[[ Upvalues[4]:
		[1]: var72_upvw (read and write)
		[2]: tbl_5_upvw (read and write)
		[3]: tbl_2_upvr (readonly)
		[4]: var73_upvw (read and write)
	]]
	local var92
	if arg1.UserInputType ~= Enum.UserInputType.Touch then
		var92 = false
	else
		var92 = true
	end
	assert(var92)
	if arg1.UserInputState ~= Enum.UserInputState.Change then
		var92 = false
	else
		var92 = true
	end
	assert(var92)
	if arg1 == var72_upvw then
	else
		var92 = tbl_5_upvw
		if var92[arg1] == nil then
			tbl_5_upvw[arg1] = arg2
		end
		local tbl_4 = {}
		var92 = pairs(tbl_5_upvw)
		local pairs_result1, pairs_result2, pairs_result3_3 = pairs(tbl_5_upvw)
		for i_3, v_3 in pairs_result1, pairs_result2, pairs_result3_3 do
			if not v_3 then
				table.insert(tbl_4, i_3)
			end
		end
		pairs_result1 = #tbl_4
		if pairs_result1 == 1 then
			pairs_result1 = tbl_5_upvw[arg1]
			if pairs_result1 == false then
				pairs_result1 = arg1.Delta
				local var97 = tbl_2_upvr
				i_3 = Vector2.new
				v_3 = pairs_result1.X
				i_3 = i_3(v_3, pairs_result1.Y)
				var97.Move += i_3
			end
		end
		pairs_result1 = #tbl_4
		if pairs_result1 == 2 then
			i_3 = tbl_4[1]
			v_3 = tbl_4[2]
			i_3 = v_3.Position
			pairs_result1 = (i_3.Position - i_3).Magnitude
			if var73_upvw then
				local var98 = tbl_2_upvr
				v_3 = var73_upvw
				i_3 = pairs_result1 - v_3
				var98.Pinch += i_3
			end
			var73_upvw = pairs_result1
			return
		end
		pairs_result1 = nil
		var73_upvw = pairs_result1
	end
end
local function resetTouchState_upvw() -- Line 385, Named "resetTouchState"
	--[[ Upvalues[5]:
		[1]: tbl_5_upvw (read and write)
		[2]: var72_upvw (read and write)
		[3]: var73_upvw (read and write)
		[4]: var9_upvw (read and write)
		[5]: var43_upvw (read and write)
	]]
	tbl_5_upvw = {}
	var72_upvw = nil
	var73_upvw = nil
	if var9_upvw then
		var43_upvw = 0
	end
end
local function pointerAction_upvr(arg1, arg2, arg3, arg4) -- Line 395, Named "pointerAction"
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	if not arg4 then
		tbl_upvr.Wheel = arg1
		tbl_upvr.Pan = arg2
		tbl_upvr.Pinch = -arg3
	end
end
local function inputBegan_upvr(arg1, arg2) -- Line 403, Named "inputBegan"
	--[[ Upvalues[2]:
		[1]: touchBegan_upvw (read and write)
		[2]: var43_upvw (read and write)
	]]
	if arg1.UserInputType == Enum.UserInputType.Touch then
		touchBegan_upvw(arg1, arg2)
	elseif arg1.UserInputType == Enum.UserInputType.MouseButton2 and not arg2 then
		var43_upvw = math.max(0, var43_upvw + 1)
	end
end
local function inputChanged_upvr(arg1, arg2) -- Line 412, Named "inputChanged"
	--[[ Upvalues[2]:
		[1]: touchChanged_upvw (read and write)
		[2]: tbl_upvr (readonly)
	]]
	if arg1.UserInputType == Enum.UserInputType.Touch then
		touchChanged_upvw(arg1, arg2)
	elseif arg1.UserInputType == Enum.UserInputType.MouseMovement then
		local Delta = arg1.Delta
		tbl_upvr.Movement = Vector2.new(Delta.X, Delta.Y)
	end
end
local function inputEnded_upvr(arg1, arg2) -- Line 421, Named "inputEnded"
	--[[ Upvalues[2]:
		[1]: touchEnded_upvw (read and write)
		[2]: var43_upvw (read and write)
	]]
	if arg1.UserInputType == Enum.UserInputType.Touch then
		touchEnded_upvw(arg1, arg2)
	elseif arg1.UserInputType == Enum.UserInputType.MouseButton2 then
		var43_upvw = math.max(0, var43_upvw - 1)
	end
end
local var100_upvw = false
local ContextActionService_upvr = game:GetService("ContextActionService")
local Value_upvr = Enum.ContextActionPriority.Medium.Value
local tbl_3_upvw = {}
function module.setInputEnabled(arg1) -- Line 432
	--[[ Upvalues[17]:
		[1]: var100_upvw (read and write)
		[2]: resetInputDevices_upvr (readonly)
		[3]: resetTouchState_upvw (read and write)
		[4]: ContextActionService_upvr (readonly)
		[5]: thumbstick_upvr (readonly)
		[6]: Value_upvr (readonly)
		[7]: keypress_upvr (readonly)
		[8]: VRService_upvr (readonly)
		[9]: gamepadReset_upvr (readonly)
		[10]: gamepadZoomPress_upvr (readonly)
		[11]: tbl_3_upvw (read and write)
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
	var100_upvw = arg1
	resetInputDevices_upvr()
	resetTouchState_upvw()
	-- KONSTANTERROR: [4] 4. Error Block 3 end (CF ANALYSIS FAILED)
end
function module.getInputEnabled() -- Line 504
	--[[ Upvalues[1]:
		[1]: var100_upvw (read and write)
	]]
	return var100_upvw
end
function module.resetInputForFrameEnd() -- Line 508
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: tbl_2_upvr (readonly)
	]]
	tbl_upvr.Movement = Vector2.new()
	tbl_2_upvr.Move = Vector2.new()
	tbl_2_upvr.Pinch = 0
	tbl_upvr.Wheel = 0
	tbl_upvr.Pan = Vector2.new()
	tbl_upvr.Pinch = 0
end
UserInputService_upvr.WindowFocused:Connect(resetInputDevices_upvr)
UserInputService_upvr.WindowFocusReleased:Connect(resetInputDevices_upvr)
local var104_upvw = false
local var105_upvw = false
function module.getHoldPan() -- Line 529
	--[[ Upvalues[1]:
		[1]: var104_upvw (read and write)
	]]
	return var104_upvw
end
function module.getTogglePan() -- Line 533
	--[[ Upvalues[1]:
		[1]: var105_upvw (read and write)
	]]
	return var105_upvw
end
function module.getPanning() -- Line 537
	--[[ Upvalues[2]:
		[1]: var105_upvw (read and write)
		[2]: var104_upvw (read and write)
	]]
	local var106 = var105_upvw
	if not var106 then
		var106 = var104_upvw
	end
	return var106
end
function module.setTogglePan(arg1) -- Line 541
	--[[ Upvalues[1]:
		[1]: var105_upvw (read and write)
	]]
	var105_upvw = arg1
end
local var107_upvw = false
local var108_upvw
local var109_upvw
local Event_upvw = BindableEvent_upvw.Event
local var111_upvw = 0
local Event_upvw_2 = BindableEvent_upvr.Event
function module.enableCameraToggleInput() -- Line 549
	--[[ Upvalues[9]:
		[1]: var107_upvw (read and write)
		[2]: var104_upvw (read and write)
		[3]: var105_upvw (read and write)
		[4]: var108_upvw (read and write)
		[5]: var109_upvw (read and write)
		[6]: Event_upvw (read and write)
		[7]: var111_upvw (read and write)
		[8]: Event_upvw_2 (read and write)
		[9]: UserInputService_upvr (readonly)
	]]
	if var107_upvw then
	else
		var107_upvw = true
		var104_upvw = false
		var105_upvw = false
		if var108_upvw then
			var108_upvw:Disconnect()
		end
		if var109_upvw then
			var109_upvw:Disconnect()
		end
		var108_upvw = Event_upvw:Connect(function() -- Line 566
			--[[ Upvalues[2]:
				[1]: var104_upvw (copied, read and write)
				[2]: var111_upvw (copied, read and write)
			]]
			var104_upvw = true
			var111_upvw = tick()
		end)
		var109_upvw = Event_upvw_2:Connect(function() -- Line 571
			--[[ Upvalues[4]:
				[1]: var104_upvw (copied, read and write)
				[2]: var111_upvw (copied, read and write)
				[3]: var105_upvw (copied, read and write)
				[4]: UserInputService_upvr (copied, readonly)
			]]
			var104_upvw = false
			if tick() - var111_upvw < 0.3 and (var105_upvw or UserInputService_upvr:GetMouseDelta().Magnitude < 2) then
				var105_upvw = not var105_upvw
			end
		end)
	end
end
function module.disableCameraToggleInput() -- Line 579
	--[[ Upvalues[3]:
		[1]: var107_upvw (read and write)
		[2]: var108_upvw (read and write)
		[3]: var109_upvw (read and write)
	]]
	if not var107_upvw then
	else
		var107_upvw = false
		if var108_upvw then
			var108_upvw:Disconnect()
			var108_upvw = nil
		end
		if var109_upvw then
			var109_upvw:Disconnect()
			var109_upvw = nil
		end
	end
end
return module