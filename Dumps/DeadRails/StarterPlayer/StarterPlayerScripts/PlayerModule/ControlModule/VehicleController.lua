--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.VehicleController
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:25
-- Luau version 6, Types version 3
-- Time taken: 0.002968 seconds

local ContextActionService_upvr = game:GetService("ContextActionService")
local module_upvr = {}
module_upvr.__index = module_upvr
function module_upvr.new(arg1) -- Line 27
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable({}, module_upvr)
	setmetatable_result1.CONTROL_ACTION_PRIORITY = arg1
	setmetatable_result1.enabled = false
	setmetatable_result1.vehicleSeat = nil
	setmetatable_result1.throttle = 0
	setmetatable_result1.steer = 0
	setmetatable_result1.acceleration = 0
	setmetatable_result1.decceleration = 0
	setmetatable_result1.turningRight = 0
	setmetatable_result1.turningLeft = 0
	setmetatable_result1.vehicleMoveVector = Vector3.new(0, 0, 0)
	setmetatable_result1.autoPilot = {}
	setmetatable_result1.autoPilot.MaxSpeed = 0
	setmetatable_result1.autoPilot.MaxSteeringAngle = 0
	return setmetatable_result1
end
function module_upvr.BindContextActions(arg1) -- Line 51
	--[[ Upvalues[1]:
		[1]: ContextActionService_upvr (readonly)
	]]
	ContextActionService_upvr:BindActionAtPriority("throttleAccel", function(arg1_2, arg2, arg3) -- Line 53
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:OnThrottleAccel(arg1_2, arg2, arg3)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonR2)
	ContextActionService_upvr:BindActionAtPriority("throttleDeccel", function(arg1_3, arg2, arg3) -- Line 57
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:OnThrottleDeccel(arg1_3, arg2, arg3)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonL2)
	ContextActionService_upvr:BindActionAtPriority("arrowSteerRight", function(arg1_4, arg2, arg3) -- Line 62
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:OnSteerRight(arg1_4, arg2, arg3)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Right)
	ContextActionService_upvr:BindActionAtPriority("arrowSteerLeft", function(arg1_5, arg2, arg3) -- Line 66
		--[[ Upvalues[1]:
			[1]: arg1 (readonly)
		]]
		arg1:OnSteerLeft(arg1_5, arg2, arg3)
		return Enum.ContextActionResult.Pass
	end, false, arg1.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Left)
end
function module_upvr.Enable(arg1, arg2, arg3) -- Line 72
	--[[ Upvalues[1]:
		[1]: ContextActionService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 3. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [4] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 5. Error Block 3 start (CF ANALYSIS FAILED)
	do
		return
	end
	-- KONSTANTERROR: [8] 5. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 6. Error Block 4 start (CF ANALYSIS FAILED)
	arg1.enabled = arg2
	arg1.vehicleMoveVector = Vector3.new(0, 0, 0)
	-- KONSTANTERROR: [9] 6. Error Block 4 end (CF ANALYSIS FAILED)
end
function module_upvr.OnThrottleAccel(arg1, arg2, arg3, arg4) -- Line 98
	if arg3 == Enum.UserInputState.End or arg3 == Enum.UserInputState.Cancel then
		arg1.acceleration = 0
	else
		arg1.acceleration = -1
	end
	arg1.throttle = arg1.acceleration + arg1.decceleration
end
function module_upvr.OnThrottleDeccel(arg1, arg2, arg3, arg4) -- Line 107
	if arg3 == Enum.UserInputState.End or arg3 == Enum.UserInputState.Cancel then
		arg1.decceleration = 0
	else
		arg1.decceleration = 1
	end
	arg1.throttle = arg1.acceleration + arg1.decceleration
end
function module_upvr.OnSteerRight(arg1, arg2, arg3, arg4) -- Line 116
	if arg3 == Enum.UserInputState.End or arg3 == Enum.UserInputState.Cancel then
		arg1.turningRight = 0
	else
		arg1.turningRight = 1
	end
	arg1.steer = arg1.turningRight + arg1.turningLeft
end
function module_upvr.OnSteerLeft(arg1, arg2, arg3, arg4) -- Line 125
	if arg3 == Enum.UserInputState.End or arg3 == Enum.UserInputState.Cancel then
		arg1.turningLeft = 0
	else
		arg1.turningLeft = -1
	end
	arg1.steer = arg1.turningRight + arg1.turningLeft
end
function module_upvr.Update(arg1, arg2, arg3, arg4) -- Line 135
	-- KONSTANTERROR: Failed to generate AST for function `Update`:
runluau:3236: attempt to index nil with 'reads'
Traceback:
runluau:3236 function line_has_expr
runluau:7971 function CF_JUMPIF
runluau:8060 function gen_from_hl_block
runluau:8228 function gen_condition
runluau:8163 function gen_from_hl_block
runluau:8131 function gen_from_hl_block
runluau:8340 function astgen
runluau:8357 function astgen_protected
runluau:4639 function expr_function
runluau:7707 function DUPCLOSURE
runluau:7954 function gen_from_insts
runluau:8053 function gen_from_hl_block
runluau:8340 function astgen
runluau:8357 function astgen_protected
runluau:8418 function decompile_bytecode
runluau:11983 function wrapped
runluau:11991
runluau:12015 function _decompile
runluau:12181 function decompile
runluau:12377

end
function module_upvr.ComputeThrottle(arg1, arg2) -- Line 161
	if arg2 ~= Vector3.new(0, 0, 0) then
		return -arg2.Z
	end
	return 0
end
function module_upvr.ComputeSteer(arg1, arg2) -- Line 170
	if arg2 ~= Vector3.new(0, 0, 0) then
		return -math.atan2(-arg2.x, -arg2.z) * 57.29577951308232 / arg1.autoPilot.MaxSteeringAngle
	end
	return 0
end
function module_upvr.SetupAutoPilot(arg1) -- Line 179
	arg1.autoPilot.MaxSpeed = arg1.vehicleSeat.MaxSpeed
	arg1.autoPilot.MaxSteeringAngle = 35
end
return module_upvr