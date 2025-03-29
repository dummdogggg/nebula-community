--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VehicleCamera.VehicleCameraCore
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:35:01
-- Luau version 6, Types version 3
-- Time taken: 0.003936 seconds

local CameraUtils = require(script.Parent.Parent.CameraUtils)
local VehicleCameraConfig_upvr = require(script.Parent.VehicleCameraConfig)
local sanitizeAngle_upvr = CameraUtils.sanitizeAngle
local function _(arg1) -- Line 10, Named "getYaw"
	--[[ Upvalues[1]:
		[1]: sanitizeAngle_upvr (readonly)
	]]
	local _, any_toEulerAnglesYXZ_result2 = arg1:toEulerAnglesYXZ()
	return sanitizeAngle_upvr(any_toEulerAnglesYXZ_result2)
end
local function _(arg1) -- Line 16, Named "getPitch"
	--[[ Upvalues[1]:
		[1]: sanitizeAngle_upvr (readonly)
	]]
	return sanitizeAngle_upvr(arg1:toEulerAnglesYXZ())
end
local function _(arg1, arg2, arg3, arg4, arg5) -- Line 22, Named "stepSpringAxis"
	--[[ Upvalues[1]:
		[1]: sanitizeAngle_upvr (readonly)
	]]
	local sanitizeAngle_upvr_result1 = sanitizeAngle_upvr(arg4 - arg3)
	local exponentiated = math.exp(-arg2 * arg1)
	return sanitizeAngle_upvr((sanitizeAngle_upvr_result1 * (1 + arg2 * arg1) + arg5 * arg1) * exponentiated + arg3), (arg5 * (1 - arg2 * arg1) - (sanitizeAngle_upvr_result1) * (arg2 * arg2 * arg1)) * exponentiated
end
local tbl_upvr_2 = {}
tbl_upvr_2.__index = tbl_upvr_2
local function new(arg1, arg2, arg3) -- Line 36
	--[[ Upvalues[1]:
		[1]: tbl_upvr_2 (readonly)
	]]
	local module = {}
	module.fRising = arg1
	module.fFalling = arg2
	module.g = arg3
	module.p = arg3
	module.v = arg3 * 0
	return setmetatable(module, tbl_upvr_2)
end
tbl_upvr_2.new = new
local function step(arg1, arg2) -- Line 46
	local g = arg1.g
	local v = arg1.v
	local var12
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var12 = arg1.fRising
		return var12
	end
	if 0 >= v or not INLINED() then
		var12 = arg1.fFalling
	end
	local var13 = (-math.pi*2) * var12
	local var14 = arg1.p - g
	var12 = math.exp(-var13 * arg2)
	local var15 = (var14 * (1 + var13 * arg2) + v * arg2) * var12 + g
	arg1.p = var15
	arg1.v = (v * (1 - var13 * arg2) - (var14) * (var13 * var13 * arg2)) * var12
	return var15
end
tbl_upvr_2.step = step
local tbl_upvr = {}
tbl_upvr.__index = tbl_upvr
local function new(arg1) -- Line 72
	--[[ Upvalues[4]:
		[1]: sanitizeAngle_upvr (readonly)
		[2]: tbl_upvr_2 (readonly)
		[3]: VehicleCameraConfig_upvr (readonly)
		[4]: tbl_upvr (readonly)
	]]
	local var17
	if typeof(arg1) ~= "CFrame" then
		var17 = false
	else
		var17 = true
	end
	assert(var17)
	var17 = {}
	local any_toEulerAnglesYXZ_result1_2, any_toEulerAnglesYXZ_result2_2 = arg1:toEulerAnglesYXZ()
	var17.yawG = sanitizeAngle_upvr(any_toEulerAnglesYXZ_result2_2)
	local _, any_toEulerAnglesYXZ_result2_4 = arg1:toEulerAnglesYXZ()
	var17.yawP = sanitizeAngle_upvr(any_toEulerAnglesYXZ_result2_4)
	var17.yawV = 0
	var17.pitchG = sanitizeAngle_upvr(arg1:toEulerAnglesYXZ())
	var17.pitchP = sanitizeAngle_upvr(arg1:toEulerAnglesYXZ())
	var17.pitchV = 0
	var17.fSpringYaw = tbl_upvr_2.new(VehicleCameraConfig_upvr.yawReponseDampingRising, VehicleCameraConfig_upvr.yawResponseDampingFalling, 0)
	var17.fSpringPitch = tbl_upvr_2.new(VehicleCameraConfig_upvr.pitchReponseDampingRising, VehicleCameraConfig_upvr.pitchResponseDampingFalling, 0)
	return setmetatable(var17, tbl_upvr)
end
tbl_upvr.new = new
function tbl_upvr.setGoal(arg1, arg2) -- Line 99
	--[[ Upvalues[1]:
		[1]: sanitizeAngle_upvr (readonly)
	]]
	local var22
	if typeof(arg2) ~= "CFrame" then
		var22 = false
	else
		var22 = true
	end
	assert(var22)
	var22 = arg2:toEulerAnglesYXZ()
	local any_toEulerAnglesYXZ_result1, any_toEulerAnglesYXZ_result2_3 = arg2:toEulerAnglesYXZ()
	arg1.yawG = sanitizeAngle_upvr(any_toEulerAnglesYXZ_result2_3)
	any_toEulerAnglesYXZ_result1 = arg2:toEulerAnglesYXZ()
	arg1.pitchG = sanitizeAngle_upvr(any_toEulerAnglesYXZ_result1)
end
function tbl_upvr.getCFrame(arg1) -- Line 106
	return CFrame.fromEulerAnglesYXZ(arg1.pitchP, arg1.yawP, 0)
end
local mapClamp_upvr = CameraUtils.mapClamp
local map_upvr = CameraUtils.map
local function step(arg1, arg2, arg3, arg4, arg5) -- Line 110
	--[[ Upvalues[4]:
		[1]: mapClamp_upvr (readonly)
		[2]: map_upvr (readonly)
		[3]: VehicleCameraConfig_upvr (readonly)
		[4]: sanitizeAngle_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 26 start (CF ANALYSIS FAILED)
	local var27
	if typeof(arg2) ~= "number" then
		var27 = false
	else
		var27 = true
	end
	assert(var27)
	if typeof(arg4) ~= "number" then
		var27 = false
		-- KONSTANTWARNING: GOTO [22] #18
	end
	-- KONSTANTERROR: [0] 1. Error Block 26 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [21] 17. Error Block 29 start (CF ANALYSIS FAILED)
	var27 = true
	assert(var27)
	if typeof(arg3) ~= "number" then
		var27 = false
		-- KONSTANTWARNING: GOTO [35] #28
	end
	-- KONSTANTERROR: [21] 17. Error Block 29 end (CF ANALYSIS FAILED)
end
tbl_upvr.step = step
local module_2_upvr = {}
module_2_upvr.__index = module_2_upvr
function module_2_upvr.new(arg1) -- Line 167
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: module_2_upvr (readonly)
	]]
	return setmetatable({
		vrs = tbl_upvr.new(arg1);
	}, module_2_upvr)
end
function module_2_upvr.step(arg1, arg2, arg3, arg4, arg5) -- Line 173
	return arg1.vrs:step(arg2, arg3, arg4, arg5)
end
function module_2_upvr.setTransform(arg1, arg2) -- Line 177
	arg1.vrs:setGoal(arg2)
end
return module_2_upvr