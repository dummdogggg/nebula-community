--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraUtils
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:44
-- Luau version 6, Types version 3
-- Time taken: 0.007969 seconds

local Players_upvr = game:GetService("Players")
local UserInputService_upvr = game:GetService("UserInputService")
local UserGameSettings_upvr = UserSettings():GetService("UserGameSettings")
local module_upvr = {}
local function _(arg1) -- Line 12, Named "round"
	return math.floor(arg1 + 0.5)
end
local tbl_upvr = {}
tbl_upvr.__index = tbl_upvr
function tbl_upvr.new(arg1, arg2) -- Line 21
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local module = {}
	module.freq = arg1
	module.goal = arg2
	module.pos = arg2
	module.vel = 0
	return setmetatable(module, tbl_upvr)
end
function tbl_upvr.step(arg1, arg2) -- Line 31
	local var7 = arg1.freq * 2 * math.pi
	local goal = arg1.goal
	local vel = arg1.vel
	local var10 = arg1.pos - goal
	local exponentiated = math.exp(-var7 * arg2)
	local var12 = (var10 * (var7 * arg2 + 1) + vel * arg2) * exponentiated + goal
	arg1.pos = var12
	arg1.vel = (vel * (1 - var7 * arg2) - (var10) * (var7 * var7 * arg2)) * exponentiated
	return var12
end
module_upvr.Spring = tbl_upvr
function module_upvr.map(arg1, arg2, arg3, arg4, arg5) -- Line 53
	return (arg1 - arg2) * (arg5 - arg4) / (arg3 - arg2) + arg4
end
function module_upvr.mapClamp(arg1, arg2, arg3, arg4, arg5) -- Line 58
	return math.clamp((arg1 - arg2) * (arg5 - arg4) / (arg3 - arg2) + arg4, math.min(arg4, arg5), math.max(arg4, arg5))
end
function module_upvr.getLooseBoundingSphere(arg1) -- Line 67
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local table_create_result1 = table.create(#arg1)
	local pairs_result1, _, pairs_result3 = pairs(arg1)
	local var49
	for i, v in pairs_result1, var49, pairs_result3 do
		table_create_result1[i] = v.Position
	end
	local _1 = table_create_result1[1]
	var49 = _1
	for _, v_2 in ipairs(table_create_result1) do
		if 0 < (v_2 - _1).Magnitude then
			var49 = v_2
		end
	end
	for _, v_3 in ipairs(table_create_result1) do
		if 0 < (v_3 - var49).Magnitude then
			local var59 = v_3
		end
	end
	local var60 = (var49 + var59) * 0.5
	local var61 = (var49 - var59).Magnitude * 0.5
	for _, v_4 in ipairs(table_create_result1) do
		local Magnitude = (v_4 - var60).Magnitude
		if var61 < Magnitude then
		end
	end
	return var60 + (Magnitude - var61) * 0.5 * (v_4 - var60).Unit, (Magnitude + var61) * 0.5
end
function module_upvr.sanitizeAngle(arg1) -- Line 123
	return (arg1 + math.pi) % (-math.pi*2) - math.pi
end
function module_upvr.Round(arg1, arg2) -- Line 128
	local var66 = 10 ^ arg2
	return math.floor(arg1 * var66 + 0.5) / var66
end
function module_upvr.IsFinite(arg1) -- Line 133
	local var68 = false
	if arg1 == arg1 then
		var68 = false
		if arg1 ~= math.huge then
			if arg1 == (-math.huge) then
				var68 = false
			else
				var68 = true
			end
		end
	end
	return var68
end
function module_upvr.IsFiniteVector3(arg1) -- Line 137
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local any_IsFinite_result1 = module_upvr.IsFinite(arg1.X)
	if any_IsFinite_result1 then
		any_IsFinite_result1 = module_upvr.IsFinite(arg1.Y)
		if any_IsFinite_result1 then
			any_IsFinite_result1 = module_upvr.IsFinite(arg1.Z)
		end
	end
	return any_IsFinite_result1
end
function module_upvr.GetAngleBetweenXZVectors(arg1, arg2) -- Line 142
	return math.atan2(arg2.X * arg1.Z - arg2.Z * arg1.X, arg2.X * arg1.X + arg2.Z * arg1.Z)
end
function module_upvr.RotateVectorByAngleAndRound(arg1, arg2, arg3) -- Line 146
	if 0 < arg1.Magnitude then
		local Unit = arg1.Unit
		return math.floor((math.atan2(Unit.Z, Unit.X) + arg2) / arg3 + 0.5) * arg3 - math.atan2(Unit.Z, Unit.X)
	end
	return 0
end
local function _(arg1) -- Line 160, Named "SCurveTranform"
	local clamped_2 = math.clamp(arg1, -1, 1)
	if 0 <= clamped_2 then
		return clamped_2 * 0.35 / (0.35 - clamped_2 + 1)
	end
	return -(-clamped_2 * 0.8 / (clamped_2 + 0.8 + 1))
end
local function _(arg1) -- Line 169, Named "toSCurveSpace"
	return (math.abs(arg1) * 2 - 1) * 1.1 - 0.1
end
local function _(arg1) -- Line 173, Named "fromSCurveSpace"
	return arg1 / 2 + 0.5
end
function module_upvr.GamepadLinearToCurve(arg1) -- Line 177
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local function _(arg1_2) -- Line 178, Named "onAxis"
		local var73 = 1
		local var74
		if arg1_2 < 0 then
			var73 = -1
		end
		local clamped_3 = math.clamp((math.abs(math.abs(arg1_2)) * 2 - 1) * 1.1 - 0.1, -1, 1)
		if 0 <= clamped_3 then
			var74 = clamped_3 * 0.35 / (0.35 - clamped_3 + 1)
		else
			var74 = -(-clamped_3 * 0.8 / (clamped_3 + 0.8 + 1))
		end
		var74 = math.clamp((var74 / 2 + 0.5) * var73, -1, 1)
		return var74
	end
	local X = arg1.X
	local var77 = 1
	local var78
	if X < 0 then
		var77 = -1
	end
	local clamped = math.clamp((math.abs(math.abs(X)) * 2 - 1) * 1.1 - 0.1, -1, 1)
	if 0 <= clamped then
		var78 = clamped * 0.35 / (0.35 - clamped + 1)
	else
		var78 = -(-clamped * 0.8 / (clamped + 0.8 + 1))
	end
	var78 = math.clamp((var78 / 2 + 0.5) * var77, -1, 1)
	local Y = arg1.Y
	local var81 = 1
	var78 = 0
	if Y < var78 then
		var81 = -1
	end
	if 0 <= math.clamp((math.abs(math.abs(Y)) * 2 - 1) * 1.1 - 0.1, -1, 1) then
	else
	end
	var78 = -(-math.clamp((math.abs(math.abs(Y)) * 2 - 1) * 1.1 - 0.1, -1, 1) * 0.8 / (math.clamp((math.abs(math.abs(Y)) * 2 - 1) * 1.1 - 0.1, -1, 1) + 0.8 + 1)) / 2 + 0.5
	var78 *= var81
	return Vector2.new(var78, math.clamp(var78, -1, 1))
end
function module_upvr.ConvertCameraModeEnumToStandard(arg1) -- Line 191
	if arg1 == Enum.TouchCameraMovementMode.Default then
		return Enum.ComputerCameraMovementMode.Follow
	end
	if arg1 == Enum.ComputerCameraMovementMode.Default then
		return Enum.ComputerCameraMovementMode.Classic
	end
	if arg1 == Enum.TouchCameraMovementMode.Classic or arg1 == Enum.DevTouchCameraMovementMode.Classic or arg1 == Enum.DevComputerCameraMovementMode.Classic or arg1 == Enum.ComputerCameraMovementMode.Classic then
		return Enum.ComputerCameraMovementMode.Classic
	end
	if arg1 == Enum.TouchCameraMovementMode.Follow or arg1 == Enum.DevTouchCameraMovementMode.Follow or arg1 == Enum.DevComputerCameraMovementMode.Follow or arg1 == Enum.ComputerCameraMovementMode.Follow then
		return Enum.ComputerCameraMovementMode.Follow
	end
	if arg1 == Enum.TouchCameraMovementMode.Orbital or arg1 == Enum.DevTouchCameraMovementMode.Orbital or arg1 == Enum.DevComputerCameraMovementMode.Orbital or arg1 == Enum.ComputerCameraMovementMode.Orbital then
		return Enum.ComputerCameraMovementMode.Orbital
	end
	if arg1 == Enum.ComputerCameraMovementMode.CameraToggle or arg1 == Enum.DevComputerCameraMovementMode.CameraToggle then
		return Enum.ComputerCameraMovementMode.CameraToggle
	end
	if arg1 == Enum.DevTouchCameraMovementMode.UserChoice or arg1 == Enum.DevComputerCameraMovementMode.UserChoice then
		return Enum.DevComputerCameraMovementMode.UserChoice
	end
	return Enum.ComputerCameraMovementMode.Classic
end
local function _() -- Line 240, Named "getMouse"
	--[[ Upvalues[1]:
		[1]: Players_upvr (readonly)
	]]
	local LocalPlayer_3 = Players_upvr.LocalPlayer
	if not LocalPlayer_3 then
		Players_upvr:GetPropertyChangedSignal("LocalPlayer"):Wait()
		LocalPlayer_3 = Players_upvr.LocalPlayer
	end
	assert(LocalPlayer_3)
	return LocalPlayer_3:GetMouse()
end
local var84_upvw = ""
local var85_upvw
function module_upvr.setMouseIconOverride(arg1) -- Line 252
	--[[ Upvalues[3]:
		[1]: Players_upvr (readonly)
		[2]: var85_upvw (read and write)
		[3]: var84_upvw (read and write)
	]]
	local LocalPlayer = Players_upvr.LocalPlayer
	if not LocalPlayer then
		Players_upvr:GetPropertyChangedSignal("LocalPlayer"):Wait()
		LocalPlayer = Players_upvr.LocalPlayer
	end
	assert(LocalPlayer)
	local mouse_2 = LocalPlayer:GetMouse()
	if mouse_2.Icon ~= var85_upvw then
		var84_upvw = mouse_2.Icon
	end
	mouse_2.Icon = arg1
	var85_upvw = arg1
end
function module_upvr.restoreMouseIcon() -- Line 263
	--[[ Upvalues[3]:
		[1]: Players_upvr (readonly)
		[2]: var85_upvw (read and write)
		[3]: var84_upvw (read and write)
	]]
	local LocalPlayer_2 = Players_upvr.LocalPlayer
	if not LocalPlayer_2 then
		Players_upvr:GetPropertyChangedSignal("LocalPlayer"):Wait()
		LocalPlayer_2 = Players_upvr.LocalPlayer
	end
	assert(LocalPlayer_2)
	local mouse = LocalPlayer_2:GetMouse()
	if mouse.Icon == var85_upvw then
		mouse.Icon = var84_upvw
	end
	var85_upvw = nil
end
local Default_upvw = Enum.MouseBehavior.Default
local var91_upvw
function module_upvr.setMouseBehaviorOverride(arg1) -- Line 274
	--[[ Upvalues[3]:
		[1]: UserInputService_upvr (readonly)
		[2]: var91_upvw (read and write)
		[3]: Default_upvw (read and write)
	]]
	if UserInputService_upvr.MouseBehavior ~= var91_upvw then
		Default_upvw = UserInputService_upvr.MouseBehavior
	end
	UserInputService_upvr.MouseBehavior = arg1
	var91_upvw = arg1
end
function module_upvr.restoreMouseBehavior() -- Line 283
	--[[ Upvalues[3]:
		[1]: UserInputService_upvr (readonly)
		[2]: var91_upvw (read and write)
		[3]: Default_upvw (read and write)
	]]
	if UserInputService_upvr.MouseBehavior == var91_upvw then
		UserInputService_upvr.MouseBehavior = Default_upvw
	end
	var91_upvw = nil
end
local MovementRelative_upvw = Enum.RotationType.MovementRelative
local var93_upvw
function module_upvr.setRotationTypeOverride(arg1) -- Line 292
	--[[ Upvalues[3]:
		[1]: UserGameSettings_upvr (readonly)
		[2]: var93_upvw (read and write)
		[3]: MovementRelative_upvw (read and write)
	]]
	if UserGameSettings_upvr.RotationType ~= var93_upvw then
		MovementRelative_upvw = UserGameSettings_upvr.RotationType
	end
	UserGameSettings_upvr.RotationType = arg1
	var93_upvw = arg1
end
function module_upvr.restoreRotationType() -- Line 301
	--[[ Upvalues[3]:
		[1]: UserGameSettings_upvr (readonly)
		[2]: var93_upvw (read and write)
		[3]: MovementRelative_upvw (read and write)
	]]
	if UserGameSettings_upvr.RotationType == var93_upvw then
		UserGameSettings_upvr.RotationType = MovementRelative_upvw
	end
	var93_upvw = nil
end
return module_upvr