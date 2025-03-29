--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.ClassicCamera
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:47:43
-- Luau version 6, Types version 3
-- Time taken: 0.002674 seconds

local module = require(script.Parent.Parent:WaitForChild("CommonUtils"):WaitForChild("FlagUtil"))
local module_upvr_2 = require(script.Parent:WaitForChild("CameraInput"))
local module_upvr_3 = require(script.Parent:WaitForChild("CameraUtils"))
local module_upvr = require(script.Parent:WaitForChild("BaseCamera"))
local setmetatable_result1_upvr = setmetatable({}, module_upvr)
setmetatable_result1_upvr.__index = setmetatable_result1_upvr
function setmetatable_result1_upvr.new() -- Line 41
	--[[ Upvalues[3]:
		[1]: module_upvr (readonly)
		[2]: setmetatable_result1_upvr (readonly)
		[3]: module_upvr_3 (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr.new(), setmetatable_result1_upvr)
	setmetatable_result1.isFollowCamera = false
	setmetatable_result1.isCameraToggle = false
	setmetatable_result1.lastUpdate = tick()
	setmetatable_result1.cameraToggleSpring = module_upvr_3.Spring.new(5, 0)
	return setmetatable_result1
end
function setmetatable_result1_upvr.GetCameraToggleOffset(arg1, arg2) -- Line 52
	--[[ Upvalues[2]:
		[1]: module_upvr_2 (readonly)
		[2]: module_upvr_3 (readonly)
	]]
	if arg1.isCameraToggle then
		if module_upvr_2.getTogglePan() then
			arg1.cameraToggleSpring.goal = math.clamp(module_upvr_3.map(arg1.currentSubjectDistance, 0.5, arg1.FIRST_PERSON_DISTANCE_THRESHOLD, 0, 1), 0, 1)
		else
			arg1.cameraToggleSpring.goal = 0
		end
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		return Vector3.new(0, arg1.cameraToggleSpring:step(arg2) * (math.clamp(module_upvr_3.map(arg1.currentSubjectDistance, 0.5, 64, 0, 1), 0, 1) + 1), 0)
	end
	return Vector3.new()
end
function setmetatable_result1_upvr.SetCameraMovementMode(arg1, arg2) -- Line 70
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	local SetCameraMovementMode_2 = module_upvr.SetCameraMovementMode
	SetCameraMovementMode_2(arg1, arg2)
	if arg2 ~= Enum.ComputerCameraMovementMode.Follow then
		SetCameraMovementMode_2 = false
	else
		SetCameraMovementMode_2 = true
	end
	arg1.isFollowCamera = SetCameraMovementMode_2
	if arg2 ~= Enum.ComputerCameraMovementMode.CameraToggle then
		SetCameraMovementMode_2 = false
	else
		SetCameraMovementMode_2 = true
	end
	arg1.isCameraToggle = SetCameraMovementMode_2
end
local any_getUserFlag_result1_upvr_2 = module.getUserFlag("UserCameraInputDt")
local cframe_upvr = CFrame.fromOrientation(-0.2617993877991494, 0, 0)
local Players_upvr = game:GetService("Players")
local const_number_upvw = 0
local any_getUserFlag_result1_upvr_3 = module.getUserFlag("UserFixCameraOffsetJitter2")
local any_getUserFlag_result1_upvr = module.getUserFlag("UserFixCameraFPError")
function setmetatable_result1_upvr.Update(arg1, arg2) -- Line 77
	--[[ Upvalues[8]:
		[1]: any_getUserFlag_result1_upvr_2 (readonly)
		[2]: cframe_upvr (readonly)
		[3]: Players_upvr (readonly)
		[4]: module_upvr_2 (readonly)
		[5]: const_number_upvw (read and write)
		[6]: any_getUserFlag_result1_upvr_3 (readonly)
		[7]: module_upvr_3 (readonly)
		[8]: any_getUserFlag_result1_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 7. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 8. Error Block 3 start (CF ANALYSIS FAILED)
	local CurrentCamera = workspace.CurrentCamera
	-- KONSTANTERROR: [9] 8. Error Block 3 end (CF ANALYSIS FAILED)
end
return setmetatable_result1_upvr