--[[
    Script: StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.LegacyCamera
    Type: ModuleScript
    Decompiled with Konstant using Nebula Decompiler
--]]

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-29 09:34:29
-- Luau version 6, Types version 3
-- Time taken: 0.001198 seconds

local module_upvr = require(script.Parent:WaitForChild("BaseCamera"))
local setmetatable_result1_2_upvr = setmetatable({}, module_upvr)
setmetatable_result1_2_upvr.__index = setmetatable_result1_2_upvr
function setmetatable_result1_2_upvr.new() -- Line 21
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: setmetatable_result1_2_upvr (readonly)
	]]
	local setmetatable_result1 = setmetatable(module_upvr.new(), setmetatable_result1_2_upvr)
	setmetatable_result1.cameraType = Enum.CameraType.Fixed
	setmetatable_result1.lastUpdate = tick()
	setmetatable_result1.lastDistanceToSubject = nil
	return setmetatable_result1
end
function setmetatable_result1_2_upvr.GetModuleName(arg1) -- Line 31
	return "LegacyCamera"
end
function setmetatable_result1_2_upvr.SetCameraToSubjectDistance(arg1, arg2) -- Line 36
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	return module_upvr.SetCameraToSubjectDistance(arg1, arg2)
end
local Players_upvr = game:GetService("Players")
local module_upvr_2 = require(script.Parent:WaitForChild("CameraInput"))
function setmetatable_result1_2_upvr.Update(arg1, arg2) -- Line 40
	--[[ Upvalues[2]:
		[1]: Players_upvr (readonly)
		[2]: module_upvr_2 (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 3. Error Block 2 start (CF ANALYSIS FAILED)
	do
		return nil, nil
	end
	-- KONSTANTERROR: [3] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 6. Error Block 3 start (CF ANALYSIS FAILED)
	local CurrentCamera = workspace.CurrentCamera
	-- KONSTANTERROR: [6] 6. Error Block 3 end (CF ANALYSIS FAILED)
end
return setmetatable_result1_2_upvr