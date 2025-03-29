--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.Poppercam
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:48
-- Luau version 6, Types version 3
-- Time taken: 0.003029 seconds

local tbl_upvr = {}
tbl_upvr.__index = tbl_upvr
local zero_cframe_upvr = CFrame.new()
local function _(arg1) -- Line 17, Named "cframeToAxis"
	local any_ToAxisAngle_result1, any_ToAxisAngle_result2 = arg1:ToAxisAngle()
	return any_ToAxisAngle_result1 * any_ToAxisAngle_result2
end
local function _(arg1) -- Line 22, Named "axisToCFrame"
	--[[ Upvalues[1]:
		[1]: zero_cframe_upvr (readonly)
	]]
	local Magnitude = arg1.Magnitude
	if 0.00001 < Magnitude then
		return CFrame.fromAxisAngle(arg1, Magnitude)
	end
	return zero_cframe_upvr
end
local function _(arg1) -- Line 30, Named "extractRotation"
	local _, _, _, any_GetComponents_result4, any_GetComponents_result5, any_GetComponents_result6, any_GetComponents_result7_3, any_GetComponents_result8, any_GetComponents_result9_3, any_GetComponents_result10_2, any_GetComponents_result11_2, any_GetComponents_result12_2 = arg1:GetComponents()
	return CFrame.new(0, 0, 0, any_GetComponents_result4, any_GetComponents_result5, any_GetComponents_result6, any_GetComponents_result7_3, any_GetComponents_result8, any_GetComponents_result9_3, any_GetComponents_result10_2, any_GetComponents_result11_2, any_GetComponents_result12_2)
end
local function new() -- Line 35
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	return setmetatable({
		lastCFrame = nil;
	}, tbl_upvr)
end
tbl_upvr.new = new
function tbl_upvr.Step(arg1, arg2, arg3) -- Line 41
	--[[ Upvalues[1]:
		[1]: zero_cframe_upvr (readonly)
	]]
	local var19 = arg1.lastCFrame or arg3
	arg1.lastCFrame = arg3
	local Position_upvr = arg3.Position
	local _, _, _, any_GetComponents_result4_3, any_GetComponents_result5_3, any_GetComponents_result6_2, any_GetComponents_result7_2, any_GetComponents_result8_2, any_GetComponents_result9, any_GetComponents_result10_3, any_GetComponents_result11, any_GetComponents_result12_3 = arg3:GetComponents()
	local cframe_upvr = CFrame.new(0, 0, 0, any_GetComponents_result4_3, any_GetComponents_result5_3, any_GetComponents_result6_2, any_GetComponents_result7_2, any_GetComponents_result8_2, any_GetComponents_result9, any_GetComponents_result10_3, any_GetComponents_result11, any_GetComponents_result12_3)
	local _, _, _, any_GetComponents_result4_2, any_GetComponents_result5_2, any_GetComponents_result6_3, any_GetComponents_result7, any_GetComponents_result8_3, any_GetComponents_result9_2, any_GetComponents_result10, any_GetComponents_result11_3, any_GetComponents_result12 = var19:GetComponents()
	local var46_upvr = (Position_upvr - var19.p) / arg2
	local any_ToAxisAngle_result1_2, any_ToAxisAngle_result2_2 = cframe_upvr * CFrame.new(0, 0, 0, any_GetComponents_result4_2, any_GetComponents_result5_2, any_GetComponents_result6_3, any_GetComponents_result7, any_GetComponents_result8_3, any_GetComponents_result9_2, any_GetComponents_result10, any_GetComponents_result11_3, any_GetComponents_result12):inverse():ToAxisAngle()
	local var49_upvr = any_ToAxisAngle_result1_2 * any_ToAxisAngle_result2_2 / arg2
	return {
		extrapolate = function(arg1_2) -- Line 56, Named "extrapolate"
			--[[ Upvalues[5]:
				[1]: var46_upvr (readonly)
				[2]: Position_upvr (readonly)
				[3]: var49_upvr (readonly)
				[4]: zero_cframe_upvr (copied, readonly)
				[5]: cframe_upvr (readonly)
			]]
			local var50 = Position_upvr
			local var51 = var49_upvr * arg1_2
			local Magnitude_2 = var51.Magnitude
			if 0.00001 < Magnitude_2 then
				var50 = CFrame.fromAxisAngle(var51, Magnitude_2)
			else
				var50 = zero_cframe_upvr
			end
			return (var50 * cframe_upvr) + (var46_upvr * arg1_2 + var50)
		end;
		posVelocity = var46_upvr;
		rotVelocity = var49_upvr;
	}
end
function tbl_upvr.Reset(arg1) -- Line 69
	arg1.lastCFrame = nil
end
zero_cframe_upvr = require(script.Parent:WaitForChild("BaseOcclusion"))
local var54_upvr = zero_cframe_upvr
local setmetatable_result1_2_upvr = setmetatable({}, var54_upvr)
setmetatable_result1_2_upvr.__index = setmetatable_result1_2_upvr
function setmetatable_result1_2_upvr.new() -- Line 79
	--[[ Upvalues[3]:
		[1]: var54_upvr (readonly)
		[2]: setmetatable_result1_2_upvr (readonly)
		[3]: tbl_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(var54_upvr.new(), setmetatable_result1_2_upvr)
	setmetatable_result1.focusExtrapolator = tbl_upvr.new()
	return setmetatable_result1
end
function setmetatable_result1_2_upvr.GetOcclusionMode(arg1) -- Line 85
	return Enum.DevCameraOcclusionMode.Zoom
end
function setmetatable_result1_2_upvr.Enable(arg1, arg2) -- Line 89
	arg1.focusExtrapolator:Reset()
end
local any_getUserFlag_result1_upvr = require(script.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil")).getUserFlag("UserFixCameraFPError")
local module_upvr = require(script.Parent:WaitForChild("ZoomController"))
function setmetatable_result1_2_upvr.Update(arg1, arg2, arg3, arg4, arg5) -- Line 93
	--[[ Upvalues[2]:
		[1]: any_getUserFlag_result1_upvr (readonly)
		[2]: module_upvr (readonly)
	]]
	local var59
	if any_getUserFlag_result1_upvr then
		var59 = CFrame.lookAlong(arg4.p, -arg3.LookVector) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
	else
		var59 = CFrame.new(arg4.p, arg3.p) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
	end
	return var59 * CFrame.new(0, 0, module_upvr.Update(arg2, var59, arg1.focusExtrapolator:Step(arg2, var59))), arg4
end
function setmetatable_result1_2_upvr.CharacterAdded(arg1, arg2, arg3) -- Line 117
end
function setmetatable_result1_2_upvr.CharacterRemoving(arg1, arg2, arg3) -- Line 121
end
function setmetatable_result1_2_upvr.OnCameraSubjectChanged(arg1, arg2) -- Line 124
end
return setmetatable_result1_2_upvr