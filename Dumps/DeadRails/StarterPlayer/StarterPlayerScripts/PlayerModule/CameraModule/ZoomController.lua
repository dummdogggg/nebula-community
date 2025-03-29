--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.ZoomController
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:48:00
-- Luau version 6, Types version 3
-- Time taken: 0.002607 seconds

local clamp_upvr = math.clamp
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
assert(LocalPlayer_upvr)
local var3_upvw
local var4_upvw
local function updateBounds() -- Line 23
	--[[ Upvalues[3]:
		[1]: var3_upvw (read and write)
		[2]: LocalPlayer_upvr (readonly)
		[3]: var4_upvw (read and write)
	]]
	var3_upvw = LocalPlayer_upvr.CameraMinZoomDistance
	var4_upvw = LocalPlayer_upvr.CameraMaxZoomDistance
end
var3_upvw = LocalPlayer_upvr.CameraMinZoomDistance
var4_upvw = LocalPlayer_upvr.CameraMaxZoomDistance
local var5_upvw = var4_upvw
LocalPlayer_upvr:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(updateBounds)
LocalPlayer_upvr:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(updateBounds)
LocalPlayer_upvr = {}
local var6_upvr = LocalPlayer_upvr
var6_upvr.__index = var6_upvr
function var6_upvr.new(arg1, arg2, arg3, arg4) -- Line 37
	--[[ Upvalues[2]:
		[1]: clamp_upvr (readonly)
		[2]: var6_upvr (readonly)
	]]
	local clamp_upvr_result1 = clamp_upvr(arg2, arg3, arg4)
	local module_2 = {}
	module_2.freq = arg1
	module_2.x = clamp_upvr_result1
	module_2.v = 0
	module_2.minValue = arg3
	module_2.maxValue = arg4
	module_2.goal = clamp_upvr_result1
	return setmetatable(module_2, var6_upvr)
end
local exp_upvr = math.exp
function var6_upvr.Step(arg1, arg2) -- Line 49
	--[[ Upvalues[1]:
		[1]: exp_upvr (readonly)
	]]
	local var10 = arg1.freq * 2 * math.pi
	local v = arg1.v
	local minValue = arg1.minValue
	local maxValue = arg1.maxValue
	local goal_2 = arg1.goal
	local var15 = goal_2 - arg1.x
	local var16 = var10 * arg2
	local var9_result1 = exp_upvr(-var16)
	local var18 = goal_2 + (v * arg2 - var15 * (var16 + 1)) * var9_result1
	local var19 = ((var15 * var10 - v) * var16 + v) * var9_result1
	if var18 < minValue then
		var18 = minValue
		var19 = 0
	elseif maxValue < var18 then
		var18 = maxValue
		var19 = 0
	end
	arg1.x = var18
	arg1.v = var19
	return var18
end
local any_new_result1_upvr = var6_upvr.new(4.5, 12.5, 0.5, var5_upvw)
local function _(arg1, arg2, arg3, arg4) -- Line 87, Named "stepTargetZoom"
	--[[ Upvalues[1]:
		[1]: clamp_upvr (readonly)
	]]
	arg1 = clamp_upvr(arg1 + arg2 * (arg1 * 0.0375 + 1), arg3, arg4)
	local var21 = arg1
	local var22
	if var21 < var22 then
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var22 = arg3
			return var22
		end
		if arg2 > 0 or not INLINED() then
			var22 = 1
		end
		var21 = var22
	end
	return var21
end
local var23_upvw = 0
local module = {}
local max_upvr = math.max
local module_3_upvr = require(script:WaitForChild("Popper"))
local min_upvr = math.min
function module.Update(arg1, arg2, arg3) -- Line 98
	--[[ Upvalues[8]:
		[1]: any_new_result1_upvr (readonly)
		[2]: var23_upvw (read and write)
		[3]: var3_upvw (read and write)
		[4]: var5_upvw (read and write)
		[5]: clamp_upvr (readonly)
		[6]: max_upvr (readonly)
		[7]: module_3_upvr (readonly)
		[8]: min_upvr (readonly)
	]]
	local var28 = math.huge
	if 1 < any_new_result1_upvr.goal then
		local goal = any_new_result1_upvr.goal
		local var30 = var23_upvw
		local var31 = var3_upvw
		goal = clamp_upvr(goal + var30 * (goal * 0.0375 + 1), var31, var5_upvw)
		local var32 = goal
		local var33
		if var32 < var33 then
			local function INLINED_2() -- Internal function, doesn't exist in bytecode
				var33 = var31
				return var33
			end
			if var30 > 0 or not INLINED_2() then
				var33 = 1
			end
			var32 = var33
		end
		var28 = module_3_upvr(arg2 * CFrame.new(0, 0, 0.5), max_upvr(any_new_result1_upvr.x, var32) - 0.5, arg3) + 0.5
	end
	any_new_result1_upvr.minValue = 0.5
	any_new_result1_upvr.maxValue = min_upvr(var5_upvw, var28)
	return any_new_result1_upvr:Step(arg1)
end
function module.GetZoomRadius() -- Line 122
	--[[ Upvalues[1]:
		[1]: any_new_result1_upvr (readonly)
	]]
	return any_new_result1_upvr.x
end
function module.SetZoomParameters(arg1, arg2) -- Line 126
	--[[ Upvalues[2]:
		[1]: any_new_result1_upvr (readonly)
		[2]: var23_upvw (read and write)
	]]
	any_new_result1_upvr.goal = arg1
	var23_upvw = arg2
end
function module.ReleaseSpring() -- Line 131
	--[[ Upvalues[1]:
		[1]: any_new_result1_upvr (readonly)
	]]
	any_new_result1_upvr.x = any_new_result1_upvr.goal
	any_new_result1_upvr.v = 0
end
return module